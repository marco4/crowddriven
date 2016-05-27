package nl.waisda.repositories;

import java.util.List;

import javax.persistence.TypedQuery;

import nl.waisda.domain.Rank;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Repository;

@Repository
public class RankRepository extends AbstractRepository<Rank> {

	private Logger log = Logger.getLogger(RankRepository.class);
	
	public RankRepository() {
		super(Rank.class);
	}

	public Rank getNextRank(int id) {
		TypedQuery<Rank> query = getEntityManager()
				.createQuery(
						"SELECT r from Rank r WHERE r.id = :id",
						Rank.class);
		query.setParameter("id", id + 1);
		List<Rank> resultList = query.getResultList();
		
		if (resultList.size() > 0) {
			return resultList.get(0);
		}
		
		return null;
	}
	
	
}
