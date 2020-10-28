package com.example.demo.dao;

import java.util.List;

import com.example.demo.domain.AnswerVO;

public interface AnswerDAO {
	public List<AnswerVO> readAnswer(int srv_id) throws Exception;
}
