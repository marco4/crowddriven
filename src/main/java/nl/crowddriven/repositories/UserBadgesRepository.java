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

import nl.waisda.domain.UserBadges;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;


@Repository
@Transactional
public class UserBadgesRepository extends AbstractRepository<UserBadges> {

	public UserBadgesRepository() {
		super(UserBadges.class);
	}
	
	@Transactional
	@Override
	public void store(UserBadges userBadges) {
		super.store(userBadges);
	}
	
	public UserBadges getUserBadgeByOwnerId(int ownerId) {
		String q = "SELECT ub FROM UserBadges ub WHERE ub.ownerId = :ownerId";
        List<UserBadges> resultList = null;
		TypedQuery<UserBadges> query = getEntityManager().createQuery(q, UserBadges.class);
		query.setParameter("ownerId", ownerId);
		query.setMaxResults(1);
		resultList = query.getResultList();
		if (resultList != null && resultList.size() > 0) {
		    return resultList.get(0);
        }
        return null;
	}
	
}
