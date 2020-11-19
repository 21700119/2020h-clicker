package com.example.demo.domain;

import java.sql.Timestamp;

public class AnswerVO {
	private int srv_id;
	private String user_id;
	private String answer;
	private Timestamp reg_date;
	
	public int getSrv_id() {
		return srv_id;
	}
	public void setSrv_id(int srv_id) {
		this.srv_id = srv_id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}

}