package sla.model;

import javax.persistence.Column;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class Page {
	
	@Size(max = 500)
	@NotEmpty
	@Column(length = 500, nullable = false)
	private String title;

	@Size(max = 3000)
	@Column(length = 3000)
	private String content;
	
}
