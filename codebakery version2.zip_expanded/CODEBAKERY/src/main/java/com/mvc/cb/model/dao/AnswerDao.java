package com.mvc.cb.model.dao;

import java.util.List;

import com.mvc.cb.model.dto.AnswerDto;

public interface AnswerDao {
	
	String NAMESPACE = "answer.";
	
	public List<AnswerDto> selectList(int question_No);

	public int delete(int answer_No);

	public int update(AnswerDto dto);

	public int insert(AnswerDto dto);

	public int cntAnswer(Integer question_No);


}
