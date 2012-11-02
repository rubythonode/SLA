package sla.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.social.connect.Connection;
import org.springframework.social.facebook.api.Facebook;
import org.springframework.social.facebook.api.FacebookLink;
import org.springframework.social.facebook.api.impl.FacebookTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import sla.model.KeyCount;
import sla.model.Page;
import sla.model.ShortUrl;
import sla.model.ShortUserInfoWithCount;
import sla.model.UserInfo;
import sla.model.VisitCount;
import sla.service.AnalyzeService;
import sla.social.SocialConfig;
import sla.util.AuthUtil;
import sla.util.ShortUrlUtil;

@Controller
@RequestMapping("func")
public class FuncController {

	@Autowired
	private AnalyzeService analyzeSerice;
	
	@Autowired
	private SocialConfig socialConfig;
	
	@RequestMapping("intro")
	public void intro() {
		// just view
	}
	
	@RequestMapping("button/intro")
	public void buttonIntro() {
		// just view
	}
	
	@RequestMapping("button/parameters")
	public void buttonParametersIntro() {
		// just view
	}
	
	@RequestMapping("page/create")
	public void createPage(@ModelAttribute("command") Page page) {
		// just view
	}
	
	@RequestMapping("sla/intro")
	public void slaIntro() {
		// just view
	}
	@RequestMapping("analyze")
	public String analyze(@RequestParam String shortUrl,Model model) {
		long id=ShortUrlUtil.complicatedRevert(shortUrl);
		if(ShortUrl.existsShortUrl(id)){
			ShortUrl shortUrlRecord=ShortUrl.findShortUrl(id);
			UserInfo sharer = analyzeSerice.getUserInfoWithShortUrl(shortUrl);
			System.out.println(sharer.toString());
			System.out.println(ShortUrl.getUserSharePostCount(sharer.getId()));
			System.out.println(VisitCount.getCountSumByUser(sharer.getId()));
			List<KeyCount> genderDistribution=ShortUrl.getUserGenderDistribution(shortUrlRecord.getHeadId());
			List<ShortUserInfoWithCount> countRecord=VisitCount.getCountRecordByUser(shortUrlRecord.getHeadId(), -1, 2013111000);
			System.out.println(countRecord);
			System.out.println(VisitCount.getCountRecordByUser(shortUrlRecord.getHeadId(), -1, 2011111000));
			model.addAttribute("sharer",sharer);
			model.addAttribute("countRecord",countRecord);
			model.addAttribute("genderDistribution",genderDistribution);
			return "func/analyze";
		}else {
			return "shortUrlNotFound";
		}
	}

	@RequestMapping(value = "reShare", method = RequestMethod.GET)
	public String reShare(@RequestParam String shortUrl, Model model) {
		long id=ShortUrlUtil.complicatedRevert(shortUrl);
		System.out.println("reshareId:"+id);
		if (ShortUrl.existsShortUrl(id)) {
			ShortUrl su = ShortUrl.findShortUrl(id);
			model.addAttribute("shortUrl", su);
			return "func/reShare";
		} else {
			return "shortUrlNotFound";
		}
	}

	@Secured("ROLE_USER")
	@RequestMapping(value = "share", method = RequestMethod.GET)
	public void share() {
		// just view
	}

	/*초기 공유(마케팅 담당자)
	 * reShare=true로 들어올 시 헤당 shortUrl*/
	@Secured("ROLE_USER")
	@ResponseBody
	@RequestMapping(value = "share", method = RequestMethod.POST)
	public boolean share(@Valid ShortUrl shortUrl,@RequestParam(required=false) boolean reShare
			,@RequestParam(required=false) String reShareShortUrl, BindingResult bindingResult,Model model, HttpServletRequest request) {
		if (bindingResult.hasErrors()) {
			return false;
		} else {
			shortUrl.setUserInfo(AuthUtil.getUserInfo());
			shortUrl.persist();
			String convertedShortUrl=ShortUrlUtil.complicatedConvert(shortUrl.getId());
			shortUrl.setShortUrl(convertedShortUrl);
			if(reShare){
				long headId=ShortUrlUtil.complicatedRevert(reShareShortUrl);
				if(ShortUrl.existsShortUrl(headId)){
					shortUrl.setHeadId(headId); //초기 공유의 경우 head_id를 현재 공유 정보의 id로 설정
				}
				
			}else{
				shortUrl.setHeadId(shortUrl.getId()); //초기 공유의 경우 head_id를 현재 공유 정보의 id로 설정
			}
			 
			shortUrl.merge();
			
			
			Connection<Facebook> connection = socialConfig.connectionRepository().findPrimaryConnection(Facebook.class);
			Facebook facebook = connection != null ? connection.getApi() : new FacebookTemplate();
			
			String shortUrlString = getUrlWithContextPath(request) + "/" + shortUrl.getShortUrl();
			
			FacebookLink link = new FacebookLink(shortUrlString, null, shortUrl.getUrl(), null);
			facebook.feedOperations().postLink(shortUrl.getContent(), link);
			
			return true;
		}
	}

	private static String getUrlWithContextPath(HttpServletRequest request) {
		return request.getScheme() + "://" + request.getServerName() + ":"
				+ request.getServerPort() + request.getContextPath();
	}

	@RequestMapping(value = "signin", method = RequestMethod.GET)
	public void signin() {
		// just view
	}

}
