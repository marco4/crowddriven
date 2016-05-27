package nl.waisda.services;

import nl.waisda.domain.Rank;
import nl.waisda.repositories.RankRepository;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RankService {
	
	private Logger log = Logger.getLogger(RankService.class);

	@Autowired
	private RankRepository rankRepository;
	
	public Rank getNextRank(int id) {
		Rank rank = null;
		try {
			rank = rankRepository.getNextRank(id);
		} catch (Exception e) {
			log.error("Fail to get next rank", e);
		}
		
		return rank;
	}
	
}
