package com.example.demo.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.example.demo.dao.SurveyDAO;
import com.example.demo.domain.AnswerVO;
import com.example.demo.domain.RoomVO;
import com.example.demo.domain.SurveyVO;

@Service
public class SurveyServiceImpl implements SurveyService {

	@Inject
	private SurveyDAO dao;
	
	@Override
	public List<SurveyVO> readSurvey(int room_id) throws Exception {
		return dao.readSurvey(room_id);
	}
	@Override
	public RoomVO read(int room_id) throws Exception{
		return dao.read(room_id);	
	}
	@Override
	public void write(AnswerVO answerVO) throws Exception {
		dao.write(answerVO);
	}
	@Override
	public int surveyInsertService(SurveyVO survey) throws Exception{
        return dao.surveyInsert(survey);
    }
	@Override
	public void changeStatus(SurveyVO survey) throws Exception {
		dao.changeStatus(survey);
	}
}
