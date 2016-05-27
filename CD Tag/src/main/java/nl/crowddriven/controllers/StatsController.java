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
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import nl.waisda.model.SimpleList;
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
import org.hibernate.tool.hbm2x.StringUtils;
import org.springframework.ui.ModelMap;
import org.springframework.util.Assert;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import org.apache.log4j.Logger;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import nl.waisda.utils.Log4jPrefix;
import nl.waisda.utils.IpUtil;

@Controller
public class StatsController {
	private static final Logger LOGGER = Logger.getLogger(HomeController.class);

    private boolean checkAuth() {
        ServletRequestAttributes attributes = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
        if (attributes != null) {
            User user = userSessionService.getCurrentUser(attributes.getRequest().getSession());
            if (user != null && Boolean.TRUE.equals(user.getAdmin())) {
                return true;
            }
        }
        return false;
    }

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

	@RequestMapping(value = { "/stats.html" })
	public String stats(HttpServletRequest req, @RequestParam(defaultValue = "1", required = false) int page, ModelMap model, HttpSession session) {
		if (!checkAuth()) {
            // user must be logged in with admin account
            return "redirect:/";
        }
		String userName = "anonymous";
		String userIP = ipUtil.getClientIp(req);
		String action = "visit";
		String userAgent = req.getHeader("user-agent");
		String referer = req.getHeader("Referer");
		if (referer == null){
			referer = "leaderbord";
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
		}
		Log4jPrefix.initialise(userName, userIP, action, userAgent, referer);
		LOGGER.info("admin-stats");

		
		return "z_stats";
	}

	@RequestMapping(value = { "/statsblocks" })
	public String statsblocks(HttpServletRequest req, @RequestParam(defaultValue = "1", required = false) int page, ModelMap model, HttpSession session) {

		String userName = "anonymous";
		String userIP = ipUtil.getClientIp(req);
		String action = "visit";
		String userAgent = req.getHeader("user-agent");
		String referer = req.getHeader("Referer");
		if (referer == null){
			referer = "leaderbord";
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
		}
		Log4jPrefix.initialise(userName, userIP, action, userAgent, referer);
		LOGGER.info("admin-stats");

		
		return "z_statsblocks";
	}
@RequestMapping(value = { "/gamesplayed" })
	public String gamesplayed(HttpServletRequest req, @RequestParam(defaultValue = "1", required = false) int page, ModelMap model, HttpSession session) {

		String userName = "anonymous";
		String userIP = ipUtil.getClientIp(req);
		String action = "visit";
		String userAgent = req.getHeader("user-agent");
		String referer = req.getHeader("Referer");
		if (referer == null){
			referer = "leaderbord";
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
		}
		Log4jPrefix.initialise(userName, userIP, action, userAgent, referer);
		LOGGER.info("admin-stats");

		
		return "z_gamesplayed";
	}
@RequestMapping(value = { "/hoursplayed" })
	public String hoursplayed(HttpServletRequest req, @RequestParam(defaultValue = "1", required = false) int page, ModelMap model, HttpSession session) {

		String userName = "anonymous";
		String userIP = ipUtil.getClientIp(req);
		String action = "visit";
		String userAgent = req.getHeader("user-agent");
		String referer = req.getHeader("Referer");
		if (referer == null){
			referer = "hoursplayed";
		}

		Map<String, Integer> monthTimeMap = new HashMap<String, Integer>();
			
		// count number of tags per month
		int timePerMonth = 0;
		for (MonthEnum month : MonthEnum.values()) {
			timePerMonth = tagRepo.countAllHoursWithinMonthTotal(month.getMonth());
			monthTimeMap.put(month.name(), timePerMonth);
		}
		model.addAttribute("monthTimeMap", monthTimeMap);

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
			

			
			if (session.getAttribute("isLogged") != null) {
				model.addAttribute("isLogged", true);
				session.removeAttribute("isLogged");
			}
			
		} else {
			model.addAttribute("loginForm", new LoginForm());
			model.addAttribute("form", new RegisterForm());
			model.addAttribute("forgotPasswordForm", new RequestResetForm());
		}
		Log4jPrefix.initialise(userName, userIP, action, userAgent, referer);
		LOGGER.info("admin-stats");

		
		return "z_hoursplayed";
	}
@RequestMapping(value = { "/divesearches" })
	public String divesearches(HttpServletRequest req, @RequestParam(defaultValue = "1", required = false) int page, ModelMap model, HttpSession session) {

		String userName = "anonymous";
		String userIP = ipUtil.getClientIp(req);
		String action = "visit";
		String userAgent = req.getHeader("user-agent");
		String referer = req.getHeader("Referer");
		if (referer == null){
			referer = "leaderbord";
		}

		List<String> diveSearches = new ArrayList<String>();
		diveSearches = tagRepo.getDiveLastSearches();
		model.addAttribute("diveSearches", diveSearches);
		User user = userSessionService.getCurrentUser(session);
		if (user != null && !user.isAnonymous()) {
			int userId = user.getId();
			userName = Integer.toString(userId);

			if (session.getAttribute("isLogged") != null) {
				model.addAttribute("isLogged", true);
				session.removeAttribute("isLogged");
			}
			
		} else {
			model.addAttribute("loginForm", new LoginForm());
			model.addAttribute("form", new RegisterForm());
			model.addAttribute("forgotPasswordForm", new RequestResetForm());
		}
		Log4jPrefix.initialise(userName, userIP, action, userAgent, referer);
		LOGGER.info("divesearches");

		
		return "z_divesearches";
	}
@RequestMapping(value = { "/diveclicks" })
	public String diveclicks(HttpServletRequest req, @RequestParam(defaultValue = "1", required = false) int page, ModelMap model, HttpSession session) {

		String userName = "anonymous";
		String userIP = ipUtil.getClientIp(req);
		String action = "visit";
		String userAgent = req.getHeader("user-agent");
		String referer = req.getHeader("Referer");
		if (referer == null){
			referer = "leaderbord";
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
		}
		Log4jPrefix.initialise(userName, userIP, action, userAgent, referer);
		LOGGER.info("diveclicks");

		List<String> diveClicks = new ArrayList<String>();
		diveClicks = tagRepo.getDiveLastClicks();
		model.addAttribute("diveClicks", diveClicks);
		
		return "z_diveclicks";
	}
@RequestMapping(value = { "/curatedtags" })
	public String curatedtags(HttpServletRequest req, @RequestParam(defaultValue = "1", required = false) int page, ModelMap model, HttpSession session) {

		String userName = "anonymous";
		String userIP = ipUtil.getClientIp(req);
		String action = "visit";
		String userAgent = req.getHeader("user-agent");
		String referer = req.getHeader("Referer");
		if (referer == null){
			referer = "leaderbord";
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
		}
		Log4jPrefix.initialise(userName, userIP, action, userAgent, referer);
		LOGGER.info("curatedtags");

		
		return "z_curatedtags";
	}
	@RequestMapping(value = { "/tagsadded" })
	public String tagsadded(HttpServletRequest req, @RequestParam(defaultValue = "1", required = false) int page, ModelMap model, HttpSession session) {

			String userName = "anonymous";
		String userIP = ipUtil.getClientIp(req);
		String action = "visit";
		String userAgent = req.getHeader("user-agent");
		String referer = req.getHeader("Referer");
		if (referer == null){
			referer = "tagsadded";
		}

		Map<String, Integer> monthTagMap = new HashMap<String, Integer>();
			
		// count number of tags per month
		int tagPerMonth = 0;
		for (MonthEnum month : MonthEnum.values()) {
			tagPerMonth = tagRepo.countAllTagsWithinMonthTotal(month.getMonth());
			monthTagMap.put(month.name(), tagPerMonth);
		}
		model.addAttribute("monthTagMap", monthTagMap);
		
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
			

			
			if (session.getAttribute("isLogged") != null) {
				model.addAttribute("isLogged", true);
				session.removeAttribute("isLogged");
			}
			
		} else {
			model.addAttribute("loginForm", new LoginForm());
			model.addAttribute("form", new RegisterForm());
			model.addAttribute("forgotPasswordForm", new RequestResetForm());
		}
		Log4jPrefix.initialise(userName, userIP, action, userAgent, referer);
		LOGGER.info("Tags-added");

		
		return "z_tagsadded";
	}
}
