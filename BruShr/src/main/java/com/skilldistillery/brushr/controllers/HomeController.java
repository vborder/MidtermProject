package com.skilldistillery.brushr.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.skilldistillery.brushr.data.BeerDAO;
import com.skilldistillery.brushr.entities.BeerRecipe;
import com.skilldistillery.brushr.entities.Comment;
import com.skilldistillery.brushr.entities.User;

@Controller
public class HomeController {

	@Autowired
	private BeerDAO beerDAO;

//	public BeerDAO getDAO() {
//		return beerDAO;
//	}

	@RequestMapping(path = { "/", "home.do" })
	public String goHome() {

		return "home";
	}

//////INDEX Page/////////
//	@RequestMapping(path = {  "index.do" })
//	public String goIndex(Model model, HttpSession session) {
//		List<BeerRecipe> beer = beerDAO.getAllBeers();
//		model.addAttribute("beers", beer);
//		session.getAttribute("user");
//		System.out.println("user");
//		return "index";
//	}

	/////// getBeerById//////////
	@RequestMapping(path = "beer.do", params = "id", method = RequestMethod.GET)
	public String beerById(@RequestParam(name = "id") int id, Model model) {

		BeerRecipe beer = beerDAO.getBeerById(id);

		if (beer != null) {
			model.addAttribute("beer", beer);
			return "beerinfo";
		} else {
			return "fail";
		}
	}

	/////// createBeer/////////
	@RequestMapping(path = "addBeer.do", method = RequestMethod.GET)
	public String createBeerItem(Model model) {

		return "createbeer";
	}

	@RequestMapping(path = "addBeer.do", method = RequestMethod.POST)
	public String createBeer(BeerRecipe beerRecipe, HttpSession session, Model model) {

		BeerRecipe beer = beerDAO.createBeer(beerRecipe, (User) session.getAttribute("user"));

		model.addAttribute("beer", beer);

		return "beerinfo";
	}

	////// LIST of Beers//////
	@RequestMapping(path = "listBeers.do", params = "FIXME", method = RequestMethod.GET)
	public String getAllBeers(@RequestParam(name = "FIXME") String beerByKeyword, Model model) {

		if (beerByKeyword != "") {
			List<BeerRecipe> beers = beerDAO.getBeersByStyle(beerByKeyword);
			if (beers != null) {
				model.addAttribute("beers", beers);
				return "beerlist";
			} else {
				return "redirect: home.do";
			}
		}
		return "index";
	}

	//////// Search beerById////////////
	@RequestMapping(path = "getBeerById.do", method = RequestMethod.GET)
	public String getBeerById(@RequestParam(name = "id") int id, Model model) {
		System.out.println("**********************" + id);
		BeerRecipe beer = beerDAO.getBeerById(id);
		model.addAttribute("beer", beer);
		return "beerinfo";//
	}

	/////// getBeersByNameOrDscription
	@RequestMapping(path = "BeersByNameOrDscription.do", params = "FIXME", method = RequestMethod.GET)
	public String getBeersByNameOrDescription(@RequestParam(name = "FIXME") String name, Model model) {
		List<BeerRecipe> beerlist = beerDAO.getBeersByNameOrDescription(name);// did we pass in an id

		return "beerlist";
	}

	/////// updateBeer
	@RequestMapping(path = "updateBeer.do", method = RequestMethod.GET)
	public String updateBeer(@RequestParam(name = "id") int id, Model model) {
		System.out.println("A bunch of asterix I AM HERE REALLY I AM YOU ARE ONLY HURTING YOURSELF" + id);
		BeerRecipe beer = beerDAO.getBeerById(id);
		model.addAttribute("beer", beer);

		return "updatebeer";
	}

	@RequestMapping(path = "updateBeer.do", method = RequestMethod.POST)
	public String updateBeerItem(@RequestParam(name = "id") int id, Model model) {

		BeerRecipe beer = beerDAO.getBeerById(id);
		model.addAttribute("beer", beer);
		return "success";
	}
	
	/////// deleteBeer/////////////

	@RequestMapping(path="deleteBeer.do")
	public String deleteBeer(@RequestParam(name= "id") Integer id, User user, HttpSession session, Model model) {

		BeerRecipe b = beerDAO.getBeerById(id);
		User loggedInUser = (User) session.getAttribute("user");
//		
		boolean beerDelete = beerDAO.deleteBeer(id, loggedInUser);
		System.out.println(id + "" + user);
		if (beerDelete) {
			return "success";
		}
		else {
			return "fail";
		}
	}
	
	@RequestMapping(path = "addComment.do", method = RequestMethod.POST)
    public String addCommentToBeer(@RequestParam(name = "beerId") int id, Comment comment, Model model, HttpSession session) {
		User user = (User) session.getAttribute("user"); 
		BeerRecipe b = beerDAO.getBeerById(id);
		model.addAttribute(b);
		beerDAO.createComment(id, comment, user);
		return getBeerById(id, model);
  }

}
