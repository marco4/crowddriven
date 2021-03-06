
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

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import nl.waisda.domain.ResetPassword;
import nl.waisda.domain.User;
import nl.waisda.exceptions.NotFoundException;
import nl.waisda.forms.LoginForm;
import nl.waisda.forms.RegisterForm;
import nl.waisda.forms.RequestResetForm;
import nl.waisda.forms.ResetPasswordForm;
import nl.waisda.repositories.ResetPasswordRepository;
import nl.waisda.repositories.UserRepository;
import nl.waisda.services.MailService;
import nl.waisda.services.UserService;
import nl.waisda.services.UserSessionService;
import nl.waisda.validators.UberValidator;

import javax.servlet.http.HttpServletRequest;
import org.apache.log4j.Logger;
import nl.waisda.utils.Log4jPrefix;
import nl.waisda.utils.IpUtil;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.Errors;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AccountController {

	@Autowired
	private UserSessionService userSessionService;

	@Autowired
	private UserService userService;

	@Autowired
	private UserRepository userRepo;

	@Autowired
	private ResetPasswordRepository rpwRepo;

	@Autowired
	private UberValidator validator;

	@Autowired
	private MailService mailService;

	private static Logger log = Logger.getLogger(AccountController.class);

	private IpUtil ipUtil;

	@InitBinder
	protected void initBinder(WebDataBinder binder) {
		binder.setValidator(validator);
	}

	@RequestMapping("/registreren")
	public String register(ModelMap model, HttpSession session) {
		User user = userSessionService.getCurrentUser(session);
		if (user == null || user.isAnonymous()) {
			model.addAttribute("form", new RegisterForm());
			return "register";
		} else {
			return "redirect:/";
		}
	}

	@RequestMapping(value = "/registreren", method = RequestMethod.POST)
	public String register(HttpServletRequest req, @ModelAttribute("form") RegisterForm form,
        Errors errors, HttpSession session) {
        // this provides as much safety against double clicks as possible
        // without requiring a table lock...
        synchronized(AccountController.class) { // hopefully registrations don't occur too much
            User user = userSessionService.getCurrentUser(session);
            if (user == null || user.isAnonymous()) {
                validator.validate(form, errors);
                if (!errors.hasErrors()) {
                    try {
                        user = new User();
                        form.applyTo(user);
                        userRepo.store(user);
                        userSessionService.login(session, user);
                        int userId = user.getId();
						
                        String userName = "anonymous";
                        userName = Integer.toString(userId);
						String userIP = ipUtil.getClientIp(req);
						String action = "register";
						String userAgent = req.getHeader("user-agent");
						String referer = req.getHeader("Referer");
						if (referer == null){
							referer = "register";
						}
						Log4jPrefix.initialise(userName, userIP, action, userAgent, referer);
                        log.info(String.format("Registered %s!", user.getShortDescription()));
                    } catch(Exception e) {
                        // this exception may have been caused by duplicate user
                        // so we'll simply validate again. If validation fails
                        // we'll return this page, otherwise we'll rethrow,
                        // resulting in the error page
                        validator.validate(form, errors);
                        if (!errors.hasErrors()) {
                            if (e instanceof RuntimeException) {
                                throw (RuntimeException) e;
                            }
                            throw new RuntimeException(e);
                        }
                        // show form again
                        return "register";
                    }
                } else {
                    // show form again
                    return "register";
                }
            }
        }
        return "redirect:/";
	}

	@RequestMapping("/inloggen")
	public String login(ModelMap model, HttpSession session) {
		User currentUser = userSessionService.getCurrentUser(session);
		if (currentUser == null || currentUser.isAnonymous()) {
			LoginForm loginForm = new LoginForm();
			model.addAttribute("loginForm", loginForm);
			return "login";
		} else {
			return "redirect:/";
		}
	}

	@RequestMapping(value = "/inloggen", method = RequestMethod.POST)
	public String login(HttpServletRequest req, @Valid @ModelAttribute LoginForm loginForm,
			Errors errors, HttpSession session) {
		
		User newUser = loginForm.getUser();
		
		

		if (newUser != null) {
			userSessionService.login(session, newUser);
			int userId = newUser.getId();
            String userName = "anonymous";
            userName = Integer.toString(userId);
			String userIP = ipUtil.getClientIp(req);
			String action = "login";
			String userAgent = req.getHeader("user-agent");
			String referer = req.getHeader("Referer");
			if (referer == null){
				referer = "login";
			}
			Log4jPrefix.initialise(userName, userIP, action, userAgent, referer);
			log.info(String.format("Logged in %s!",
					newUser.getShortDescription()));
			
			session.setAttribute("isLogged", true);
			
			return "redirect:/";
		} else {
			validator.validate(loginForm, errors);
			
			if (errors.hasErrors()) {
				
			}
			session.setAttribute("isNotLogged", true);
			return "redirect:/";
		}
	}

	@RequestMapping("/uitloggen")
	public String logout(HttpSession session) {
		userSessionService.logout(session);
		return "redirect:/";
	}

	@RequestMapping("/check-cookies")
	public String cookies(HttpSession session, ModelMap model, String targetUrl) {
		if (targetUrl == null || targetUrl == "") {
			targetUrl = "/";
		} else {
			// Check that the URL is local.
			if (targetUrl.contains("://")) {
				throw new IllegalArgumentException("Invalid target url: "
						+ targetUrl);
			}
		}
		if (session.isNew()) {
			model.put("targetUrl", targetUrl);
			return "cookies";
		} else {
			return "redirect:" + targetUrl;
		}
	}

	@RequestMapping(value = "/wachtwoord-vergeten", method = RequestMethod.GET)
	public String wachtwoordVergeten(HttpSession session, ModelMap model) {
		RequestResetForm emailForm = new RequestResetForm();
		model.addAttribute("form", emailForm);
		return "wachtwoord-vergeten";
	}

	@RequestMapping(value = "/wachtwoord-vergeten", method = RequestMethod.POST)
	public String wachtwoordVergeten(HttpServletRequest req, 
			@Valid @ModelAttribute("form") RequestResetForm form,
			Errors errors, HttpSession session, ModelMap model) {
		if (errors.hasErrors()) {
			return "wachtwoord-vergeten";
		}

		User user = form.getUser();
		ResetPassword reset = userService.requestPasswordReset(user);
		log.info(reset.getPlainTextKey());
		mailService.sendPasswordResetMail(reset);

		return "wachtwoord-vergeten";
	}

	@RequestMapping(value = "/wachtwoord-veranderen", method = RequestMethod.GET)
	public String wachtwoordVeranderen(HttpSession session, ModelMap model,
			int id, String key) throws NotFoundException {

		ResetPassword reset = rpwRepo.getById(id);
		if (reset == null) {
			throw new NotFoundException();
		} else {
			if (!reset.isPending() || reset.hasExpired()) {
				model.addAttribute("errorMessage",
						"This url is already being used or has been expired.");
				return "wachtwoord-veranderen";
			} else if (!reset.isPlainTextKeyCorrect(key)) {
				model.addAttribute("errorMessage",
						"The code is not correct, did you copied the right code?");
				return "wachtwoord-veranderen";
			} else {
				ResetPasswordForm form = new ResetPasswordForm();
				form.setId(id);
				form.setPlainTextKey(key);
				model.addAttribute("form", form);
				return "wachtwoord-veranderen";
			}
		}
	}

	@RequestMapping(value = "/wachtwoord-veranderen", method = RequestMethod.POST)
	public String wachtwoordVeranderen(HttpServletRequest req, 
			@Valid @ModelAttribute("form") ResetPasswordForm form,
			Errors errors, HttpSession session, ModelMap model)
			throws NotFoundException {

		if (form.getResetPassword() == null) {
			throw new NotFoundException();
		} else if (errors.hasErrors()) {
			return "wachtwoord-veranderen";
		} else {
			log.info(String.format("Resetting password for user %d", form
					.getResetPassword().getUser().getId()));
			ResetPassword reset = form.getResetPassword();

			User user = reset.getUser();
			user.setPlainTextPassword(form.getAuth().getPassword());
			userRepo.store(user);

			reset.setResetDate();
			rpwRepo.store(reset);

			model.addAttribute("success", true);
			return "wachtwoord-veranderen";
		}
	}

}
