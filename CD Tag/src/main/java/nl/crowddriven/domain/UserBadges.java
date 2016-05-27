package nl.waisda.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "User_Badges")
public class UserBadges {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	
	@Column(name = "owner_id")
	private int ownerId;
	
	@Column(name = "matched_id")
	private int matchedId;
	
	@Column(name = "unmatched_id")
	private int unmatchedId;
	
	@Column(name = "dictionary_id")
	private int dictionaryId;
	
	@Column(name = "pioneer_id")
	private int pioneerId;

	@Column(name = "campaign_id")
	private int campaignId;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getOwnerId() {
		return ownerId;
	}

	public void setOwnerId(int ownerId) {
		this.ownerId = ownerId;
	}

	public int getMatchedId() {
		return matchedId;
	}

	public void setMatchedId(int matchedId) {
		this.matchedId = matchedId;
	}

	public int getUnmatchedId() {
		return unmatchedId;
	}

	public void setUnmatchedId(int unmatchedId) {
		this.unmatchedId = unmatchedId;
	}

	public int getDictionaryId() {
		return dictionaryId;
	}

	public void setDictionaryId(int dictionaryId) {
		this.dictionaryId = dictionaryId;
	}

	public int getPioneerId() {
		return pioneerId;
	}

	public void setPioneerId(int pioneerId) {
		this.pioneerId = pioneerId;
	}

	public int getCampaignId() {
		return campaignId;
	}

	public void setCampaignId(int campaignId) {
		this.campaignId = campaignId;
	}
	
}
