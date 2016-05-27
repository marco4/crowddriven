package nl.waisda.interceptors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import nl.waisda.domain.User;
import nl.waisda.domain.UserBadges;
import nl.waisda.repositories.BadgesRepository;
import nl.waisda.repositories.TagEntryRepository;
import nl.waisda.repositories.UserBadgesRepository;
import nl.waisda.services.RankService;
import nl.waisda.services.UserService;
import nl.waisda.services.UserSessionService;
import nl.waisda.utils.Constants;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

@Component
public class BadgesInterceptor extends HandlerInterceptorAdapter {
	
	private Logger log = Logger.getLogger(BadgesInterceptor.class);

	@Autowired
	private UserSessionService userSessionService;
	
	@Autowired
	private RankService rankService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private TagEntryRepository tagRepo;
	
	@Autowired
	private BadgesRepository badgeRepo;
	
	@Autowired
	private UserBadgesRepository userBadgesRepo;
	
	@Override
	public void postHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
		User currentUser = userSessionService.getCurrentUser(request.getSession());
		
		if (currentUser != null) {
			int userId = currentUser.getId();
			
			// get number of matched tags
			int numMatchedTags = tagRepo.countMatchedTagsByUser(userId);
			int numUnmatchedTags = tagRepo.countUnmatchedTagsByUser(userId);
			int numDictTags = tagRepo.countDictionaryTagsByUser(userId);
			int numPioneerTags = tagRepo.countPioneerTagsByUser(userId);

			// count badges score
			int matchedId = badgeRepo.getBadgeId(numMatchedTags, Constants.BADGES_MATCHED);
			int unmatchedId = badgeRepo.getBadgeId(numUnmatchedTags, Constants.BADGES_UNMATCHED);
			int dictionaryId = badgeRepo.getBadgeId(numDictTags, Constants.BADGES_DICTIONARY);
			int pioneerId = badgeRepo.getBadgeId(numPioneerTags, Constants.BADGES_PIONEER);
			
			boolean isChanged = false;
			
			UserBadges userBadges = userBadgesRepo.getUserBadgeByOwnerId(userId);
			if (userBadges == null) {
				userBadges = new UserBadges();
				userBadges.setOwnerId(userId);
			}
			
			// check matched id
			if (matchedId > userBadges.getMatchedId()) {
				userBadges.setMatchedId(matchedId);
				isChanged = true;
			}
			
			// check unmatched id
			if (unmatchedId > userBadges.getUnmatchedId()) {
				userBadges.setUnmatchedId(unmatchedId);
				isChanged = true;
			}
			
			// check dictionary id
			if (dictionaryId > userBadges.getDictionaryId()) {
				userBadges.setDictionaryId(dictionaryId);
				isChanged = true;
			}
			
			// check pioneer id
			if (pioneerId > userBadges.getPioneerId()) {
				userBadges.setPioneerId(pioneerId);
				isChanged = true;
			}
			
			if (isChanged) {
				userBadgesRepo.store(userBadges);
			}
			
		}
	}
	
	
}
