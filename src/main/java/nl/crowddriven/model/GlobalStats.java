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

package nl.waisda.model;

import java.util.List;

import nl.waisda.domain.User;
public class GlobalStats {


	private final int totalTags;
	private final int totalMatches;
	private List<TagCloudItem> tagCloud;
	private TopScores topScores;
	private final int currentlyPlaying;
	private final int totalHours;
	private final int totalScores;
	private final List<User> mostRankUsers;
	private final List<TopTags> mostTagUsers;
	private final int totalDiveSearches;
	private final int totalDiveClicks;
	private final int totalDiveCurated;
	private final int totalUsers;
	private final int totalRegisteredUsers;
	private final int totalRealPersonTags;
	private final int totalFictionalPersonTags;
	private final int totalRealLocationTags;
	private final int totalFictionalLocationTags;
	private final int totalEventTags;
	private final int totalMatchedTags;
	private final int totalUnmatchedTags;	
	private final int totalDictionaryTags;	
	private final int totalPioneerTags;	
	private final int totalUniqueTags;
	private final List<GameScore> recentGamesTotal;
	private final List<GameScore> mostPopularGamesTotal;
	
	public GlobalStats(List<GameScore> recentGamesTotal, int totalTags, int totalMatches,
			List<TagCloudItem> tagCloud, TopScores topScores,
			int currentlyPlaying, int totalHours, int totalScores,
			List<User> mostRankUsers, List<TopTags> mostTagUsers, int totalDiveSearches, int totalDiveClicks, int totalDiveCurated, int totalUsers, int totalRegisteredUsers, int totalRealPersonTags,	int totalFictionalPersonTags,
	 int totalRealLocationTags, int totalFictionalLocationTags, int totalEventTags, int totalMatchedTags, int totalUnmatchedTags, int totalDictionaryTags, int totalPioneerTags, int totalUniqueTags, List<GameScore> mostPopularGamesTotal) {
		this.totalTags = totalTags;
		this.totalMatches = totalMatches;
		this.tagCloud = tagCloud;
		this.topScores = topScores;
		this.currentlyPlaying = currentlyPlaying;
		this.totalHours = totalHours;
		this.totalScores = totalScores;
		this.mostRankUsers = mostRankUsers;
		this.mostTagUsers = mostTagUsers;
		this.totalDiveSearches = totalDiveSearches;
		this.totalDiveClicks = totalDiveClicks;
		this.totalDiveCurated = totalDiveCurated;
		this.totalUsers = totalUsers;
		this.totalRegisteredUsers = totalRegisteredUsers;
		this.totalRealPersonTags = totalRealPersonTags;
		this.totalFictionalPersonTags = totalFictionalPersonTags;
		this.totalRealLocationTags = totalRealLocationTags;
		this.totalFictionalLocationTags = totalFictionalLocationTags;
		this.totalEventTags = totalEventTags;
		this.totalMatchedTags = totalMatchedTags;
		this.totalUnmatchedTags = totalUnmatchedTags;
		this.totalDictionaryTags = totalDictionaryTags;
		this.totalPioneerTags = totalPioneerTags;
		this.totalUniqueTags = totalUniqueTags;	
		this.recentGamesTotal = recentGamesTotal;	
		this.mostPopularGamesTotal = mostPopularGamesTotal;
	}

	public List<GameScore> getRecentGamesTotal() {
		return recentGamesTotal;
	}
	public List<GameScore> getMostPopularGamesTotal() {
		return mostPopularGamesTotal;
	}

	public int getTotalTags() {
		return totalTags;
	}
	public int getTotalUsers() {
		return totalUsers;
	}
	public int getTotalRegisteredUsers() {
		return totalRegisteredUsers;
	}
	public int getTotalMatches() {
		return totalMatches;
	}

	public static int round(int n) {
		if (n < 100) {
			return n;
		} else if (n < 1000) {
			return n / 10 * 10;
		} else if (n < 10000) {
			return n / 100 * 100;
		} else {
			return n / 1000 * 1000;
		}
	}

	public int getTotalDiveSearches() {
		return totalDiveSearches;
	}
	public int getTotalDiveClicks() {
		return totalDiveClicks;
	}
	public int getTotalDiveCurated() {
		return totalDiveCurated;
	}
	public List<TagCloudItem> getTagCloud() {
		return tagCloud;
	}

	public TopScores getTopScores() {
		return topScores;
	}

	public int getCurrentlyPlaying() {
		return currentlyPlaying;
	}

	public int getTotalHours() {
		return totalHours;
	}

	public int getTotalScores() {
		return totalScores;
	}

	public List<User> getMostRankUsers() {
		return mostRankUsers;
	}

	public List<TopTags> getMostTagUsers() {
		return mostTagUsers;
	}
	public int getTotalRealPersonTags() {
		return totalRealPersonTags;
	}
	public int getTotalFictionalPersonTags() {
		return totalFictionalPersonTags;
	}
	public int getTotalRealLocationTags() {
		return totalRealLocationTags;
	}
	public int getTotalFictionalLocationTags() {
		return totalFictionalLocationTags;
	}
	public int getTotalEventTags() {
		return totalEventTags;
	}
	public int getTotalMatchedTags() {
		return totalMatchedTags;
	}
	public int getTotalUnmatchedTags() {
		return totalUnmatchedTags;
	}
	public int getTotalDictionaryTags() {
		return totalDictionaryTags;
	}
	public int getTotalPioneerTags() {
		return totalPioneerTags;
	}
	public int getTotalUniqueTags() {
		return totalUniqueTags;
	}

}
