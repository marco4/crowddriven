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

package nl.waisda.controllers;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServletRequest;

import nl.waisda.domain.Badges;
import nl.waisda.domain.Rank;
import nl.waisda.domain.User;
import nl.waisda.domain.UserBadges;
import nl.waisda.model.Channel;
import nl.waisda.repositories.BadgesRepository;
import nl.waisda.repositories.TagEntryRepository;
import nl.waisda.repositories.UserBadgesRepository;
import nl.waisda.services.RankService;
import nl.waisda.services.UserSessionService;
import nl.waisda.services.VideoService;
import nl.waisda.utils.Constants;
import nl.waisda.utils.MonthEnum;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import nl.waisda.utils.Log4jPrefix;
import nl.waisda.utils.IpUtil;
import nl.waisda.forms.LoginForm;
import nl.waisda.forms.RegisterForm;
import nl.waisda.forms.RequestResetForm;


@Controller
public class InfoController {
	private static final Logger LOGGER = Logger.getLogger(HomeController.class);
	@Autowired
	private RankService rankService;

	@Autowired
	private BadgesRepository badgeRepo;

	@Autowired
	private TagEntryRepository tagRepo;

	@Autowired
	private UserBadgesRepository userBadgesRepo;

	@Autowired
	private UserSessionService userSessionService;
	
	private IpUtil ipUtil;
	@RequestMapping("/termsandconditions")
	public String voorwaarden(ModelMap model) {
			model.addAttribute("loginForm", new LoginForm());
			model.addAttribute("form", new RegisterForm());
			model.addAttribute("forgotPasswordForm", new RequestResetForm());
		return "z_termsandconditions";
	}

	/*@RequestMapping("/over-het-spel")
	public String overHetSpel(ModelMap modelMap) {
		modelMap.addAttribute("cssClass", "content");
		modelMap.addAttribute("loginForm", new LoginForm());
		modelMap.addAttribute("form", new RegisterForm());
		return "overHetSpel";
	}*/

	@RequestMapping("/gameinstructions")
	public String hoeWerktHet(ModelMap modelMap) {
		modelMap.addAttribute("loginForm", new LoginForm());
		modelMap.addAttribute("form", new RegisterForm());
		modelMap.addAttribute("cssClass", "content");
		return "gameinstructions";
	}
	
	@RequestMapping("game-instructions")
	public String getInstructionContainer(HttpServletRequest req, ModelMap modelMap, HttpSession session) {
			String userName = "anonymous";
			String userIP = ipUtil.getClientIp(req);
			String action = "visit";
			String userAgent = req.getHeader("user-agent");
			String referer = req.getHeader("Referer");
			if (referer == null){
				referer = "home";
			}
			User user = userSessionService.getCurrentUser(session);
			if (user != null && !user.isAnonymous()) {
				int userId = user.getId();
				userName = Integer.toString(userId);
			} 
			Log4jPrefix.initialise(userName, userIP, action, userAgent, referer);
			LOGGER.info("game-instructions");
		return "component/game-instructions-container";
	}

	@RequestMapping({"gameplay-container", "badges-container", "ranks-container", "dive-instruction-container"})
	public String getInstructionMenu(HttpServletRequest req, HttpSession session, ModelMap model) {
			String userName = "anonymous";
			String userIP = ipUtil.getClientIp(req);
			String action = "visit";
			String userAgent = req.getHeader("user-agent");
			String referer = req.getHeader("Referer");
			if (referer == null){
				referer = "home";
			}
		User user = userSessionService.getCurrentUser(session);
		if (user != null && !user.isAnonymous()) {
			int userId = user.getId();
			userName = Integer.toString(userId);
			
			Rank rank = user.getRank();
			Rank nextRank = rankService.getNextRank(rank.getId());
			//log.info("Next rank: " + nextRank.getId() + " --- point: " + nextRank.getScoring() + " --- title: " + nextRank.getTitle());
			model.addAttribute("nextRank", nextRank);

			// get number of matched tags
			int numMatchedTags = tagRepo.countMatchedTagsByUser(userId);
			int numUnmatchedTags = tagRepo.countUnmatchedTagsByUser(userId);
			int numDictTags = tagRepo.countDictionaryTagsByUser(userId);
			int numPioneerTags = tagRepo.countPioneerTagsByUser(userId);
			
			// count number of tags
			model.addAttribute("numMatchedTags", numMatchedTags);
			model.addAttribute("numUnmatchedTags", numUnmatchedTags);
			model.addAttribute("numDictTags", numDictTags);
			model.addAttribute("numPioneerTags", numPioneerTags);

			// count badges score
			model.addAttribute("matchedBadgeScore", badgeRepo.getBadgeScore(numMatchedTags, Constants.BADGES_MATCHED));
			model.addAttribute("unmatchedBadgeScore", badgeRepo.getBadgeScore(numUnmatchedTags, Constants.BADGES_UNMATCHED));
			model.addAttribute("dictBadgeScore", badgeRepo.getBadgeScore(numDictTags, Constants.BADGES_DICTIONARY));
			model.addAttribute("pioneerBadgeScore", badgeRepo.getBadgeScore(numPioneerTags, Constants.BADGES_PIONEER));
			
			Map<String, Integer> monthTagMap = new HashMap<String, Integer>();
			
			// count number of tags per month
			int tagPerMonth = 0;
			for (MonthEnum month : MonthEnum.values()) {
				tagPerMonth = tagRepo.countAllTagsWithinMonth(userId, month.getMonth());
				monthTagMap.put(month.name(), tagPerMonth);
			}
			model.addAttribute("monthTagMap", monthTagMap);
			
			
			// get user's badges
			UserBadges userBadges = userBadgesRepo.getUserBadgeByOwnerId(userId);
			List<Badges> badgeList = new ArrayList<Badges>();
			
			Badges badge = null;
			if (userBadges != null) {
				if (userBadges.getMatchedId() != 0) {
					badge = badgeRepo.getById(userBadges.getMatchedId());
					badgeList.add(badge);
				}
				
				if (userBadges.getUnmatchedId() != 0) {
					badge = badgeRepo.getById(userBadges.getUnmatchedId());
					badgeList.add(badge);
				}
				
				if (userBadges.getDictionaryId() != 0) {
					badge = badgeRepo.getById(userBadges.getDictionaryId());
					badgeList.add(badge);
				}
				
				if (userBadges.getPioneerId() != 0) {
					badge = badgeRepo.getById(userBadges.getPioneerId());
					badgeList.add(badge);
				}
				
				if (userBadges.getCampaignId() != 0) {
					badge = badgeRepo.getById(userBadges.getCampaignId());
					badgeList.add(badge);
				}
			}
			model.addAttribute("badgeList", badgeList);
			
		}
			Log4jPrefix.initialise(userName, userIP, action, userAgent, referer);
			LOGGER.info(req.getServletPath());
		return "component/" + req.getServletPath();
	}
}
