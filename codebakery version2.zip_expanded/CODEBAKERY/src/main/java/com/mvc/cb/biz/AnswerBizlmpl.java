package com.mvc.cb.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mvc.cb.model.dao.AnswerDao;
import com.mvc.cb.model.dto.AnswerDto;

@Service
public class AnswerBizlmpl implements AnswerBiz{

	@Autowired
	private AnswerDao dao;
	
	@Override
	public List<AnswerDto> selectList(int question_No) {
		return dao.selectList(question_No);
	}
	

}
