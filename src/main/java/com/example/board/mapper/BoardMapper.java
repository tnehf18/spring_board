package com.example.board.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.board.domain.Board;

@Mapper
public interface BoardMapper {
	
	//게시글 개수 
    public int getBoardCount(String keyword) throws Exception;
    
    //게시글 목록 
    public List<Board> getBoardList(Map<String, Object> params) throws Exception;
    
    //게시글 상세
    public Board getBoard(int bno) throws Exception;
    
    //게시글 작성 
    public int register(Board board) throws Exception;
    
    //게시글 수정 
    public int modify(Board board) throws Exception;
    
    //게시글 삭제 
    public int remove(int bno) throws Exception;

    //조회수 증가
	public void addReadCnt(int bno) throws Exception;

}
