package sla.social;


import javax.inject.Inject;
import javax.sql.DataSource;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.core.env.Environment;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.encrypt.Encryptors;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.social.connect.Connection;
import org.springframework.social.connect.ConnectionFactoryLocator;
import org.springframework.social.connect.ConnectionRepository;
import org.springframework.social.connect.UsersConnectionRepository;
import org.springframework.social.connect.jdbc.JdbcUsersConnectionRepository;
import org.springframework.social.connect.support.ConnectionFactoryRegistry;
import org.springframework.social.facebook.api.Facebook;
import org.springframework.social.facebook.api.impl.FacebookTemplate;
import org.springframework.social.facebook.connect.FacebookConnectionFactory;
import org.springframework.social.twitter.connect.TwitterConnectionFactory;

import sla.model.UserInfo;

@Configuration
@PropertySource("classpath:sla/social/config.properties")
public class SocialConfig {

	@Bean
	public ConnectionFactoryLocator connectionFactoryLocator() {
		ConnectionFactoryRegistry registry = new ConnectionFactoryRegistry();
		
		registry.addConnectionFactory(new FacebookConnectionFactory(environment
				.getProperty("facebook.appId"), environment
				.getProperty("facebook.appSecret")));
		
		registry.addConnectionFactory(new TwitterConnectionFactory(environment
				.getProperty("twitter.consumerKey"), environment
				.getProperty("twitter.consumerSecret")));
		
		return registry;
	}

	@Inject
	private Environment environment;

	@Bean
	public UsersConnectionRepository usersConnectionRepository() {
		JdbcUsersConnectionRepository repository = new JdbcUsersConnectionRepository(
				dataSource, connectionFactoryLocator(), Encryptors.noOpText());
		repository.setConnectionSignUp(new SocialConnectionSignUp());
		return repository;
	}

	@Inject
	private DataSource dataSource;
	
	@Bean
	@Scope(value="request", proxyMode=ScopedProxyMode.INTERFACES)	
	public ConnectionRepository connectionRepository() {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		if (authentication == null) {
			throw new IllegalStateException("Unable to get a ConnectionRepository: no user signed in");
		}
		if (authentication.getPrincipal() instanceof UserInfo) {
			UserInfo userInfo = (UserInfo) authentication.getPrincipal();
			return usersConnectionRepository().createConnectionRepository(userInfo.getId().toString());
		} else {
			return usersConnectionRepository().createConnectionRepository(authentication.getName());
		}
	}
	
	@Bean
	@Scope(value="request", proxyMode=ScopedProxyMode.INTERFACES)	
	public Facebook facebook() {
		Connection<Facebook> facebook = connectionRepository().findPrimaryConnection(Facebook.class);
		return facebook != null ? facebook.getApi() : new FacebookTemplate();
	}
	
	@Bean
	public SocialSignInController providerSignInController(RequestCache requestCache) {
		return new SocialSignInController(connectionFactoryLocator(), usersConnectionRepository(), new SocialSignInAdapter(requestCache));
	}

}
