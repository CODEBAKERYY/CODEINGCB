package com.mvc.cb.model.dao;

import java.util.List;

import com.mvc.cb.model.dto.QnACommentDto;

public interface QCommentDao {
	
String NAMESPACE = "qcomment.";
	
	public List<QnACommentDto> selectList(int question_No);

}
