package com.mvc.cb.model.dao;

import java.util.List;

import com.mvc.cb.model.dto.QuizDto;

public interface QuizDao {

	String NAMESPACE = "quiz.";
	
	public int insert(QuizDto dto);
	public List<QuizDto> selectList();
}