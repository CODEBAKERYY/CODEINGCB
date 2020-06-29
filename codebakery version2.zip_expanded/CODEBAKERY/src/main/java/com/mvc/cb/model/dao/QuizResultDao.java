package com.mvc.cb.model.dao;

import com.mvc.cb.model.dto.QuizResultDto;

public interface QuizResultDao {
	
	String NAMESPACE = "quizResult.";

	int insert(QuizResultDto dto);

}
