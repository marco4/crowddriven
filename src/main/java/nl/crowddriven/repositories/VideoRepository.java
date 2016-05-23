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

package nl.waisda.repositories;

import java.util.List;

import javax.persistence.TypedQuery;

import nl.waisda.domain.Video;
import nl.waisda.domain.Game;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Repository
public class VideoRepository extends AbstractRepository<Video> {

	public static final int NCHANNELS = 50;

	public VideoRepository() {
		super(Video.class);
	}
	private Logger log = Logger.getLogger(Video.class);

    public Video getBySourceUrl(final String sourceUrl) {
		String q = "SELECT v FROM Video v WHERE v.sourceUrl = :url ORDER BY v.id DESC";
        List<Video> resultList = null;
		TypedQuery<Video> query = getEntityManager()
				.createQuery(q, Video.class);
		query.setParameter("url", sourceUrl);
		query.setMaxResults(1);
		resultList = query.getResultList();
		if (resultList != null && resultList.size() > 0) {
		    return resultList.get(0);
        }
        return null;
    }

	/**
	 * Currently this method makes a random, unbiased selection. If you would
	 * like to filter certain video's, or use statistics to influence the video
	 * selection, you can do that here.
	 */
	public List<Video> getFeaturedVideos() {
		String q = "SELECT v FROM Video v WHERE v.enabled = true ORDER BY RAND()";
		// Hibernate requires the "= true"

		TypedQuery<Video> query = getEntityManager()
				.createQuery(q, Video.class);
		query.setMaxResults(NCHANNELS);
		return query.getResultList();

	}

	/**
	 * Currently this method makes a list of descending videos based on scoring per video, unbiased selection. If you would
	 */

	public List<Video> getFeaturedVideosMostTags() {
		String q = "select v from Video v, Game g " +
		    " inner join g.video WHERE g.video = v.id " +
		    " GROUP BY v.id order by MAX(g.countExistingVideoTags) desc";
		
		TypedQuery<Video> query = getEntityManager()
				.createQuery(q, Video.class);
		query.setMaxResults(NCHANNELS);


		return query.getResultList();
	}

	public List<Video> 	getFeaturedVideosHighestScore() {
		String q = "SELECT v FROM TagEntry t, Video v, Game g "
				+ " Where v.id = g.video and t.game = g.id " 
				+ " GROUP BY v.id ORDER BY MAX(t.score) desc";

		TypedQuery<Video> query = getEntityManager()
				.createQuery(q, Video.class);
		query.setMaxResults(NCHANNELS);

		//log.info(query.getResultList());
		return query.getResultList();
	}


	
	/**
	 * Currently this method makes a random, unbiased selection. If you would
	 * like to filter certain video's, or use statistics to influence the video
	 * selection, you can do that here.
	 */
	public List<Video> getVideosByChannel(String channel) {
		String q = "SELECT v FROM Video v WHERE v.enabled = true AND v.channel = :channel ORDER BY RAND()";
		// Hibernate requires the "= true"

		TypedQuery<Video> query = getEntityManager()
				.createQuery(q, Video.class);
		query.setMaxResults(NCHANNELS);
		query.setParameter("channel", channel);
		return query.getResultList();
	}
	


	public int getHighscore(int videoId) {
		String q = "SELECT MAX(score) FROM (SELECT SUM(t.score) AS score "
				+ "FROM TagEntry t INNER JOIN Game g on t.game_id = g.id "
				+ "WHERE g.video_id = :videoId GROUP BY g.id) games";
		Object result = getEntityManager().createNativeQuery(q)
				.setParameter("videoId", videoId).getSingleResult();
		if (result == null) {
			return 0;
		} else {
			return ((Number) result).intValue();
		}
	}
	public int getTwitterShare(int videoId) {
		String q = "SELECT d.t_shared_twitter FROM dive.videoFragments d WHERE d.id = :videoId";
		Object result = getEntityManager().createNativeQuery(q)
				.setParameter("videoId", videoId).getSingleResult();
		if (result == null) {
			return 0;
		} else {
			return ((Number) result).intValue();
		}
	}
	public int getPinterestPin(int videoId) {
		String q = "SELECT d.t_pinned_pinterest FROM dive.videoFragments d WHERE d.id = :videoId";
		Object result = getEntityManager().createNativeQuery(q)
				.setParameter("videoId", videoId).getSingleResult();
		if (result == null) {
			return 0;
		} else {
			return ((Number) result).intValue();
		}
	}
	public int getDiveClicks(int videoId) {
		String q = "SELECT d.t_clicked FROM dive.videoFragments d WHERE d.id = :videoId";
		Object result = getEntityManager().createNativeQuery(q)
				.setParameter("videoId", videoId).getSingleResult();
		if (result == null) {
			return 0;
		} else {
			return ((Number) result).intValue();
		}
	}

	public List<Video> getTopVideosForTag(String normalizedTag, int maxResults) {
		String q = "SELECT t.game.video FROM TagEntry t "
				+ "WHERE t.normalizedTag = :normalizedTag "
				+ "GROUP BY t.game.video.id ORDER BY COUNT(t.game.video.id) DESC";

		TypedQuery<Video> query = getEntityManager()
				.createQuery(q, Video.class);
		query.setParameter("normalizedTag", normalizedTag);
		query.setMaxResults(maxResults);
		return query.getResultList();
	}
	public List<Video> getVideosWithTag() {
		String q = "SELECT t.game.video FROM TagEntry t "
				+ "GROUP BY t.game.video.id ORDER BY COUNT(t.game.video.id) DESC";

		TypedQuery<Video> query = getEntityManager()
				.createQuery(q, Video.class);
		return query.getResultList();
	}
}
