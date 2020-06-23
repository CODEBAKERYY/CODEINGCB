package com.mvc.cb.model.dto;

import java.util.Date;

public class QnACommentDto {


	private int comment_No;
	private int question_No;
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> parent of 3d4349c... ㅈㄷㄹ
	private int answer_No;
	private String comment_Content;
	private Date comment_Date;
	private int group_no;
	private String reply_no;
<<<<<<< HEAD
=======
	private int parent_No;
	private String comment_Content;
	private Date comment_Date;
	private int depth;
	private String reply_Id;
>>>>>>> parent of 4d88b8a... 승연이꺼 추가
=======
	private int parent_No;
	private String comment_Content;
	private Date comment_Date;
	private int depth;
	private String reply_Id;
>>>>>>> parent of 4d88b8a... 승연이꺼 추가
=======
>>>>>>> parent of 3d4349c... ㅈㄷㄹ
	private String user_Id;
	private String nuser_Id;

	public QnACommentDto() {
		super();
	}

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
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
=======
	public QnACommentDto(int comment_No, int question_No, int parent_No, String comment_Content, Date comment_Date,
			int depth, String reply_Id, String user_Id, String nuser_Id) {
		super();
		this.comment_No = comment_No;
		this.question_No = question_No;
		this.parent_No = parent_No;
		this.comment_Content = comment_Content;
		this.comment_Date = comment_Date;
		this.depth = depth;
		this.reply_Id = reply_Id;
>>>>>>> parent of 4d88b8a... 승연이꺼 추가
=======
	public QnACommentDto(int comment_No, int question_No, int parent_No, String comment_Content, Date comment_Date,
			int depth, String reply_Id, String user_Id, String nuser_Id) {
		super();
		this.comment_No = comment_No;
		this.question_No = question_No;
		this.parent_No = parent_No;
		this.comment_Content = comment_Content;
		this.comment_Date = comment_Date;
		this.depth = depth;
		this.reply_Id = reply_Id;
>>>>>>> parent of 4d88b8a... 승연이꺼 추가
=======
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
>>>>>>> parent of 3d4349c... ㅈㄷㄹ
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

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> parent of 3d4349c... ㅈㄷㄹ
	public int getAnswer_No() {
		return answer_No;
	}

	public void setAnswer_No(int answer_No) {
		this.answer_No = answer_No;
<<<<<<< HEAD
=======
=======
>>>>>>> parent of 4d88b8a... 승연이꺼 추가
	public int getParent_No() {
		return parent_No;
	}

	public void setParent_No(int parent_No) {
		this.parent_No = parent_No;
<<<<<<< HEAD
>>>>>>> parent of 4d88b8a... 승연이꺼 추가
=======
>>>>>>> parent of 4d88b8a... 승연이꺼 추가
=======
>>>>>>> parent of 3d4349c... ㅈㄷㄹ
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

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> parent of 3d4349c... ㅈㄷㄹ
	public int getGroup_no() {
		return group_no;
	}

	public void setGroup_no(int group_no) {
		this.group_no = group_no;
<<<<<<< HEAD
=======
=======
>>>>>>> parent of 4d88b8a... 승연이꺼 추가
	public int getDepth() {
		return depth;
>>>>>>> parent of 4d88b8a... 승연이꺼 추가
=======
>>>>>>> parent of 3d4349c... ㅈㄷㄹ
	}

	public String getReply_no() {
		return reply_no;
	}

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
	public void setReply_no(String reply_no) {
		this.reply_no = reply_no;
=======
=======
>>>>>>> parent of 4d88b8a... 승연이꺼 추가
	public String getReply_Id() {
		return reply_Id;
	}

	public void setReply_Id(String reply_Id) {
		this.reply_Id = reply_Id;
<<<<<<< HEAD
>>>>>>> parent of 4d88b8a... 승연이꺼 추가
=======
>>>>>>> parent of 4d88b8a... 승연이꺼 추가
=======
	public void setReply_no(String reply_no) {
		this.reply_no = reply_no;
>>>>>>> parent of 3d4349c... ㅈㄷㄹ
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
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
		return "QnACommentDto [comment_No=" + comment_No + ", question_No=" + question_No + ", answer_No=" + answer_No
				+ ", comment_Content=" + comment_Content + ", comment_Date=" + comment_Date + ", group_no=" + group_no
				+ ", reply_no=" + reply_no + ", user_Id=" + user_Id + ", nuser_Id=" + nuser_Id + "]";
=======
		return "QnACommentDto [comment_No=" + comment_No + ", question_No=" + question_No + ", parent_No=" + parent_No
				+ ", comment_Content=" + comment_Content + ", comment_Date=" + comment_Date + ", depth=" + depth
				+ ", reply_Id=" + reply_Id + ", user_Id=" + user_Id + ", nuser_Id=" + nuser_Id + "]";
>>>>>>> parent of 4d88b8a... 승연이꺼 추가
=======
		return "QnACommentDto [comment_No=" + comment_No + ", question_No=" + question_No + ", parent_No=" + parent_No
				+ ", comment_Content=" + comment_Content + ", comment_Date=" + comment_Date + ", depth=" + depth
				+ ", reply_Id=" + reply_Id + ", user_Id=" + user_Id + ", nuser_Id=" + nuser_Id + "]";
>>>>>>> parent of 4d88b8a... 승연이꺼 추가
	}
	
	
	
=======
		return "QnACommentDto [comment_No=" + comment_No + ", question_No=" + question_No + ", answer_No=" + answer_No
				+ ", comment_Content=" + comment_Content + ", comment_Date=" + comment_Date + ", group_no=" + group_no
				+ ", reply_no=" + reply_no + ", user_Id=" + user_Id + ", nuser_Id=" + nuser_Id + "]";
	}
	
>>>>>>> parent of 3d4349c... ㅈㄷㄹ
	

}
