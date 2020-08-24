package com.pleasetoilet.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MyPageController {
	
	
	@RequestMapping("mypage")
	public String mypage(HttpSession session) {
		if(session.getAttribute("id")==null)
			return "home";
		else return "mypage/mypage";
	}
	
	
	@RequestMapping(value="changepassword",method=RequestMethod.GET)
	public String pwChangeGet(HttpSession session) {
		if(session.getAttribute("id")==null)
			return "home";
		else return "mypage/changePassword";
	}
	
	
	
	@RequestMapping(value="changepassword",method=RequestMethod.POST)
	public void pwChangePost(String pw,String rpw) {
		
	}
	
	
}