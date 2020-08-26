package com.pleasetoilet.controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.pleasetoilet.dao.ReviewDAO;
import com.pleasetoilet.vo.ReviewVO;

@Controller
public class ReviewController {
	@Autowired
	ReviewDAO dao;
	
//	@RequestMapping(value="review",method=RequestMethod.GET)
//	public String review() {
//		return "review";
//	}
//	
	@RequestMapping(value="review",method=RequestMethod.GET)
	public ModelAndView getReview(HttpSession session, String tno) {
		ModelAndView mv = new ModelAndView();
		if(session.getAttribute("id")==null) {
			mv.setViewName("redirect:/home");
		} else {
			List<ReviewVO> list=dao.getReview(tno, (String)session.getAttribute("id"));
			
			if(list != null) {
				mv.addObject("msg","success");
				mv.addObject("list",list);
				System.out.println(list);
				mv.setViewName("review");
			} else {
				mv.addObject("msg", "fail");
				mv.setViewName("review");
			}
		}
		return mv;
	}
}