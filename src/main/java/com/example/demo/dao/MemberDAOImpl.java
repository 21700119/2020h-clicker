package com.example.demo.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.demo.domain.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO {
	
	@Inject SqlSession sql;
	// 회원가입
	
	@Override
	public void register(MemberVO vo) throws Exception {
		sql.insert("com.example.demo.mapper.MemberMapper.registerInsert", vo);
	}
	// 아이디 중복 체크
	@Override
	public int idChk(MemberVO vo) throws Exception {
		int result = sql.selectOne("memberMapper.idChk", vo);
		System.out.println(result);
		return result;
	}
	@Override
	public MemberVO login(MemberVO vo) throws Exception {
		return sql.selectOne("com.example.demo.mapper.MemberMapper.login", vo);
	}
}
