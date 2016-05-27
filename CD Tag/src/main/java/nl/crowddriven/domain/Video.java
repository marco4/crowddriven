/*  This file is part of Waisda 

    Copyright (c) 2012 Netherlands Institute for Sound and Vision
    https://github.com/beeldengeluid/waisda
	
    Waisda is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    Waisda is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with Waisda.  If not, see <http://www.gnu.org/licenses/>.
*/

package nl.waisda.domain;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import org.hibernate.annotations.Formula;

@Entity
public class Video {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;

	@Basic
	private String title;

	/** Duration in ms. */
	@Column(nullable = false)
	private int duration;

	@Basic
	@Column(length = 1024)
	private String imageUrl;
	@Basic
	@Column(length = 1024)
	private String imageThumbUrl;
	@Basic
	private boolean enabled;

	@Formula("(SELECT COUNT(*) FROM Game g WHERE g.video_id = id)")
	private int timesPlayed;

	@Formula("(SELECT d.t_shared_twitter FROM dive.videoFragments d WHERE d.id = id)")
	private int highscore;

	@Formula("(SELECT d.t_shared_twitter FROM dive.videoFragments d WHERE d.id = id)")
	private int twitterShares;

	@Formula("(SELECT d.t_pinned_pinterest FROM dive.videoFragments d WHERE d.id = id)")
	private int pinterestPins;

	@Formula("(SELECT d.t_clicked FROM dive.videoFragments d WHERE d.id = id)")
	private int diveClicks;

	@Enumerated(EnumType.STRING)
	private PlayerType playerType;

	@Basic
	private String fragmentID;

	/** Start time within episode, in ms. */
	@Basic
	private Integer startTime;

	/** Fragmentenrubriek zoals in MBH dump. */
	private Integer sectionNid;

	@Column(length = 1024)
	private String sourceUrl;
	
	@Basic
	private String channel;

	public int getId() {
		return id;
	}

	public String getTitle() {
		return title;
	}

	public int getDuration() {
		return duration;
	}

	public String getImageUrl() {
		return imageUrl;
	}
	public String getImageThumbUrl() {
		return imageThumbUrl;
	}
	public boolean isEnabled() {
		return enabled;
	}
	public int getTimesPlayed() {
		return timesPlayed;
	}
	public int getHighscore() {
		return highscore;
	}
	public int getTwitterShares() {
		return twitterShares;
	}
	public int getPinterestPins() {
		return pinterestPins;
	}
	public int getDiveClicks() {
		return diveClicks;
	}
	public String getChannel() {
		return channel;
	}

	public PlayerType getPlayerType() {
		return playerType;
	}

	public String getFragmentID() {
		return fragmentID;
	}

	public Integer getStartTime() {
		return startTime;
	}

	public Integer getSectionNid() {
		return sectionNid;
	}

	public String getSourceUrl() {
		return sourceUrl;
	}

	public String getPrettyDuration() {
		return TagEntry.getFriendlyTime(duration);
	}

    public void setId(int id) {
        this.id = id;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public void setDuration(int duration) {
        this.duration = duration;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public void setImageThumbUrl(String imageThumbUrl) {
        this.imageThumbUrl = imageThumbUrl;
    }
    public void setEnabled(boolean enabled) {
        this.enabled = enabled;
    }

    public void setPlayerType(PlayerType playerType) {
        this.playerType = playerType;
    }

    public void setFragmentID(String fragmentID) {
        this.fragmentID = fragmentID;
    }

    public void setStartTime(Integer startTime) {
        this.startTime = startTime;
    }

    public void setSectionNid(Integer sectionNid) {
        this.sectionNid = sectionNid;
    }

    public void setSourceUrl(String sourceUrl) {
        this.sourceUrl = sourceUrl;
    }
    
	public void setChannel(String channel) {
		this.channel = channel;
	}

	@Override
    public String toString() {
        final StringBuffer sb = new StringBuffer();
        sb.append("Video");
        sb.append("{id=").append(id);
        sb.append(", title='").append(title).append('\'');
        sb.append(", duration=").append(duration);
        sb.append(", imageUrl='").append(imageUrl).append('\'');
        sb.append(", imageThumbUrl='").append(imageThumbUrl).append('\'');
        sb.append(", enabled=").append(enabled);
        sb.append(", timesPlayed=").append(timesPlayed);
        sb.append(", highscore=").append(highscore);
        sb.append(", twitterShares=").append(twitterShares);     
        sb.append(", pinterestPins=").append(pinterestPins);     
        sb.append(", diveClicks=").append(diveClicks);     
        sb.append(", playerType=").append(playerType);
        sb.append(", fragmentID='").append(fragmentID).append('\'');
        sb.append(", startTime=").append(startTime);
        sb.append(", sectionNid=").append(sectionNid);
        sb.append(", sourceUrl='").append(sourceUrl).append('\'');
        sb.append(", channel='").append(channel).append('\'');
        sb.append('}');
        return sb.toString();
    }
}