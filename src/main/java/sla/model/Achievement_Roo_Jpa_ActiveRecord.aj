// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package sla.model;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;
import sla.model.Achievement;

privileged aspect Achievement_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager Achievement.entityManager;
    
    public static final EntityManager Achievement.entityManager() {
        EntityManager em = new Achievement().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Achievement.countAchievements() {
        return entityManager().createQuery("SELECT COUNT(o) FROM Achievement o", Long.class).getSingleResult();
    }
    
    public static List<Achievement> Achievement.findAllAchievements() {
        return entityManager().createQuery("SELECT o FROM Achievement o", Achievement.class).getResultList();
    }
    
    public static Achievement Achievement.findAchievement(Long id) {
        if (id == null) return null;
        return entityManager().find(Achievement.class, id);
    }
    
    public static List<Achievement> Achievement.findAchievementEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM Achievement o", Achievement.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void Achievement.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Achievement.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Achievement attached = Achievement.findAchievement(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Achievement.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void Achievement.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public Achievement Achievement.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Achievement merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
