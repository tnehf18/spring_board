package com.example.board.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.example.board.domain.Member;
import com.example.board.service.BoardService;
import com.example.board.service.MemberService;

import lombok.extern.java.Log;

@Log
@RestController
public class HomeController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private BoardService boardService;

	//최초 접속페이지
	@GetMapping("/")
	public ModelAndView home(HttpServletRequest req) throws Exception {
		int totalCnt = boardService.getBoardCount(null);
		return new ModelAndView("home")
				.addObject("boardCount", totalCnt)
				.addObject("boardList", boardService.getBoardList(null).subList(0, totalCnt < 5 ? totalCnt : 5));
	}
	
	//회원가입 페이지
	@GetMapping("/join")
	public ModelAndView joinForm() throws Exception {
		
		return new ModelAndView("join");
	}
	
	//회원 중복 체크
	@ResponseBody
	@PostMapping("/memberCheck")
	public Member memberCheck(Member member) throws Exception {
		log.info("[회원가입] 입력 정보: ");
		log.info(member.toString());
		
		return memberService.memberCheck(member) != null ? memberService.memberCheck(member) : new Member();
	}
	
	//회원 가입
	@PostMapping("/join")
	public ModelAndView join(Member member, @RequestParam("referer") String referer, HttpServletRequest req) throws Exception {
		if(memberService.register(member) > 0)
			log.info("가입 성공");
		else 
			log.info("오류 발생");
		
		req.getSession().setAttribute("member", memberService.getMember(member));
		
		return new ModelAndView("redirect:" + referer);
	}
	
	//로그인
	@PostMapping("/login")
	public ModelAndView login(Member member, HttpServletRequest req) throws Exception {
		log.info("[로그인] 입력 정보: ");
		log.info(member.toString());
		
		req.getSession().setAttribute("member", memberService.getMember(member));
		
		return new ModelAndView("redirect:" + req.getHeader("Referer"));
	}
	
	//로그아웃
	@PostMapping("/logout")
	public ModelAndView logout(HttpServletRequest req) throws Exception {
		log.info("[로그아웃] 세션 정보: ");
		log.info(req.getSession().getAttribute("member").toString());
		
		req.getSession().invalidate();
		
		return new ModelAndView("redirect:" + req.getHeader("Referer"));
	}
	
}
