package com.mvc.cb.biz;

import java.util.List;

import com.mvc.cb.model.dto.AnswerDto;

public interface AnswerBiz {
	
	public List<AnswerDto> selectList(int question_No);
}
