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

import javax.persistence.Query;

import nl.waisda.domain.Badges;
import nl.waisda.services.ScoringServiceIF;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;


@Repository
@Transactional
public class BadgesRepository extends AbstractRepository<Badges> {

	private Logger log = Logger.getLogger(BadgesRepository.class);
	
	@Autowired
	private ScoringServiceIF scoringService;

	public BadgesRepository() {
		super(Badges.class);
	}
	
	@Override
	public void store(Badges badges) {
		super.store(badges);
		getEntityManager().flush();
		getEntityManager().refresh(badges);
	}

	public int getBadgeScore(int score, int group) {
		Query q = getEntityManager().createQuery("SELECT scoring FROM Badges WHERE scoring > :score and badge_group = :group");
		q.setParameter("score", score);
		q.setParameter("group", group);
		q.setMaxResults(1);
		
		try {
			return (Integer) q.getSingleResult();
		} catch (Exception e) {
			return 0;
		}
	}
	
	public int getBadgeId(int score, int group) {
		Query q = getEntityManager().createQuery("SELECT id FROM Badges WHERE scoring <= :score and badge_group = :group order by scoring desc");
		q.setParameter("score", score);
		q.setParameter("group", group);
		q.setMaxResults(1);
		
		try {
			return (Integer) q.getSingleResult();
		} catch (Exception e) {
			return 0;
		}
	}
	
	
}
