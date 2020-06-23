package com.mvc.cb.model.dao;

import java.util.List;

import com.mvc.cb.model.dto.AnswerDto;

public interface AnswerDao {
	
	String NAMESPACE = "answer.";
	
	public List<AnswerDto> selectList(int question_No);

	public int delete(int answer_No);

	public int update(AnswerDto dto);

	public int insert(AnswerDto dto);
<<<<<<< HEAD
=======

	public int cntAnswer(Integer question_No);

	public int count();

>>>>>>> parent of 4d88b8a... 승연이꺼 추가

}
