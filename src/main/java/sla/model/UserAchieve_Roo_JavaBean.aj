// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package sla.model;

import java.util.Date;
import sla.model.Achievement;
import sla.model.UserAchieve;
import sla.model.UserInfo;

privileged aspect UserAchieve_Roo_JavaBean {
    
    public UserInfo UserAchieve.getUserInfo() {
        return this.userInfo;
    }
    
    public void UserAchieve.setUserInfo(UserInfo userInfo) {
        this.userInfo = userInfo;
    }
    
    public Achievement UserAchieve.getAchievement() {
        return this.achievement;
    }
    
    public void UserAchieve.setAchievement(Achievement achievement) {
        this.achievement = achievement;
    }
    
    public Date UserAchieve.getAcquireDate() {
        return this.acquireDate;
    }
    
    public void UserAchieve.setAcquireDate(Date acquireDate) {
        this.acquireDate = acquireDate;
    }
    
    public boolean UserAchieve.isIdentified() {
        return this.identified;
    }
    
    public void UserAchieve.setIdentified(boolean identified) {
        this.identified = identified;
    }
    
}
