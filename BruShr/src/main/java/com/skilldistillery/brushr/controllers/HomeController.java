package com.skilldistillery.brushr.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	
	@RequestMapping(path= {"/", "home.do"})
	public String goHome() {
		return "index";
	}
}
