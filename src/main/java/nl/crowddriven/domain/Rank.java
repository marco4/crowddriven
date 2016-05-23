package nl.waisda.domain;
import nl.waisda.domain.User;

import javax.persistence.Basic;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Rank {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	
	@Basic
	private String title;
	
	@Basic
	private int scoring;



		@Basic
	private String imageUrlRank;
	
	public Rank() {}
	

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




	public String getImageUrlRank() {
		return imageUrlRank;
	}

	public void setImageUrlRank(String imageUrlRank) {
		this.imageUrlRank = imageUrlRank;
	}


	public int getScoring() {
		return scoring;
	}


	public void setScoring(int scoring) {
		this.scoring = scoring;
	}
	
	
	
}
