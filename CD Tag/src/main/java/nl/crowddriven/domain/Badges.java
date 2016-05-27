package nl.waisda.domain;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Badges {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	
	@Basic
	private String title;
	
	@Basic
	private int scoring;

	@Basic
	private String imageUrl;
	
	@Basic
	@Column(name = "badge_group")
	private int group;
	
	public Badges() {}
	

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}


	public int getScoring() {
		return scoring;
	}


	public void setScoring(int scoring) {
		this.scoring = scoring;
	}


	public int getGroup() {
		return group;
	}


	public void setGroup(int group) {
		this.group = group;
	}
	
}
