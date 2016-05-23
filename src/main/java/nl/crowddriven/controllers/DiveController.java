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

import java.io.IOException;
import java.io.StringWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import nl.waisda.domain.Rank;
import nl.waisda.domain.User;
import nl.waisda.forms.LoginForm;
import nl.waisda.forms.RegisterForm;
import nl.waisda.forms.RequestResetForm;
import nl.waisda.repositories.BadgesRepository;
import nl.waisda.repositories.TagEntryRepository;
import nl.waisda.services.RankService;
import nl.waisda.services.UserSessionService;
import nl.waisda.services.VideoService;
import nl.waisda.utils.Constants;
import nl.waisda.utils.MonthEnum;

import org.apache.log4j.Logger;
import nl.waisda.utils.Log4jPrefix;
import nl.waisda.utils.IpUtil;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class DiveController {
	
	private static final Logger LOGGER = Logger.getLogger(HomeController.class);

	@Autowired
	private UserSessionService userSessionService;
	
	@Autowired
	private VideoService videoService;
	
	@Autowired
	private RankService rankService;
	
	@Autowired
	private TagEntryRepository tagRepo;

	@Autowired
	private BadgesRepository badgeRepo;

	private IpUtil ipUtil;
	
	@RequestMapping(value = { "dive" })
	public String home(HttpServletRequest req, @RequestParam(defaultValue = "1", required = false) int page, ModelMap model, HttpSession session) {
		String userName = "";
		String userIP = ipUtil.getClientIp(req);
		String action = "visit";
		String userAgent = req.getHeader("user-agent");
		String referer = req.getHeader("Referer");
		if (referer == null){
			referer = "dive";
		}

		User user = userSessionService.getCurrentUser(session);
		if (user != null && !user.isAnonymous()) {
			int userId = user.getId();
			userName = Integer.toString(userId);

			Rank rank = user.getRank();
			Rank nextRank = rankService.getNextRank(rank.getId());
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
			
			if (session.getAttribute("isLogged") != null) {
				model.addAttribute("isLogged", true);
				session.removeAttribute("isLogged");
			}
			
		} else {
			model.addAttribute("loginForm", new LoginForm());
			model.addAttribute("form", new RegisterForm());
			model.addAttribute("forgotPasswordForm", new RequestResetForm());
			userName = "anonymous";
		}
		Log4jPrefix.initialise(userName, userIP, action, userAgent, referer);
		LOGGER.info("dive");

		return "z_dive";
	}



}
