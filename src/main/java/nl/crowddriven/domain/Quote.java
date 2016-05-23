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
public class Quote {

	@Id

	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;

	@Basic
	private String season;

	@Basic
	private String character;

	@Basic
	private String quote;


	/*@Formula("(SELECT COUNT(*) FROM Game g WHERE g.video_id = id)")
	private int timesPlayed;*/

	/* Getters */ 
	
	public int getId() {
		return id;
	}

	public String getSeason() {
		return season;
	}

	public String getCharacter() {
		return character;
	}

	/*public int getTimesPlayed() {
		return timesPlayed;
	}*/

	public String getQuote() {
		return quote;
	}

	/* Setters */ 
    public void setId(int id) {
        this.id = id;
    }

    public void setSeason(String season) {
        this.season = season;
    }

    public void setCharacter(String character) {
        this.character = character;
    }

       public void setQuote(String quote) {
        this.quote = quote;
    }

}
