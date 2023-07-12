package org.zerock.myapp.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	HttpServletRequest req;
	
	@Autowired
	HttpSession session;
	
	@GetMapping("/home")
	public String home() {
		
		return "/board/home";
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
	
		
		return "member/login";
	}
	
	@GetMapping("/list")
	public String list() {
		
		return "board/list";
	}
}
