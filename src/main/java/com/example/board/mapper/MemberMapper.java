package com.example.board.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.example.board.domain.Member;

@Mapper
public interface MemberMapper  {
	
    //회원 정보
    public Member getMember(Member member) throws Exception;
    
    //회원 중복 체크
    public Member memberCheck(Member member) throws Exception;
    
    //회원 가입
    public int register(Member member) throws Exception;

}
