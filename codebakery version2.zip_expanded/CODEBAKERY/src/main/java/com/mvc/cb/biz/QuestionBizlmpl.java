package com.mvc.cb.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mvc.cb.model.dao.QuestionDao;
import com.mvc.cb.model.dto.QuestionDto;

@Service
public class QuestionBizlmpl implements QuestionBiz{
	
	@Autowired
	private QuestionDao dao;

	@Override
	public List<QuestionDto> selectList() {
		return dao.selectList();
	}

	@Override
	public QuestionDto selectOne(int question_No) {
		return dao.selectOne(question_No);
	}

}
