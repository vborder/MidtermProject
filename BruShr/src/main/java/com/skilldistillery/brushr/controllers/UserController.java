package com.skilldistillery.brushr.controllers;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.skilldistillery.brushr.data.BeerDAO;
import com.skilldistillery.brushr.data.UserDAO;
import com.skilldistillery.brushr.entities.User;

@Controller
public class UserController {

	@Autowired
	private UserDAO userDAO;

	@RequestMapping(path = "createAccount.do", method = RequestMethod.GET)
	public String createUserAccount() {
		return "createuser";
	}

	@RequestMapping(path = "createAccount.do", method = RequestMethod.POST)
	public String createUser(User user, HttpSession session, Model model) {

		if (userDAO.findUserByUserName(user.getLoginName()) == null) {

			User p = userDAO.createUser(user);

			session.setAttribute("user", p);

			return "profile";
		} else {
			return "profile";
		}

	}

	@RequestMapping(path = "login.do", method = RequestMethod.GET)
	public String login() {
		return "login";
	}

	@RequestMapping(path = "loginUser.do", method = RequestMethod.POST)
	public String loginUser(@RequestParam(name = "username") String username,
			@RequestParam(name = "password") String password, HttpSession session, Model model) {
		User u = userDAO.findUserByUserName(username);
		if (u != null && u.getPassword().equals(password)) {
			session.setAttribute("user", u);
			return "profile";
		} else {
			return "fail";
		}

	}

	@RequestMapping(path = "updateProfile.do", method = RequestMethod.GET)
	public String updateProfile() {
		return "profile";
	}

	@RequestMapping(path = "updateProfile.do", method = RequestMethod.POST)
	public String updateUserProfile(User user, HttpSession session, Model model) {
		
		User u =  (User) session.getAttribute("user");

		userDAO.updateUser(u.getId(),u );
																												// F
		session.setAttribute("user", u);
		return "profile";
		
			
	}

	@RequestMapping(path = "logout.do", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.removeAttribute("user");
		session.removeAttribute("admin");

		return "index";
	}

	

}
