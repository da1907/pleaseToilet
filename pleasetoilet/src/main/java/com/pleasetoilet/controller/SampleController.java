package com.pleasetoilet.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SampleController {
	
	  @Autowired BCryptPasswordEncoder pwEncoder;
	  
	  @RequestMapping("/log") public String Hello() { String id="1234";
	  System.out.println(1234); String key=pwEncoder.encode(id);
	  System.out.println(key);
	  System.out.println(pwEncoder.matches(id,"$2a$10$IU0vGpUMdKtrdDyFQ9jiz.pCDTgvf.QPGyX.Mu/EilkvTeaoXKVnu"));
	  
	  return "home"; }
	 
}