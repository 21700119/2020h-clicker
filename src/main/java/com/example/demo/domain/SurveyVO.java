package com.example.demo.domain;

import java.sql.Timestamp;

public class SurveyVO {
	private int srv_id;
	private int room_id;
	private String survey_name;
	private String type;
	private String content;
	private int end_time;
	private boolean status;
	private Timestamp reg_date;
    
	public int getSrv_id() {
		return srv_id;
	}
	public void setSrv_id(int srv_id) {
		this.srv_id = srv_id;
	}
	public int getRoom_id() {
		return room_id;
	}
	public void setRoom_id(int room_id) {
		this.room_id = room_id;
	}
	public String getSurvey_name() {
		return survey_name;
	}
	public void setSurvey_name(String survey_name) {
		this.survey_name = survey_name;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getEnd_time() {
		return end_time;
	}
	public void setEnd_time(int end_time) {
		this.end_time = end_time;
	}
	public boolean isStatus() {
		return status;
	}
	public void setStatus(boolean status) {
		this.status = status;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}

}