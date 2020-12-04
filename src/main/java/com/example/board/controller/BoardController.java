package com.example.board.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.example.board.domain.Board;
import com.example.board.service.BoardService;
import com.example.common.PageUtil;

import lombok.extern.java.Log;

@Log
@RestController
@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	//게시글 목록
	@GetMapping("/list")
	public ModelAndView list(@RequestParam(value="keyword", required=false) String keyword, @RequestParam(value="currentIdx", required=false, defaultValue="1") int currentIdx, HttpServletRequest req) throws Exception {
		log.info("[게시글 목록] 검색어: " + keyword);
		
		int boardCount = boardService.getBoardCount(keyword);
		
		PageUtil pageUtil = new PageUtil(10, boardCount, currentIdx);
		
		HashMap<String, Object> params = new HashMap<>();
		params.put("keyword", keyword);
		params.put("startRN", pageUtil.getStartRN());
		
		return new ModelAndView("board/list")
				.addObject("boardCount", boardCount)
				.addObject("boardList", boardService.getBoardList(params))
				.addObject("pageUtil", pageUtil)
				.addAllObjects(req.getParameterMap());
	}
	
	//게시글 상세 + 조회수 증가
	@GetMapping("/{bno}")
	public ModelAndView detail(@PathVariable("bno") int bno) throws Exception{
		boardService.addReadCnt(bno);
		return new ModelAndView("board/detail")
				.addObject("board", boardService.getBoard(bno));
	}
	
	//게시글 등록 페이지
	@GetMapping("/register")
	public ModelAndView registerForm(HttpServletRequest req) throws Exception {
		return new ModelAndView(req.getSession().getAttribute("member") != null ? "board/register" : "forward:/board/list");
	}
	
	//게시글 등록
	@PostMapping("/register")
	public ModelAndView register(Board board, HttpServletRequest req) throws Exception {
		log.info("[게시물 등록] 입력 정보: ");
		log.info(board.toString());
		
		boardService.register(board);
		
		return new ModelAndView("redirect:/board/list");
	}
	
	//게시글 수정 페이지
	@GetMapping("/modify")
	public ModelAndView modifyForm(@RequestParam("bno") int bno) throws Exception {
		return new ModelAndView("board/modify")
				.addObject("board", boardService.getBoard(bno));
	}
	
	//게시글 수정
	@PostMapping("/modify")
	public ModelAndView modify(Board board) throws Exception {
		log.info("[게시물 수정] 입력 정보: ");
		log.info(board.toString());
		
		boardService.modify(board);
		
		return new ModelAndView("redirect:/board/" + board.getBno());
	}
	
	//게시글 삭제
	@PostMapping("/remove")
	public ModelAndView remove(Board board) throws Exception {
		log.info("[게시물 삭제] 입력 정보: ");
		log.info(board.toString());
		
		boardService.remove(board.getBno());
		
		return new ModelAndView("redirect:/board/list");
	}

}
