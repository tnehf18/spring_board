package com.example.board.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.board.domain.Member;
import com.example.board.mapper.MemberMapper;
import com.example.board.service.MemberService;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberMapper memberMapper;

	//회원 정보
	@Override
	public Member getMember(Member member) throws Exception {
		return memberMapper.getMember(member);
	}

	//회원 중복 체크
	@Override
	public Member memberCheck(Member member) throws Exception {
		return memberMapper.memberCheck(member);
	}

	//회원 가입
	@Override
	public int register(Member member) throws Exception {
		return memberMapper.register(member);
	}

}
