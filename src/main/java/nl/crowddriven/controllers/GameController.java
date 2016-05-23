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
import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import nl.waisda.utils.MonthEnum;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import nl.waisda.utils.Log4jPrefix;
import nl.waisda.utils.IpUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import nl.waisda.domain.*;
import nl.waisda.exceptions.Forbidden;
import nl.waisda.exceptions.NotFoundException;
import nl.waisda.forms.LoginForm;
import nl.waisda.forms.RegisterForm;
import nl.waisda.forms.RequestResetForm;
import nl.waisda.model.CurrentGames;
import nl.waisda.model.GameUpdate;
import nl.waisda.model.Recap;
import nl.waisda.model.ShallowTagEntry;
import nl.waisda.model.Channel;
import nl.waisda.services.VideoService;
import nl.waisda.domain.Badges;
import nl.waisda.domain.UserBadges;
import nl.waisda.domain.Rank;
import nl.waisda.services.RankService;
import nl.waisda.utils.Constants;


import nl.waisda.repositories.BadgesRepository;
import nl.waisda.repositories.UserBadgesRepository;
import nl.waisda.repositories.ParticipantRepository;
import nl.waisda.repositories.TagEntryRepository;
import nl.waisda.repositories.UserRepository;
import nl.waisda.repositories.VideoRepository;
import nl.waisda.services.GameService;
import nl.waisda.services.ScoringServiceIF;
import nl.waisda.services.UserSessionService;
import nl.waisda.validators.RegisterValidator;


@Controller
@SessionAttributes("userSession")
public class GameController {
	
	private Logger log = Logger.getLogger(GameController.class);

	@Autowired
	private UserSessionService userSessionService;

	@Autowired
	private VideoRepository videoRepo;

	@Autowired
	private VideoService videoService;
	
	@Autowired
	private UserRepository userRepo;
	
	@Autowired
	private GameService gameService;
	
	@Autowired
	private TagEntryRepository tagEntryRepo;
	
	@Autowired
	private ParticipantRepository participantRepo;

	@Autowired
	private ScoringServiceIF scoringService;

	@Autowired
	private BadgesRepository badgeRepo;
	
	@Autowired
	private UserBadgesRepository userBadgesRepo;

		@Autowired
	private RankService rankService;

	private IpUtil ipUtil;

	@RequestMapping("/start-game/{videoId}/{gameType}")
	public String startGame(HttpServletRequest req, @PathVariable int videoId, @PathVariable String gameType, 
			ModelMap model, HttpSession session) throws NotFoundException {

		String userName = "";
		String userIP = ipUtil.getClientIp(req);

		String userAgent = req.getHeader("user-agent");
		String referer = req.getHeader("Referer");
		if (referer == null){
			referer = "game";
		}
		
		User user = userSessionService.requireCurrentUserOrCreateAnonymous(session);
		Video video = videoRepo.getById(videoId);

		Game game = gameService.createGame(user, video);
		if (user != null && !user.isAnonymous()) {
			int userId = user.getId();
			userName = Integer.toString(userId);
		} else {
			userName = "anonymous";
		}
		String action = "start-game";
		Log4jPrefix.initialise(userName, userIP, action, userAgent, referer);
		log.info(gameType);

		return "redirect:/game/" + game.getId() + "/" + gameType;
	}

	
	@RequestMapping("/game/{gameId}/{gameType}")
	public String game(HttpServletRequest req, @PathVariable int gameId, @PathVariable String gameType, 
			ModelMap model, HttpSession session) throws NotFoundException {
		
		String userName = "";
		String userIP = ipUtil.getClientIp(req);
		String userAgent = req.getHeader("user-agent");
		String referer = req.getHeader("Referer");
		if (referer == null){
			referer = "game";
		}

		

		Game game = gameService.getGameById(gameId);
		
		if (game == null) {
			throw new NotFoundException("Unknown game " + gameId);
		} else if (game.hasEnded()) {
			String action = "game-expired";
			Log4jPrefix.initialise(userName, userIP, action, userAgent, referer);
			log.info(String.format("Redirecting request for old game %d to /", gameId));
			return "redirect:/";
		}
		
		User user = userSessionService.requireCurrentUserOrCreateAnonymous(session);
		if (user != null && !user.isAnonymous()) {
			int userId = user.getId();
			userName = Integer.toString(userId);
		} else {
			userName = "anonymous";
		}
		if (participantRepo.get(user.getId(), game.getId()) == null) {
			participantRepo.store(new Participant(user, game));
			String action = "joins";
			Log4jPrefix.initialise(userName, userIP, action, userAgent, referer);
			log.info(String.format("%s joins game %d", user.getShortDescription(), gameId));
		}

		model.addAttribute("game", game);
		model.addAttribute("gameType", gameType);
//		model.addAttribute("cssClass", "game");
		
		
		if (user == null || user.isAnonymous()) {
			model.addAttribute("loginForm", new LoginForm());
			model.addAttribute("form", new RegisterForm());
			model.addAttribute("forgotPasswordForm", new RequestResetForm());
		}
		
//		model.addAttribute("loginForm", new LoginForm());
//		model.addAttribute("form", new RegisterForm());
		
		return "z_game";
	}
	
	@RequestMapping("/game/{gameId}/update/{time}")
	@ResponseBody
	public GameUpdate update(@PathVariable int gameId, @PathVariable int time,
			ModelMap model, HttpSession session) throws NotFoundException {
		// Fetch data
		User user = userSessionService.requireCurrentUser(session);
		Game game = gameService.getGameById(gameId);


		if (game == null) {
			throw new NotFoundException("Unknown game " + gameId);
		}

		List<UserScore> participants = tagEntryRepo.getParticipants(game
				.getId());
		List<TagEntry> myEntries = tagEntryRepo.getEntries(
				game.getId(), user.getId());
		
		GameUpdate update = new GameUpdate();
		update.setOwnId(user.getId());

		int gameScore = 0;
		for (TagEntry te : myEntries) {
			gameScore += te.getScore();
		}
		update.setGameScore(gameScore);

		for (TagEntry tag : myEntries) {
			update.getTagEntries().add(ShallowTagEntry.fromTagEntry(tag));
		}

		List<UserSummary> summaries = new ArrayList<UserSummary>();
		for (UserScore sgs : participants) {
			User s = sgs.getUser();
			summaries.add(new UserSummary(s.getId(), s.getName(), sgs.getScore(), s.getSmallAvatarUrl()));
		}
		Collections.sort(summaries, UserSummary.COMPARE_BY_GAME_SCORE);

		if (game.getCountExistingVideoTags() > 0) {
			summaries.add(UserSummary.GHOST);
		}

		update.setStudents(summaries);

		return update;
	}
	

		@RequestMapping("/current-queues")
	@ResponseBody
	public CurrentGames currentQueues(ModelMap model, HttpSession session)throws NotFoundException {
		User user = userSessionService.getCurrentUser(session);
		return new CurrentGames(new Date().getTime(), gameService.getCurrentQueues());
	}

	@RequestMapping("/tag-entry")
	@ResponseBody
	@Transactional
	public ShallowTagEntry enterTag(HttpServletRequest req, @ModelAttribute TagEntry tagEntry,
			HttpSession session) {
		User user = userSessionService.getCurrentUser(session);

		String userName = "";
		String userIP = ipUtil.getClientIp(req);
		String userAgent = req.getHeader("user-agent");
		String referer = req.getHeader("Referer");
		if (referer == null){
			referer = "tagentry";
		}
		if (user != null && !user.isAnonymous()) {
			int userId = user.getId();
			userName = Integer.toString(userId);
		} else {
			userName = "anonymous";
		}
		


		if (user == null) {
			return null;
		}

		tagEntry.setTag(RegisterValidator.normalizeWhitespace(tagEntry.getTag()));
		tagEntry.setOwner(user);
		tagEntry.setNormalizedTag();

		if (tagEntry.getNormalizedTag().length() == 0) {
			return null;
		}

		Game game = gameService.getGameById(tagEntry.getGame().getId());
		tagEntry.setGame(game);

		if (game.acceptsNewTagEntryAt(tagEntry.getGameTime()) && tagEntry.getNormalizedTag().length() < 40) {
			if (tagEntryRepo.alreadyEntered(tagEntry.getGame().getId(),
					tagEntry.getNormalizedTag(), tagEntry.getGameTime(),
					user.getId())) {
				String action = "tagentry-duplicate";
				Log4jPrefix.initialise(userName, userIP, action, userAgent, referer);
				log.info(String
						.format("Ignoring duplicate entry %s for game %d, user %d, time %d",
								tagEntry.getNormalizedTag(), tagEntry.getGame()
										.getId(), user.getId(), tagEntry
										.getGameTime()));
				return null;
			}
		} else {
			String action = "tagentry-ignore";
			Log4jPrefix.initialise(userName, userIP, action, userAgent, referer);
			log.info(String
					.format("Ignoring tag %s for game %d, user %d, time %d (actual game time %d, delay %d)",
							tagEntry.getTag(), tagEntry.getGame().getId(),
							user.getId(), tagEntry.getGameTime(),
							game.getElapsed(),
							game.getElapsed() - tagEntry.getGameTime()));
			return null;
		}

		scoringService.updateDictionary(tagEntry);
		scoringService.updateMatchAndStore(tagEntry, true);

		String action = "tagentry";
		Log4jPrefix.initialise(userName, userIP, action, userAgent, referer);
		log.info(String
				.format("Registering tag %s #%d with score %d for game %d, user %d, time %d, game type %s (actual game time %d, delay %d)",
						tagEntry.getTag(), tagEntry.getId(), tagEntry.getScore(), tagEntry.getGame()
								.getId(), user.getId(), tagEntry.getGameTime(), tagEntry.getGameType(),
						game.getElapsed(),
						game.getElapsed() - tagEntry.getGameTime()));

		return ShallowTagEntry.fromTagEntry(tagEntry);
	}

	@RequestMapping("/game/{gameId}/recap/{ownerId}/{gameType}")
	public String recap(HttpServletRequest req, @PathVariable int gameId, @PathVariable int ownerId, @PathVariable String gameType, 
			ModelMap model, HttpSession session, HttpServletRequest request) throws NotFoundException,
			Forbidden {

		List<Channel> channels = videoService.getChannelContent();
		Collections.shuffle(channels);
		model.addAttribute("channels", channels);
		model.addAttribute("cssClass", "home");
		model.addAttribute("loginForm", new LoginForm());
		model.addAttribute("form", new RegisterForm());
		model.addAttribute("forgotPasswordForm", new RequestResetForm());
		model.addAttribute("gameType", gameType);

		User user = userSessionService.getCurrentUser(session);

		String userName = "";
		String userIP = ipUtil.getClientIp(req);
		String userAgent = req.getHeader("user-agent");
		String referer = req.getHeader("Referer");
		if (referer == null){
			referer = "recap";
		}
		if (user != null && !user.isAnonymous()) {
			int userId = user.getId();
			userName = Integer.toString(userId);
		} else {
			userName = "anonymous";
		}

		if (user == null) {
			return "redirect:/";
		} else if (user.getId() != ownerId) {
			throw new Forbidden();
		}
		

		if (user != null && !user.isAnonymous()) {
			int userId = user.getId();
			
			
			Rank rank = user.getRank();
			Rank nextRank = rankService.getNextRank(rank.getId());
			log.info("Next rank: " + nextRank.getId() + " --- point: " + nextRank.getScoring() + " --- title: " + nextRank.getTitle());
			model.addAttribute("nextRank", nextRank);

			// get number of matched tags
			int numMatchedTags = tagEntryRepo.countMatchedTagsByUser(userId);
			int numUnmatchedTags = tagEntryRepo.countUnmatchedTagsByUser(userId);
			int numDictTags = tagEntryRepo.countDictionaryTagsByUser(userId);
			int numPioneerTags = tagEntryRepo.countPioneerTagsByUser(userId);
			
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
				tagPerMonth = tagEntryRepo.countAllTagsWithinMonth(userId, month.getMonth());
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

		User owner = userRepo.getById(ownerId);
		Game game = gameService.getGameById(gameId);
		Recap recap = gameService.getRecap(game, owner);
		if (recap.isEmpty()) {
			String action = "recap-empty";
			Log4jPrefix.initialise(userName, userIP, action, userAgent, referer);
			log.info(String.format("Redirecting request for empty recap "
					+ "for game %d, user %d to / (referrer: %s)", gameId,
					ownerId, request.getHeader("Referer")));
			return "redirect:/";
		} else {
			String action = "visit";
			Log4jPrefix.initialise(userName, userIP, action, userAgent, referer);
			log.info("recap");
			action = "recaplog";
			Log4jPrefix.initialise(userName, userIP, action, userAgent, referer);
				log.info(gameId);
			model.put("recap", recap);
			return "z_recap";
		}
	}

	@RequestMapping("/error")
	public void error() {
		throw new RuntimeException();
	}

	public void setGameService(GameService gameService) {
		this.gameService = gameService;
	}

}
