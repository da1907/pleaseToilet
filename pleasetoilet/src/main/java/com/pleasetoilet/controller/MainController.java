package com.pleasetoilet.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
	@RequestMapping("home")
	public String index() {
		return "home";
	}	
}