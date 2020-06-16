package com.mvc.cb.model.dao;

import com.mvc.cb.model.dto.QuizDto;

public interface QuizDao {

	String NAMESPACE = "quiz.";
	public int insert(QuizDto dto);

}
