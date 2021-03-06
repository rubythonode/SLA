// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package sla.model;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;
import sla.model.UserAchieve;

privileged aspect UserAchieve_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager UserAchieve.entityManager;
    
    public static final EntityManager UserAchieve.entityManager() {
        EntityManager em = new UserAchieve().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long UserAchieve.countUserAchieves() {
        return entityManager().createQuery("SELECT COUNT(o) FROM UserAchieve o", Long.class).getSingleResult();
    }
    
    public static List<UserAchieve> UserAchieve.findAllUserAchieves() {
        return entityManager().createQuery("SELECT o FROM UserAchieve o", UserAchieve.class).getResultList();
    }
    
    public static UserAchieve UserAchieve.findUserAchieve(Long id) {
        if (id == null) return null;
        return entityManager().find(UserAchieve.class, id);
    }
    
    public static List<UserAchieve> UserAchieve.findUserAchieveEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM UserAchieve o", UserAchieve.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void UserAchieve.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void UserAchieve.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            UserAchieve attached = UserAchieve.findUserAchieve(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void UserAchieve.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void UserAchieve.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public UserAchieve UserAchieve.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        UserAchieve merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
