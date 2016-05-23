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

@Controller
public class ProfileController {
	
	private Logger LOGGER = Logger.getLogger(ProfileController.class);

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
	
	@Autowired
	private UserBadgesRepository userBadgesRepo;

	private IpUtil ipUtil;

	@RequestMapping(value = { "/profile.html" })
	public String profile(@RequestParam(defaultValue = "1", required = false) int page, ModelMap model, HttpSession session) {
		List<Channel> channels = videoService.getChannelContent();
		model.addAttribute("channels", channels);
		model.addAttribute("cssClass", "profile");
		
		return "profile";
	}
	
	@RequestMapping(value = { "profile" })
	public String getProfileContainer(HttpServletRequest req, ModelMap model, HttpSession session) {
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
		LOGGER.info("profile");
		
		return "component/profiel-container";
	}
}
