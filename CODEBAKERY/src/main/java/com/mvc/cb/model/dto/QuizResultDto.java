package com.mvc.cb.model.dto;

public class QuizResultDto {

	private int quiz_No;
	private String quiz_Result;
	private String user_Id;

	public QuizResultDto() {
		super();
	}

	public QuizResultDto(int quiz_No, String quiz_Result, String user_Id) {
		super();
		this.quiz_No = quiz_No;
		this.quiz_Result = quiz_Result;
		this.user_Id = user_Id;
	}

	public int getQuiz_No() {
		return quiz_No;
	}

	public void setQuiz_No(int quiz_No) {
		this.quiz_No = quiz_No;
	}

	public String getQuiz_Result() {
		return quiz_Result;
	}

	public void setQuiz_Result(String quiz_Result) {
		this.quiz_Result = quiz_Result;
	}

	public String getUser_Id() {
		return user_Id;
	}

	public void setUser_Id(String user_Id) {
		this.user_Id = user_Id;
	}

	@Override
	public String toString() {
		return "QuizResultDto [quiz_No=" + quiz_No + ", quiz_Result=" + quiz_Result + ", user_Id=" + user_Id + "]";
	}

	
	

}
