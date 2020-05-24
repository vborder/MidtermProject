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
import com.skilldistillery.brushr.entities.BeerRecipe;
import com.skilldistillery.brushr.entities.User;

@Controller
public class UserController {

	@Autowired
	private UserDAO userDAO;
	
	@Autowired
	private BeerDAO beerDAO;

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
	public String loginUser(@RequestParam(name = "loginName") String username,
			@RequestParam(name = "password") String password, HttpSession session, Model model) {
		User u = userDAO.findUserByUserName(username);
		System.out.println("***************************************");
		System.out.println(u);
		if (u != null && u.getPassword().equals(password)) {
			session.setAttribute("user", u);
			return "profile";
		} else {
			return "fail";
		}

	}

	@RequestMapping(path = "updateProfile.do", method = RequestMethod.GET)
	public String updateProfile(@RequestParam(name = "userName")String userName, Model model, HttpSession session) {
		//User user = userDAO.findUserByUserName(userName);
		model.addAttribute("user", session.getAttribute("user"));
		return "updateuser";
	}

	@RequestMapping(path = "updateProfile.do", method = RequestMethod.POST)
	public String updateUserProfile(User user, HttpSession session, Model model) {
		System.out.println("*************************************");
		System.out.println(user);
		System.out.println(user.getId());
		User updateUser = userDAO.updateUser(user.getId(), user);
		System.out.println(updateUser);
		model.addAttribute(updateUser);
		return "success";
		
			
	}

	@RequestMapping(path = "logout.do", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.removeAttribute("user");
		session.removeAttribute("admin");

		return "index";
	}

	@RequestMapping(path = {  "index.do" })
	public String goIndex(Model model, HttpSession session) {
		List<BeerRecipe> beer = beerDAO.getAllBeers();
		model.addAttribute("beers", beer);
		System.out.println("**************************");
		session.getAttribute("user");
		
		return "index";
	}	

}
