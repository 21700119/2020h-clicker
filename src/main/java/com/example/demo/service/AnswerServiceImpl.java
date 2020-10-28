package com.example.demo.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.example.demo.dao.AnswerDAO;
import com.example.demo.domain.AnswerVO;

@Service
public class AnswerServiceImpl implements AnswerService {

	@Inject
	private AnswerDAO dao;
	
	@Override
	public List<AnswerVO> readAnswer(int srv_id) throws Exception{
		return dao.readAnswer(srv_id);
	}

}
