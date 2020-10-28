package com.example.demo.controller;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.example.demo.domain.AnswerVO;
import com.example.demo.domain.SurveyVO;
import com.example.demo.mappers.AnswerMapper;
import com.example.demo.service.AnswerService;

@Controller
public class AnswerController {

	private static final Logger Logger = LoggerFactory.getLogger(AnswerController.class);
	
	@Inject
	AnswerService answerService;
	
	@Resource(name="com.example.demo.mappers.AnswerMapper")
	AnswerMapper mapper;
	
	@RequestMapping(value = "/dash_student", method = RequestMethod.GET)
	public String readAnswers(AnswerVO answerVO, Model model, SurveyVO surveyVO) throws Exception {
		Logger.info("readAnswer");	
		model.addAttribute("readAnswer", answerService.readAnswer(surveyVO.getSrv_id()));	
		
		Logger.info("readCount");
		model.addAttribute("answerCount", mapper.readCount(surveyVO.getSrv_id()));
		

		return "/dash_student";
	}


}