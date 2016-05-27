package nl.waisda.interceptors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import nl.waisda.domain.Rank;
import nl.waisda.domain.User;
import nl.waisda.services.RankService;
import nl.waisda.services.UserService;
import nl.waisda.services.UserSessionService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

@Component
public class RankInterceptor extends HandlerInterceptorAdapter {

	@Autowired
	private UserSessionService userSessionService;
	
	@Autowired
	private RankService rankService;
	
	@Autowired
	private UserService userService;
	
	@Override
	public void postHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
		User currentUser = userSessionService.getCurrentUser(request.getSession());
		
		if (currentUser != null) {
			int totalScore = currentUser.getTotalScore();

			Rank rank = currentUser.getRank();
			if (rank == null) {
				rank = new Rank();
				rank.setId(1);
			}
			
			Rank nextRank = rankService.getNextRank(rank.getId());
			
			if (totalScore >= nextRank.getScoring()) {
				currentUser.setRank(nextRank);
				userService.store(currentUser);
				
				String msg = "New rank is received";
				HttpSession session = request.getSession(true);
				session.setAttribute("rankNotification", msg);
			}
		}
	}
	
}