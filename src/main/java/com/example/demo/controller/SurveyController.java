package com.example.demo.controller;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.example.demo.domain.AnswerVO;
import com.example.demo.domain.RoomVO;
import com.example.demo.domain.SurveyVO;
import com.example.demo.mappers.SurveyMapper;
import com.example.demo.service.MemberService;
import com.example.demo.service.SurveyService;

@Controller
public class SurveyController {

	private static final Logger Logger = LoggerFactory.getLogger(SurveyController.class);
	
	@Inject
	SurveyService surveyService;
	MemberService memberervice;
	
	@Resource(name="com.example.demo.mappers.SurveyMapper")
	SurveyMapper mSurveyMapper;
	
	@RequestMapping(value="/mroom/{room_id}", method = RequestMethod.GET) //mroom 디테일페이지 이동
	private String roomDetail(@PathVariable int room_id, RoomVO RoomVO, Model model, SurveyVO surveyVO, HttpServletRequest request) throws Exception{
		Logger.info("read");
		model.addAttribute("read", surveyService.read(room_id));	
		
		Logger.info("readSurvey");
		model.addAttribute("readSurvey", surveyService.readSurvey(room_id));

		Logger.info("answerCount");
		model.addAttribute("answerCount", mSurveyMapper.answerCount(0));
	        
	    return "/mroom";
	}
	
	@RequestMapping(value="/proom/{room_id}", method = RequestMethod.GET) //mroom 디테일페이지 이동
	private String read(@PathVariable int room_id, RoomVO RoomVO, Model model, SurveyVO surveyVO, HttpServletRequest request) throws Exception{
		Logger.info("read");
		model.addAttribute("read", surveyService.read(room_id));

		Logger.info("readSurvey");
		model.addAttribute("readSurvey", surveyService.readSurvey(room_id));
		
		Logger.info("bttnCount");
		model.addAttribute("bttnCount", mSurveyMapper.bttn());
	        
	    return "/proom";
	}
	
	@RequestMapping("/proom/{room_id}/dash_student") //proom 자료실페이지 이동
    private String dash_student(RoomVO RoomVO, Model model) throws Exception{
		Logger.info("read");
	    model.addAttribute("read", surveyService.read(RoomVO.getRoom_id()));
	    
        return "dash_student"; 
	}
	
	@RequestMapping("/mroom/{room_id}/dash_professor") //mroom 자료실페이지 이동
    private String dash_professor(RoomVO RoomVO, Model model) throws Exception{
		Logger.info("read");
	    model.addAttribute("read", surveyService.read(RoomVO.getRoom_id()));
	    
	    Logger.info("roomusercount");
		model.addAttribute("roomusercount", mSurveyMapper.roomusercount(RoomVO.getRoom_id()));
	    
        return "/dash_professor"; 
	}
	
	@RequestMapping(value = "/proomAnswer/{room_id}/{srv_id}", method = RequestMethod.POST)
	public String write(@PathVariable int room_id, @PathVariable int srv_id, AnswerVO answerVO) throws Exception{
		Logger.info("write");
		
		answerVO.setUser_id(mSurveyMapper.proomAnswerUserId(room_id));
		answerVO.setSrv_id(mSurveyMapper.proomAnswerSrvId(srv_id));
		
		surveyService.write(answerVO);
		
		return "redirect:/proom/{room_id}";
	}
	
	@RequestMapping(value = "/surveyProc/{room_id}", method = RequestMethod.POST)
    private String surveyInsertProc(@PathVariable int room_id, HttpServletRequest request) throws Exception{
		Logger.info("surveyInsertProc");
		
        SurveyVO survey = new SurveyVO();
        
        survey.setRoom_id(room_id);
        survey.setSurvey_name(request.getParameter("survey_name"));
        
        String t = request.getParameter("type");
        if ("1".equals(t)) {
        	Logger.info("surveyInsertProcSetType1");
        	survey.setType("1");
        	survey.setContent("0");
        }
        else if ("2".equals(t)) {
        	Logger.info("surveyInsertProcSetType2");
        	survey.setType("2");
        	
        	String[] arrayParam = request.getParameterValues("content");
        	String setCntnt = arrayParam[arrayParam.length-1];
        	int res =  Character.getNumericValue(setCntnt.charAt(0))-9;
        	String last = Integer.toString(res);
        	
        	survey.setContent(last);
        }
        else if ("3".equals(t)) {
        	Logger.info("surveyInsertProcSetType3");
        	survey.setType("3");
        	
        	String[] arrayParam = request.getParameterValues("content");
        	survey.setContent(arrayParam[arrayParam.length-1]);
        }
        else if ("4".equals(t)) {
        	Logger.info("surveyInsertProcSetType4");
        	survey.setType("4");
        	
        	String[] arrayParam = request.getParameterValues("content");
        	String str = arrayParam[0];
        	for (int i = 1; i < arrayParam.length; i++) {
        		str = str.concat(",");
        		str = str.concat(arrayParam[i]);
        	}
        	survey.setContent(str);
        	
        }
        
        survey.setStatus(true);
        		
        surveyService.surveyInsertService(survey);
        
        return "redirect:/mroom/{room_id}";
    }
	
	@RequestMapping(value = "/changeStatus/{room_id}/{srv_id}", method = RequestMethod.POST)
	public String changeStatus(@PathVariable int room_id, @PathVariable int srv_id, SurveyVO surveyVO) throws Exception{
		Logger.info("changeStatus");
		
		surveyVO.setRoom_id(room_id);
		surveyVO.setSrv_id(srv_id);
		surveyVO.setStatus(false);
		
		mSurveyMapper.changeStatus(surveyVO);
		
		return "redirect:/mroom/{room_id}";
	}
}