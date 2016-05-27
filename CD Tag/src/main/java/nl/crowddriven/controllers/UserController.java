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

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import nl.waisda.domain.Badges;
import nl.waisda.domain.Rank;
import nl.waisda.domain.User;
import nl.waisda.domain.UserBadges;
import nl.waisda.exceptions.Forbidden;
import nl.waisda.exceptions.NotFoundException;
import nl.waisda.forms.ProfileForm;
import nl.waisda.model.Profile;
import nl.waisda.repositories.BadgesRepository;
import nl.waisda.repositories.TagEntryRepository;
import nl.waisda.repositories.UserBadgesRepository;
import nl.waisda.repositories.UserRepository;
import nl.waisda.services.RankService;
import nl.waisda.services.UserService;
import nl.waisda.services.UserSessionService;
import nl.waisda.utils.Constants;
import nl.waisda.utils.MonthEnum;
import nl.waisda.validators.UberValidator;

import org.apache.commons.io.IOUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.Errors;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import nl.waisda.utils.Log4jPrefix;
import nl.waisda.utils.IpUtil;

@Controller
public class UserController {
	
	private Logger log = Logger.getLogger(UserController.class);

	@Autowired
	private UberValidator validator;

	@Autowired
	private UserService userService;
	
	@Autowired
	private UserRepository userRepo;

	@Autowired
	private UserSessionService userSessionService;
	
	@Autowired
	private RankService rankService;
	
	@Autowired
	private TagEntryRepository tagRepo;
	
	@Autowired
	private BadgesRepository badgeRepo;
	
	@Autowired
	private UserBadgesRepository userBadgesRepo;

	private IpUtil ipUtil;

	@InitBinder
	protected void initBinder(WebDataBinder binder) {
		binder.setValidator(validator);
	}

	@RequestMapping(value = "/profiel/{id}", method = RequestMethod.GET)
	public String profile(HttpServletRequest req, @PathVariable int id, ModelMap model,
			HttpSession session) throws NotFoundException {

		Profile profile = userService.getProfile(id);

		String userName = "anonymous";
		String userIP = ipUtil.getClientIp(req);
		String action = "visit";
		String userAgent = req.getHeader("user-agent");
		String referer = req.getHeader("Referer");
		if (referer == null){
			referer = "profile";
		}
		if (profile == null) {
			throw new NotFoundException("User not found: " + id);
		}
		
		User pUser = profile.getUser();
		int usersId = pUser.getId();
		userName = Integer.toString(usersId);

		model.addAttribute("profile", profile);

		User viewingUser = userSessionService.getCurrentUser(session);
		boolean isImpersonate =  true;
		if (viewingUser != null
				&& viewingUser.getId() == pUser.getId()) {
			ProfileForm form = new ProfileForm();
			form.fillFrom(pUser);
			model.addAttribute("form", form);
			isImpersonate = false;
			Log4jPrefix.initialise(userName, userIP, action, userAgent, referer);
			log.info("profile");
		} else {
			Log4jPrefix.initialise(userName, userIP, action, userAgent, referer);
			log.info("other-profile");
		}

		model.addAttribute("isImpersonate", isImpersonate);
		
		// get information for profile page
		int userId = pUser.getId();
		
		
		Rank rank = pUser.getRank();
		if (rank == null) {
			rank = new Rank();
			rank.setId(1);
		}
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

		return "profile";
	}

	@RequestMapping(value = "/profiel/{id}", method = RequestMethod.POST)
	public ModelAndView editProfile(HttpServletRequest req, @PathVariable int id, @Valid @ModelAttribute("form") ProfileForm form, 
			Errors errors, HttpSession session)  throws NotFoundException, Forbidden {
		
		User currentUser = userSessionService.getCurrentUser(session);

		String userIP = ipUtil.getClientIp(req);
		String action = "edit-profile";
		String userAgent = req.getHeader("user-agent");
		String referer = req.getHeader("Referer");
		if (referer == null){
			referer = "profile";
		}

		if (currentUser.getId() != form.getId()) {
			throw new Forbidden();
		}
		
		if (errors.hasErrors()) {
			ModelMap model = new ModelMap();
			String view = profile(req, form.getId(), model, session);
			model.addAttribute("form", form);
			model.addAttribute("errors", errors.hasErrors());
			model.addAttribute("showPassword", form.getAuth().filledPassword());
			return new ModelAndView(view, model);
		}
		else {
			int userIDs = currentUser.getId();
			String userName = Integer.toString(userIDs);
			Log4jPrefix.initialise(userName, userIP, action, userAgent, referer);
			log.info("edit-profile");
			form.applyTo(currentUser);
			userRepo.store(currentUser);
			session.setAttribute("isLogged", true);
			return new ModelAndView("redirect:/");
		}
	}
	
	
	@RequestMapping(value = "/user/update", method = RequestMethod.POST)
	@ResponseBody
	public String updateUserInfo(HttpServletRequest request, HttpServletResponse response,
			@RequestParam("file") MultipartFile file, HttpSession session) {
		
		User currentUser = userSessionService.getCurrentUser(session);
		String userIP = ipUtil.getClientIp(request);
		String action = "upload-image";
		String userAgent = request.getHeader("user-agent");
		String referer = request.getHeader("Referer");
		if (referer == null){
			referer = "profile";
		}
		if (currentUser != null && !currentUser.isAnonymous()) {
			if (!file.isEmpty()) {
				try {
					byte[] bytes = file.getBytes();
					
					// Creating the directory to store file
					String rootPath = Constants.USER_IMAGE_LOCATION;
					File dir = new File(rootPath);
					if (!dir.exists())
						dir.mkdirs();
					
					log.info("file.getContentType(): " + file.getContentType());
					
					// Create the file on server
					String fileName = dir.getAbsolutePath()
							+ File.separator + file.getOriginalFilename();
					File serverFile = new File(fileName);
					BufferedOutputStream stream = new BufferedOutputStream(
							new FileOutputStream(serverFile));
					stream.write(bytes);
					stream.close();
					
					log.info("Server File Location="
							+ serverFile.getAbsolutePath());
					
					currentUser.setImageUrl(fileName);
					userService.store(currentUser);
					
					int userIDs = currentUser.getId();
					String userName = Integer.toString(userIDs);
					Log4jPrefix.initialise(userName, userIP, action, userAgent, referer);

					//session.setAttribute("isLogged", true);
					//return new ModelAndView("redirect:/");
					return "You successfully uploaded file=" + file.getOriginalFilename();
				} catch (Exception e) {
					return "You failed to upload " + file.getOriginalFilename() + " => " + e.getMessage();
				}
			} else {
				return "You failed to upload " + file.getName()
						+ " because the file was empty.";
			}
		}
		
		return "";
		
	}
	
	
	@RequestMapping(value = "/user/image", method = RequestMethod.GET)
	public void getUserImage(HttpServletRequest request, HttpServletResponse response,
			HttpSession session) {
		
		User currentUser = userSessionService.getCurrentUser(session);
		
		if (currentUser != null && !currentUser.isAnonymous()) {
			InputStream inputStream = null;
			try {
				inputStream = new FileInputStream(new File(currentUser.getImageUrl()));
				
				if (inputStream != null) {
					IOUtils.copy(inputStream, response.getOutputStream());
					response.flushBuffer();
				}
			} catch (FileNotFoundException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			} finally {
				if (inputStream != null) {
					try {
						inputStream.close();
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			}
		}
		
	}
	
	@RequestMapping(value = "/user/image/{id}", method = RequestMethod.GET)
	public void getUserImageById(HttpServletRequest request, HttpServletResponse response,
			HttpSession session, @PathVariable int id) {
		
		User user = userRepo.getById(id);
		
		if (user != null && !user.isAnonymous()) {
			InputStream inputStream = null;
			try {
				String imageUrl = user.getImageUrl();
				if (imageUrl == null) {
					imageUrl = Constants.USER_DEFAULT_IMAGE;
				}
				inputStream = new FileInputStream(new File(imageUrl));
				
				if (inputStream != null) {
					IOUtils.copy(inputStream, response.getOutputStream());
					response.flushBuffer();
				}
			} catch (FileNotFoundException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			} finally {
				if (inputStream != null) {
					try {
						inputStream.close();
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			}
		}
		
	}

}
