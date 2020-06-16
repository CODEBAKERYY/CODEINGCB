package com.mvc.cb.model.dto;

public class MentorDto {
	
	private int mentor_No;
	private String mentor_Career;
	private String mentor_Content;
	private String user_Id;

	public MentorDto() {
		super();
	}

	public MentorDto(int mentor_No, String mentor_Career, String mentor_Content, String user_Id) {
		super();
		this.mentor_No = mentor_No;
		this.mentor_Career = mentor_Career;
		this.mentor_Content = mentor_Content;
		this.user_Id = user_Id;
	}

	public int getMentor_No() {
		return mentor_No;
	}

	public void setMentor_No(int mentor_No) {
		this.mentor_No = mentor_No;
	}

	public String getMentor_Career() {
		return mentor_Career;
	}

	public void setMentor_Career(String mentor_Career) {
		this.mentor_Career = mentor_Career;
	}

	public String getMentor_Content() {
		return mentor_Content;
	}

	public void setMentor_Content(String mentor_Content) {
		this.mentor_Content = mentor_Content;
	}

	public String getUser_Id() {
		return user_Id;
	}

	public void setUser_Id(String user_Id) {
		this.user_Id = user_Id;
	}

	@Override
	public String toString() {
		return "MentorDto [mentor_No=" + mentor_No + ", mentor_Career=" + mentor_Career + ", mentor_Content="
				+ mentor_Content + ", user_Id=" + user_Id + "]";
	}
}
