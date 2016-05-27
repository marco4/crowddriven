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

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.TypedQuery;

import nl.waisda.domain.Rank;
import nl.waisda.domain.User;
import nl.waisda.domain.UserScore;
import nl.waisda.model.TopScores;
import nl.waisda.model.TopTags;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;


@Repository
@Transactional
public class UserRepository extends AbstractRepository<User> {

	public UserRepository() {
		super(User.class);
	}
	
	@Transactional
	@Override
	public void store(User user) {
		super.store(user);
	}
	
	public User getUserByCredentials(String emailaddress, String password) {
		TypedQuery<User> query = getEntityManager().createQuery("SELECT u FROM User u WHERE u.email = :email AND t.password = :password", User.class);
		query.setParameter("email", emailaddress);
		query.setParameter("password", password);
		return getSingleResult(query);
	}

	public User getUserByEmail(String emailaddress) {
		TypedQuery<User> query = getEntityManager().createQuery("SELECT u FROM User u WHERE u.email = :email", User.class);
		query.setParameter("email", emailaddress);
		return getSingleResult(query);
	}

	public User getUserByName(String name) {
		TypedQuery<User> query = getEntityManager().createQuery("SELECT u FROM User u WHERE u.name = :name", User.class);
		query.setParameter("name", name);
		return getSingleResult(query);
	}

	/** Warning: User objects returned only have their id, name and email set! */
	public TopScores getTopScores() {
		String q = "select u.id, u.email, u.name, u.imageUrl, sum(t.score) from User u "
				+ "inner join TagEntry t on t.owner_id = u.id "
				+ "where u.email is not null "
				+ "group by u.id having sum(t.score) > 0 order by sum(score) desc";
		@SuppressWarnings("unchecked")
		List<Object[]> results = getEntityManager().createNativeQuery(q)
				.getResultList();
		ArrayList<UserScore> scores = new ArrayList<UserScore>(results.size());
		int i = 0;
		for (Object[] row : results) {
			User u = new User();
			u.setId((int) (Integer) row[0]);
			u.setEmail((String) row[1]);
			u.setName((String) row[2]);
			u.setImageUrl((String) row[3]);
			int score = ((Number) row[4]).intValue();

			UserScore us = new UserScore(u, score);

			us.setPosition(i);
			scores.add(us);
			i++;
		}
		return new TopScores(scores);
	}
	
	public List<User> getTopRanking() {
		String q = "select u.id, u.email, u.name,  r.id, r.title, r.scoring, r.imageUrlrank, u.imageUrl, sum(t.score) from User u " +
				"inner join Rank r on u.rank_id = r.id " 
				+ "inner join TagEntry t on t.owner_id = u.id "
				+ "where u.email is not null " 
				+ "group by u.id having sum(t.score) > 0 "
				+ "order by sum(t.score) desc limit 10";
		@SuppressWarnings("unchecked")
		List<Object[]> results = getEntityManager().createNativeQuery(q).getResultList();
		List<User> users = new ArrayList<User>(results.size());
		int i = 0;
		
		Rank rank;
		for (Object[] row : results) {
			User u = new User();
			u.setId((int) (Integer) row[0]);
			if (row[1]!= null){
				u.setEmail((String) row[1]);
			}
			if (row[2]!= null){
				u.setName((String) row[2]);
			}
			
			u.setImageUrl((String) row[7]);
			rank = new Rank();
			rank.setId((Integer) row[3]);
			rank.setTitle((String) row[4]);
			rank.setScoring((Integer) row[5]);
			rank.setImageUrlRank((String) row[6]);
			
			u.setRank(rank);
			
			users.add(u);
		}
		
		return users;
	}
	
	
	public List<TopTags> getTopTags() {
		String q = "select u.name, u.id, u.imageUrl, count(t.tag) from User u " +
				"inner join TagEntry t on u.id = t.owner_id " +
				"where u.email is not null and t.creationDate >= date(now() - interval 6 day) " +
				"group by t.owner_id order by count(t.tag) desc " +
				"limit 10 ";
		@SuppressWarnings("unchecked")
		List<Object[]> results = getEntityManager().createNativeQuery(q).getResultList();
		List<TopTags> listTags = new ArrayList<TopTags>(results.size());
		
		TopTags tag;
		for (Object[] row : results) {
			tag = new TopTags();
			tag.setName((String) row[0]);
			tag.setId((int) (Integer) row[1]);
			tag.setImageUrl((String) row[2]);
			tag.setTotalTags(((BigInteger) row[3]).intValue());
			
			listTags.add(tag);
		}
		
		return listTags;
	}


}
