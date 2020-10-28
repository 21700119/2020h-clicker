package com.example.demo.dao;

import java.util.List;

import com.example.demo.domain.AnswerVO;
import com.example.demo.domain.RoomVO;
import com.example.demo.domain.SurveyVO;

public interface SurveyDAO {

	public List<SurveyVO> readSurvey(int room_id) throws Exception;
	
	public RoomVO read(int room_id) throws Exception;
	
	public void write(AnswerVO answerVO) throws Exception;
	
	public int surveyInsert(SurveyVO survey) throws Exception;
	
	public void changeStatus(SurveyVO survey) throws Exception;
}
