package com.mvc.cb.biz;

import java.util.List;

import com.mvc.cb.model.dto.QuestionDto;

public interface QuestionBiz {
	
	public List<QuestionDto> selectList();
	public QuestionDto selectOne(int question_No);

}
