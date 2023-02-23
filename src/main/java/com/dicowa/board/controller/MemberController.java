package com.dicowa.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dicowa.board.domain.MemberDto;
import com.dicowa.board.service.MemberService;

import java.net.URLEncoder;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Controller
@RequestMapping("/member/**")
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	@Autowired
	MemberService memberService;
	

	
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String postRegister(MemberDto memberDto) throws Exception {
		logger.info("post register");
		int result = memberService.idChk(memberDto);
		try {
			if(result == 1) {
				return "member/register";
			}else if(result == 0 ) {
				memberService.register(memberDto);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "redirect:/login";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(MemberDto memberDto, HttpServletRequest req, RedirectAttributes rttr) throws Exception{
		logger.info("post login");
		
		HttpSession session = req.getSession();
		MemberDto login = memberService.login(memberDto);
		System.out.println(login);
		if(login == null) {
			session.setAttribute("member", null);
			rttr.addFlashAttribute("msg", false);
		}else {
			session.setAttribute("member", login);
		}
		
		return "redirect:/";
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) throws Exception{
		
		session.invalidate();
		
		return "redirect:/";
	}
	
	@RequestMapping(value="/memberEdit", method = RequestMethod.POST)
	public String registerUpdate(MemberDto memberDto, HttpSession session) throws Exception{
		memberService.memberUpdate(memberDto);
		session.invalidate();
		
		return "redirect:/";
	}
	
	@ResponseBody
	@RequestMapping(value="/idChk", method = RequestMethod.POST)
	public int idChk(MemberDto memberDto)throws Exception{
		int result = memberService.idChk(memberDto);
		return result;
	}
	 
//	@GetMapping("/logout")
//	public String logout(HttpSession session) {
//		// 1.세션 종료
//		session.invalidate();
//		// 2. 홈으로이동
//		return "redirect:/";
//	}
//	
//	@PostMapping("/login")
//	public String login(String id, String pwd, String toURL, boolean rememberId, HttpServletResponse response, HttpServletRequest request) {
//		
//		// 1. id와 pw 확인
//		if(!loginCheck(id, pwd)) {
//			// 2. id와 pw 일치하지않으면 loginForm으로 이동
//			String msg = URLEncoder.encode("id 또는 pwd가 일치하지않음");
//			return "redirect:/login/login?msg="+msg;
//		}
//		
//		//리퀘스트를 이용하여 세션 객체를 얻어와 값을 저장함
//		HttpSession session = request.getSession();
//		session.setAttribute("id", id);
//		
//
//		// 3. id와 pw 일치하면 홈으로 이동
//		if(rememberId) {
//			//3-1 쿠키생성
//			Cookie cookie = new Cookie("id", id);
//			//3-2 응답에 저장
//			response.addCookie(cookie);
//		} else {
//			//3-1 쿠키생성
//			Cookie cookie = new Cookie("id", id);
//			//3-2 쿠키삭제
//			cookie.setMaxAge(0); //유지시간을 0으로 한뒤 응답
//			response.addCookie(cookie);
//		}
//		//3-3 홈으로 이동
//		
//		toURL = (toURL == null || toURL.equals("")) ? "/" : toURL;
//		
//		if(toURL == null || toURL.equals(""))
//			toURL = "/";
//		else
//			toURL = toURL;
//		
//		return "redirect:"+toURL;
//	}
//	
//	private boolean loginCheck(String id, String pwd) {
//		return "green".equals(id) && "1234".equals(pwd);
//	}
}
