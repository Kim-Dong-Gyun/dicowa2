package com.dicowa.board.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dicowa.board.domain.MemberDto;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		return "/index";
	}
	
	@RequestMapping("/register")
	public void index() {
		
	}
	
	
	@RequestMapping("/memberEdit")
	public void edit() {
		
	}
	
	
	@RequestMapping("/admin")
	public void admin() {
		
	}
	
	@RequestMapping("/adminEdit")
	public void adEdit() {
		
	}
	
	@RequestMapping("/adminSignup")
	public void adSignup() {
		
	}
	
	@RequestMapping("/adminNotice")
	public void adNotice() {
		
	}
	
	@RequestMapping("/adminPromo")
	public void adPromo() {
		
	}
	
	@RequestMapping("/adminEvent")
	public void adEvent() {
		
	}
	
	@RequestMapping("/adminRanking")
	public void adRanking() {
		
	}
	@GetMapping("/login")
	public String login(HttpServletRequest req) {
		HttpSession session = req.getSession();
		MemberDto member = (MemberDto) session.getAttribute("member");
		if(member!=null) {
			return "/index";
		}
		else {
			return "/login";
		}
		
	}
}	
