// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package kr.co.siterush.model;

import java.util.Date;
import kr.co.siterush.model.UserInfo;

privileged aspect UserInfo_Roo_JavaBean {
    
    public Date UserInfo.getJoinDate() {
        return this.joinDate;
    }
    
    public void UserInfo.setJoinDate(Date joinDate) {
        this.joinDate = joinDate;
    }
    
    public Date UserInfo.getLastLoginDate() {
        return this.lastLoginDate;
    }
    
    public void UserInfo.setLastLoginDate(Date lastLoginDate) {
        this.lastLoginDate = lastLoginDate;
    }
    
    public int UserInfo.getLoginCount() {
        return this.loginCount;
    }
    
    public void UserInfo.setLoginCount(int loginCount) {
        this.loginCount = loginCount;
    }
    
    public boolean UserInfo.isSocialUser() {
        return this.socialUser;
    }
    
    public void UserInfo.setSocialUser(boolean socialUser) {
        this.socialUser = socialUser;
    }
    
    public String UserInfo.getSocialDisplayName() {
        return this.socialDisplayName;
    }
    
    public void UserInfo.setSocialDisplayName(String socialDisplayName) {
        this.socialDisplayName = socialDisplayName;
    }
    
    public String UserInfo.getSocialImageUrl() {
        return this.socialImageUrl;
    }
    
    public void UserInfo.setSocialImageUrl(String socialImageUrl) {
        this.socialImageUrl = socialImageUrl;
    }
    
    public String UserInfo.getSocialProfileUrl() {
        return this.socialProfileUrl;
    }
    
    public void UserInfo.setSocialProfileUrl(String socialProfileUrl) {
        this.socialProfileUrl = socialProfileUrl;
    }
    
    public String UserInfo.getSocialProviderId() {
        return this.socialProviderId;
    }
    
    public void UserInfo.setSocialProviderId(String socialProviderId) {
        this.socialProviderId = socialProviderId;
    }
    
    public String UserInfo.getSocialProviderUserId() {
        return this.socialProviderUserId;
    }
    
    public void UserInfo.setSocialProviderUserId(String socialProviderUserId) {
        this.socialProviderUserId = socialProviderUserId;
    }
    
}
