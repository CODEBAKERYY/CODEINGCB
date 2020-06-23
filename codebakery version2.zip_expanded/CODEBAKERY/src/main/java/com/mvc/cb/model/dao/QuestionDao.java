package com.mvc.cb.model.dao;

import java.util.List;

import com.mvc.cb.model.dto.QuestionDto;

public interface QuestionDao {
	
	String NAMESPACE = "question.";
	
	public List<QuestionDto> selectList();
	public QuestionDto selectOne(int question_No);
	public int insert(QuestionDto dto);
	public int delete(int question_No);
	public int update(QuestionDto dto);
	
	public void plusCnt(int question_No);
	
	//public ArrayList<QuestionDto> selectAllQuestion
}
