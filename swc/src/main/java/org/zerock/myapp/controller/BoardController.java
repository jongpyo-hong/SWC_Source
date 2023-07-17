package org.zerock.myapp.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.zerock.myapp.domain.BoardVO;
import org.zerock.myapp.service.BoardService;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	HttpServletRequest req;
	
	@Autowired
	HttpSession session;
	
	@Autowired
	BoardService boardService;
	
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
	public String list(@ModelAttribute BoardVO boradVO, Model model) {
		
		List<BoardVO> lists = boardService.getList();
		model.addAttribute("list", lists);
		System.out.println(lists);
		return "board/list";
	}
	
	@PostMapping("/list")
	public String listPs(BoardVO boardVO, Model model) {
		
		boardVO.setStatusCode(boardVO.getStatusCode());
		boardVO.setSubject(boardVO.getSubject());
		List<BoardVO> lists = boardService.getBoardList(boardVO);
		model.addAttribute("list", lists);
		
		return "board/list";
	}
	
	@GetMapping("/detail")
	public String detail(@ModelAttribute BoardVO boradVO, Model model) {
		
		BoardVO vo = boardService.getDetail(boradVO);
		model.addAttribute("board", vo);
		return "board/detail";
	}
	
	
}
