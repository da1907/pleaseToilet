package com.pleasetoilet.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.pleasetoilet.dao.MapDAO;

@Controller
public class MapController {
	
	@Autowired
	MapDAO dao;

	@RequestMapping(value="map", method=RequestMethod.GET)
	public String mapView() {
		
		return "map";
	}
	
	@RequestMapping(value="map", method=RequestMethod.POST)
	public ModelAndView goMap() {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("map");
		
		return mv;
	}
	
	@RequestMapping(value="toiletview", method=RequestMethod.POST)
	public ModelAndView checkRange(double lat, double lng, int range) {
		ModelAndView mv = new ModelAndView();
		
		ArrayList<double[]> checkedRange = dao.checkRange(lat, lng, range);
		
		mv.setViewName("toiletview");
		mv.addObject("list", checkedRange);
		
		return mv;
	}
	
	@RequestMapping(value="toiletview", method=RequestMethod.GET)
	public String toiletView() {
		
		return "toiletview";
	}

}








