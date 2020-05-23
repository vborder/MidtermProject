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
	
	
	
	
	@RequestMapping(path="createAccount.do", method= RequestMethod.GET)
	public String createUserAccount() {
		return "createuser";
	}
	
	@RequestMapping(path="createAccount.do", method= RequestMethod.POST)
	public String createUser(User user, HttpSession session, Model model) {
		
		if(userDAO.findUserByUserName(user.getLoginName() == null) {
			
			User p = userDAO.createUser(user);
			
			session.setAttribute("user", p.getUser());//Profile Object needs a User to get Object from
			
			return "profile";
		} else {
			return "profile";//Requires clarification
		}
		
		return "profile";//does profile.jsp have an account form??
	}
	
	
	@RequestMapping(path="login.do", method = RequestMethod.GET)
	public String login() {
		return "login";
	}
	
	
	@RequestMapping(path="loginUser.do", method = RequestMethod.POST)
	public String loginUser(@RequestParam(name="username") String username, @RequestParam(name="password") String password, HttpSession session, Model model) {
		User u = userDAO.getByUserName(username);
		if(u != null && u.getPassword().equals(password)) {
			
			List<User> profile = userDAO.getProfileByUsername(u.getUsername());
			if(u.isAdmin()) {//if user is Admin status
				session.setAttribute("admin", u);
			}else {
				session.setAttribute("user", u);
			}
			
			return "profile";
			
		} else {
			session.setAttribute("failed", "Password or Username is invalid");
			return "login";
		}
		
		return "login";
	}
	
	
	@RequestMapping(path="updateProfile.do", method= RequestMethod.GET)
	public String updateProfile() {
		
		return "profile";
	}
	
	@RequestMapping(path="updateProfile.do", method= RequestMethod.POST)
	public String updateUserProfile(@RequestParam(name="firstName") String firstName,
			@RequestParam(name="lastName") String lastName,
			@RequestParam(name="email") String email,
			@RequestParam(name="username") String username,
			HttpSession session, Model model) {
			User u = (User) session.getAttribute("user");
			
			
			String updateMessage = null;
			
			List<Object> updatedProfile = userDAO.updateProfile(u.getId(), p.getId(), firstName, lastName, email, username  );//Profile entity required FIX ME
			if(!updateMessage.isEmpty()){
				session.setAttribute("user", updatedProfile.get(0));
				
				
				updateMessage = "Profile Successfully Updated";
			} else {
				updateMessage = "Profile Not Updated";
			}
			model.addAttribute("message",updateMessage );
			
		return "profile";
	}
	
	
	
	@RequestMapping(path="logout.do", method= RequestMethod.GET)
	public String logout(HttpSession session) {
		session.removeAttribute("user");
		session.removeAttribute("admin");
		
		return "index";
	}
	
	//viewBeerRecipeComment
	@RequestMapping(path="viewBeerRecipeComment.do", method= RequestMethod.GET)
	public String userComments(HttpSession session, Model model) {
		User admin = (User) session.getAttribute("admin");
		User u = (User) session.getAttribute("user");
		
		List<Comment> comments = new ArrayList<>();
		if(admin != null) {
			comments = userDAO.getBeerRecipeCommentByUser(admin.getId());
		} else if(u != null) {
			comments = userDAO.getBeerRecipeCommentByUser(u.getId());
		}
		model.addObject("beerRecipComments", comments);
		
		return "beerinfo";
	}
	
	
	//addBeerRecipeComment
	@RequestMapping(path ="addBeerRecipeComment.do", method= RequestMethod.POST)
	public String addComment(@RequestParam(name="beerRecipeId") int beerRecipeId,
			@RequestParam(name="beerRecipeComment") String beerRecipeComment,
			HttpSession session, 
			Model model) {
		User admin = (User) session.getAttribute("admin");
		User u = (User) session.getAttribute("user");
		
		if(admin != null) {
			userDAO.createBeerRecipeComments(admin.getId(), beerRecipeId, beerRecipeComment);
		} else if(u != null) {
			userDAO.createBeerRecipeComments(u.getId(), beerRecipeId, beerRecipeComment);
		}
	
		model.addObject("beer", beerDAO.getBeerById(beerRecipeId);
		model.addObject("listOfBeerComments", beerDAO.getListOfBeerComments(beerRecipeId));
		
		return "beerinfo";
	}
	//listAllBeerRecipeComment
	@RequestMapping(path="listAllBeerRecipeComment.do", method= RequestMethod.GET)
	public String allBeerRecipeComments(HttpSession session, Model model) {
		List<Comment> listOfComments = userDAO.getListAllBeerRecipeComment();
		model.addObject("allBeerRecipeComments", listOfComments);
		
		return "beerinfo";
	}
	
	
	
}
