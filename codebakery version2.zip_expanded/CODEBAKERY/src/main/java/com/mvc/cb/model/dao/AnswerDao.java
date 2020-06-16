package com.mvc.cb.model.dao;

import java.util.List;

import com.mvc.cb.model.dto.AnswerDto;

public interface AnswerDao {
	
	String NAMESPACE = "answer.";
	
	public List<AnswerDto> selectList(int question_No);

}
