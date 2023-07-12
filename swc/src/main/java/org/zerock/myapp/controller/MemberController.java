package org.zerock.myapp.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.zerock.myapp.domain.JoinMemberVO;
import org.zerock.myapp.service.JoinService;
import org.zerock.myapp.service.LoginService;

import lombok.AllArgsConstructor;

@Controller
public class MemberController {
	
	@Autowired
	private HttpSession session;
	
	@Autowired
	private JoinService joinService;
	
	@Autowired
	private LoginService loginService;
	
	@GetMapping("/member/join")
	public String join(@ModelAttribute JoinMemberVO memberVO) {
		
		return "/member/join";
	}
	
	@RequestMapping(value="/member/join", method=RequestMethod.POST)
	public String joinPs(@ModelAttribute JoinMemberVO memberVO) {
		System.out.println("11"+memberVO.getUserNm());
		joinService.insert(memberVO);
		System.out.println("22"+memberVO.getUserId());
		
		return "redirect:/member/login";
	}
	
	@GetMapping("/member/login")
	public String login() {
		
		
		return "member/login";
	}
	
	@PostMapping("/member/login")
	public String loginPs(@ModelAttribute JoinMemberVO memberVO, HttpSession session ) {
		System.out.println(memberVO.toString());
		JoinMemberVO vo = loginService.authenticate(memberVO);
		System.out.println(memberVO.getUserId()+"님 로그인");
		
		session.setAttribute("userId", vo.getUserId());
		session.setAttribute("userNm", vo.getUserNm());
		session.setAttribute("authCode", vo.getAuthCode());
		session.setAttribute("dept", vo.getDept());
		
		return "redirect:/board/home";
	}
	
	@GetMapping("/member/modify")
	public String modify(@ModelAttribute JoinMemberVO memberVO) {
		
		
		return "/member/modify";
	}
	
	@PostMapping("/member/modify")
	public String modifyPs(@ModelAttribute JoinMemberVO memberVO, HttpSession session) {
		
		joinService.update(memberVO);
		
		session.setAttribute("userId", memberVO.getUserId());
		session.setAttribute("authCode", memberVO.getAuthCode());
		session.setAttribute("userNm", memberVO.getUserNm());
		session.setAttribute("dept", memberVO.getDept());
		
		return "redirect:/board/home";
	}
	
}
