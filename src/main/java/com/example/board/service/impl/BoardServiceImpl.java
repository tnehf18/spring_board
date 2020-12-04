package com.example.board.service.impl;

import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.board.domain.Board;
import com.example.board.mapper.BoardMapper;
import com.example.board.service.BoardService;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private BoardMapper boardMapper;

	//게시글 개수
	@Override
	public int getBoardCount(String keyword) throws Exception {
		return boardMapper.getBoardCount(keyword);
	}

	//게시글 목록
	@Override
	public List<Board> getBoardList(Map<String, Object> params) throws Exception {
		return boardMapper.getBoardList(params);
	}

	//게시글 상세
	@Override
	public Board getBoard(int bno) throws Exception {
		return boardMapper.getBoard(bno);
	}

	//게시글 등록
	@Override
	public int register(Board board) throws Exception {
		return boardMapper.register(board);
	}

	//게시글 수정
	@Override
	public int modify(Board board) throws Exception {
		return boardMapper.modify(board);
	}

	//게시글 삭제
	@Override
	public int remove(int bno) throws Exception {
		return boardMapper.remove(bno);
	}

	//조회수 증가
	@Override
	public void addReadCnt(int bno) throws Exception {
		boardMapper.addReadCnt(bno);
	}

}
