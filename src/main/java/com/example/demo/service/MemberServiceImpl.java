package com.example.demo.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.example.demo.dao.MemberDAO;
import com.example.demo.domain.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {
	@Inject MemberDAO dao;
	
	@Override
	public void register(MemberVO vo) throws Exception {
		dao.register(vo);
	}
	// 아이디 중복 체크
	@Override
	public int idChk(MemberVO vo) throws Exception {
		int result = dao.idChk(vo);
		return result;
	}
	@Override
	public MemberVO login(MemberVO vo) throws Exception {
		return dao.login(vo);
	}
	
}
