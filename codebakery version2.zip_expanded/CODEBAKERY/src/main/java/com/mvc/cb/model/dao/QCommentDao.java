package com.mvc.cb.model.dao;

import java.util.List;

import com.mvc.cb.model.dto.QnACommentDto;

public interface QCommentDao {
<<<<<<< HEAD
	
String NAMESPACE = "qcomment.";
	
	public List<QnACommentDto> selectList(int question_No);
=======

	String NAMESPACE = "qcomment.";

	public List<QnACommentDto> selectList(int question_No);

	public int insert(QnACommentDto dto);

	public int update(QnACommentDto dto);

	public int delete(int comment_No);
>>>>>>> parent of 4d88b8a... 승연이꺼 추가

}
