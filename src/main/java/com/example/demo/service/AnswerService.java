package com.example.demo.service;

import java.util.List;

import com.example.demo.domain.AnswerVO;

public interface AnswerService {

	public List<AnswerVO> readAnswer(int srv_id) throws Exception;

}
