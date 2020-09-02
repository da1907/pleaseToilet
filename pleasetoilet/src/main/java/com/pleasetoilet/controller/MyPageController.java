package com.pleasetoilet.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.pleasetoilet.dao.MemberDAO;

@Controller
public class MyPageController {
	@RequestMapping("mypage")
	public String mypage() {
		return "mypage/mypage";
	}
	
	@RequestMapping(value="signout", method=RequestMethod.POST)
	public ModelAndView signoutPost(HttpSession session, String pw, String pwcheck) {
		ModelAndView mv = new ModelAndView();
		String msg = "";
		if(pw == pwcheck) {
			MemberDAO dao = new MemberDAO();
			/* input으로 가져온 pw가 DB에 존재하는지 검사 */
			boolean checkResult = dao.checkPW((String)session.getAttribute("id"), pw);
			
			if(checkResult == true) {
				msg = "회원 탈퇴가 완료되었습니다.";
				mv.addObject("msg", msg);
				mv.setViewName("/base");
				return mv;				
			} else {
				/* DB에 존재하지 않을 경우 */
				msg = "비밀번호가 존재하지 않습니다.";
				mv.addObject("msg", msg);
				mv.setViewName("redirect:mypage/mypage");
				return mv;
			}
		} else {
			/* pw와 pwcheck(비밀번호 확인)이 같지 않은 경우 */
			msg = "입력한 두 비밀번호가 같지 않습니다.";
			mv.addObject("msg", msg);
			mv.setViewName("redirect:mypage/mypage");
			return mv;
		}		
	}
	
	@RequestMapping(value="signout", method=RequestMethod.GET)
	public String signoutGet(HttpSession session) {
		/*
		if(session.getAttribute("id") == null) {
			return "home";
		} else {
			return "mypage/signout";
		}*/
		return "mypage/signout";
	}
	
	
	@RequestMapping(value="changepassword",method=RequestMethod.GET)
	public String pwChangeGet(HttpSession session) {
		/*
		if(session.getAttribute("id") == null) {
			return "home";			
		} else {
			return "mypage/changePassword";
		}
		*/
		return "mypage/changePassword";
	}
	
	
	@RequestMapping(value="changepassword",method=RequestMethod.POST)
	public ModelAndView pwChangePost(HttpSession session, String oldpw, String newpw, String newpwcheck) {
		ModelAndView mv = new ModelAndView();
		String msg = "";
		
		/* newpw와 newpwcheck(새로운 비밀번호, 확인)가 일치하는지를 먼저 검사 */
		if(newpw == newpwcheck) {
			MemberDAO dao = new MemberDAO();
			/* input으로 가져온 pw가 DB에 존재하는지 검사 */
			boolean pwCheck = dao.checkPW((String)session.getAttribute("id"), oldpw);
			if(pwCheck == true) {
				/* 비밀번호 변경 */
				dao.changePW((String)session.getAttribute("id"), newpw);
				msg = "비밀번호 변경에 성공했습니다.";
			} else {
				msg = "현재 비밀번호가 올바르지 않습니다.";
			}
			
			/* 비밀번호 변경에 성공하든 실패하든 changePassword로 redirection */
			mv.addObject("msg", msg);
			mv.setViewName("redirect:mypage/mypage");
			return mv;
			
		} else {
			msg = "비밀번호 확인란에 올바르게 입력해주세요.";
			mv.addObject("msg", msg);
			mv.setViewName("redirect:mypage/mypage");
			return mv;
		}
	}
	
	@RequestMapping("usedlog")
	public String usedlog(HttpSession session) {
		return "mypage/usedlog";
	}
}