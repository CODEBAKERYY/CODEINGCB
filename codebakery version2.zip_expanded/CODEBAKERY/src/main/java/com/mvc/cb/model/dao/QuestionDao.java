package com.mvc.cb.model.dao;

import java.util.List;

import com.mvc.cb.model.dto.QuestionDto;

public interface QuestionDao {
	
	String NAMESPACE = "question.";
	
	public List<QuestionDto> selectList();
	public QuestionDto selectOne(int question_No);

}
