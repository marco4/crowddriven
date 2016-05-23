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
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import nl.waisda.domain.User;
import nl.waisda.model.Channel;
import nl.waisda.services.UserSessionService;
import nl.waisda.services.VideoService;
import nl.waisda.domain.Quote;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import org.apache.log4j.Logger;
import nl.waisda.utils.Log4jPrefix;
import nl.waisda.utils.IpUtil;

@Controller
public class LeaderbordController {
	private static final Logger LOGGER = Logger.getLogger(HomeController.class);

	@Autowired
	private UserSessionService userSessionService;
	
	@Autowired
	private VideoService videoService;
	
	private IpUtil ipUtil;


	
	@RequestMapping(value = { "leaderboards" })
	public String getLeaderBoardContainer(HttpServletRequest req, ModelMap model, HttpSession session) {
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
		}

		Log4jPrefix.initialise(userName, userIP, action, userAgent, referer);
		LOGGER.info("leaderbords");

		return "component/leaderbords-container";
	}



}
