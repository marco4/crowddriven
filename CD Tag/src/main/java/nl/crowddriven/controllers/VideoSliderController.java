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
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import nl.waisda.model.Channel;
import nl.waisda.services.UserSessionService;
import nl.waisda.services.VideoService;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class VideoSliderController {
	
	private static final Logger LOGGER = Logger.getLogger(VideoSliderController.class);

	@Autowired
	private UserSessionService userSessionService;
	
	@Autowired
	private VideoService videoService;
	
	@RequestMapping(value = {  "/z_videoslider" })
	public String videoslider(
			@RequestParam(defaultValue = "1", required = false) int page, 
			@RequestParam(required = false) String channel,
			@RequestParam(required = false) String gameType,
			ModelMap model, HttpSession session,
			HttpServletRequest request) {
		
		List<Channel> channels = new ArrayList<Channel>();
		Collections.shuffle(channels);
		if (channel == null) {
			channels = videoService.getChannelContent();

		} else {
			channels = videoService.getVideosByChannel(channel);
		}
		
		if (channel == null) {
			channel = UUID.randomUUID().toString();
		}
		
		model.addAttribute("gameType", gameType);
		model.addAttribute("channelName", channel);
		model.addAttribute("channels", channels);
		
		model.addAttribute("cssClass", "videoslider");
		
		return request.getServletPath();
	}
	
	@RequestMapping(value = {  "/z_rampage-slider" })
	public String campaign(
			@RequestParam(defaultValue = "1", required = false) int page,
			@RequestParam(required = false) String gameType,
			ModelMap model, HttpServletRequest request) {
		
		List<Channel> channels = videoService.getChannelContent();
		Collections.shuffle(channels);
	
		model.addAttribute("gameType", gameType);
		model.addAttribute("channels", channels);
		model.addAttribute("cssClass", "videoslider");
		
		return request.getServletPath();
	}
	@RequestMapping(value = {  "/z_most-tags-slider" })
	public String tagCampaign(
			@RequestParam(defaultValue = "1", required = false) int page,
			@RequestParam(required = false) String gameType,
			ModelMap model, HttpServletRequest request) {
		
		List<Channel> channels = videoService.getMostFeaturedTags();
		//Collections.shuffle(channels);

		LOGGER.info("tagCampaign slider game type: " + gameType);
		
		model.addAttribute("gameType", gameType);
		model.addAttribute("channels", channels);
		model.addAttribute("cssClass", "videoslider");
		
		return request.getServletPath();
	}

	@RequestMapping(value = {  "/z_highscore-slider" })
	public String highscoreCampaign(
			@RequestParam(defaultValue = "1", required = false) int page,
			@RequestParam(required = false) String gameType,
			ModelMap model, HttpServletRequest request) {
		
		List<Channel> channels = videoService.getVideoWithHighestScore();
		
		model.addAttribute("gameType", gameType);
		model.addAttribute("channels", channels);
		model.addAttribute("cssClass", "videoslider");
		
		return request.getServletPath();
	}

}
