package com.example.demo.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.demo.domain.AnswerVO;

@Repository
public class AnswerDAOImpl implements AnswerDAO {

	@Inject SqlSession sql;
	
	@Override
	public List<AnswerVO> readAnswer(int srv_id) throws Exception{
		return sql.selectList("com.example.demo.mappers.AnswerMapper.readAnswer", srv_id);
	}

	
}
