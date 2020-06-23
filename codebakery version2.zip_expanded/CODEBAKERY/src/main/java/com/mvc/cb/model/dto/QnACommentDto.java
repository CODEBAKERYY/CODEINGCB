package com.mvc.cb.model.dto;

import java.util.Date;

public class QnACommentDto {

	private int comment_No;
	private int question_No;
	private int answer_No;
	private String comment_Content;
	private Date comment_Date;
	private int group_no;
	private String reply_no;
	private String user_Id;
	private String nuser_Id;

	public QnACommentDto() {
		super();
	}

	public QnACommentDto(int comment_No, int question_No, int answer_No, String comment_Content, Date comment_Date,
			int group_no, String reply_no, String user_Id, String nuser_Id) {
		super();
		this.comment_No = comment_No;
		this.question_No = question_No;
		this.answer_No = answer_No;
		this.comment_Content = comment_Content;
		this.comment_Date = comment_Date;
		this.group_no = group_no;
		this.reply_no = reply_no;
		this.user_Id = user_Id;
		this.nuser_Id = nuser_Id;
	}

	public int getComment_No() {
		return comment_No;
	}

	public void setComment_No(int comment_No) {
		this.comment_No = comment_No;
	}

	public int getQuestion_No() {
		return question_No;
	}

	public void setQuestion_No(int question_No) {
		this.question_No = question_No;
	}

	public int getAnswer_No() {
		return answer_No;
	}

	public void setAnswer_No(int answer_No) {
		this.answer_No = answer_No;
	}

	public String getComment_Content() {
		return comment_Content;
	}

	public void setComment_Content(String comment_Content) {
		this.comment_Content = comment_Content;
	}

	public Date getComment_Date() {
		return comment_Date;
	}

	public void setComment_Date(Date comment_Date) {
		this.comment_Date = comment_Date;
	}

	public int getGroup_no() {
		return group_no;
	}

	public void setGroup_no(int group_no) {
		this.group_no = group_no;
	}

	public String getReply_no() {
		return reply_no;
	}

	public void setReply_no(String reply_no) {
		this.reply_no = reply_no;
	}

	public String getUser_Id() {
		return user_Id;
	}

	public void setUser_Id(String user_Id) {
		this.user_Id = user_Id;
	}

	public String getNuser_Id() {
		return nuser_Id;
	}

	public void setNuser_Id(String nuser_Id) {
		this.nuser_Id = nuser_Id;
	}

	@Override
	public String toString() {
		return "QnACommentDto [comment_No=" + comment_No + ", question_No=" + question_No + ", answer_No=" + answer_No
				+ ", comment_Content=" + comment_Content + ", comment_Date=" + comment_Date + ", group_no=" + group_no
				+ ", reply_no=" + reply_no + ", user_Id=" + user_Id + ", nuser_Id=" + nuser_Id + "]";
	}
	
	

}
