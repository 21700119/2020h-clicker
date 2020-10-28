package com.example.demo.mappers;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.example.demo.domain.AnswerVO;

@Repository("com.example.demo.mappers.AnswerMapper")
public interface AnswerMapper {
	public List<AnswerVO> readAnswer(int srv_id) throws Exception;
	public int readCount(int srv_id) throws Exception;

}
