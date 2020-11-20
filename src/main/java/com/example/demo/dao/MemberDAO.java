package com.example.demo.dao;

import com.example.demo.domain.MemberVO;

public interface MemberDAO {
	// 회원가입
	public void register(MemberVO vo) throws Exception;
	// 아이디 중복체크
	public int idChk(MemberVO vo) throws Exception;
	
	public int confirm(MemberVO vo) throws Exception;
	
	public MemberVO login(MemberVO vo) throws Exception;
 
}
