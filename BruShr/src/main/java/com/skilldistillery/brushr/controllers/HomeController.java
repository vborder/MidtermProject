package com.skilldistillery.brushr.controllers;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class HomeController {

	@Autowired
	private BeerDAO beerDAO;

	public BeerDAO getDAO() {
		return beerDAO;
	}

	////// INDEX Page/////////
	@RequestMapping(path = { "/", "home.do" })
	public String goHome(Model model) {
		List<Beer> beers = dao.retrieveAllBeer();
		model.addObject("beers", beers);
		return "index";
	}

	///////getBeerById//////////
	@RequestMapping(path = "beer.do", params = "id", method = RequestMethod.GET)
	public String beerById(@RequestParam(name = "id") int id, Model model) {
		Beer beer = beerDAO.getBeerById(id);// will have to match daoimpl
		if(beer != null) {
			model.addObject("beer", beer);
			return "createbeer";
		} else {
			return "beerlist";
		}
		return "success";// display to list of beers
	}
	
	///////createBeer/////////
	@RequestMapping(path="addBeer.do", method= RequestMethod.GET)
	public String createBeerItem(Model model) {
		model.addObject("beer", beer);
		return "home";
	}
	
	@RequestMapping(path="addBeer.do", method = RequestMethod.POST)
	public String createBeer(Model model) {
		Beer beer = beerDAO.createBeer();
		model.addObject("beer", beer);
		
		return "home";
	}
	

	////// LIST of Beers//////
	@RequestMapping(path = "listBeers.do", params = "FIXME", method = RequestMethod.GET)
	public String getAllBeers(@RequestParam(name = "FIXME") String beerByKeyword, Model model) {
		// structure dao to hold List<Beer>
		if (beerByKeyword != "") {
			List<Beer> beers = beerDAO.searchBeerByKeyword(beerByKeyword);
			if (beers != null) {
				model.addObject("beers", beers);
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
		Beer beer = beerDAO.getBeerById(id);
		return "beerInfo";//
	}
	
	/////// getBeersByNameOrDscription
	@RequestMapping(path = "BeersByNameOrDscription.do", params="FIXME", method= RequestMethod.GET)
	public String getBeersByNameOrDscription(Model model) {
		List<Beer> beerlist = beerDAO.getBeersByNameOrDscription();//did we pass in an id
		
		return "beerlist";
	}
	
	
	
	
	

	/////// updateBeer
	@RequestMapping(path="updateBeer.do",  method= RequestMethod.GET)
	public String updateBeer(@RequestParam(name="id") int id, MOdel model) {
		Beer beer = beerDao.getBeerById(id);
		model.addObject("beer", beer);
		 
		return "updatebeer";
	}
	
	@RequestMapping(path="updateBeer.do", method= RequestMethod.POST)
	public String updateBeerItem(@RequestParm(name="id") int id, Model model) {
		Beer beer = beerDao.getBeerById(id);
		model.addObject("beer", beer);
		return "home";
	}
	
	/////// deleteBeer/////////////
	@RequestMapping(path="deleteBeer.do", method = RequestMethod.POST)
	public String deleteBeer(@RequestParam(name= "id") int id, Model model) {
		boolean beerDelete = beerDAO.deleteBeer(id);
		
		model.addObject("deleted", beerDelete);
		
		return "index";
	}
	
}
