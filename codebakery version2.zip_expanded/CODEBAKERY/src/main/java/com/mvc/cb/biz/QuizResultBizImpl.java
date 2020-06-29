package com.mvc.cb.biz;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mvc.cb.model.dao.QuizResultDao;
import com.mvc.cb.model.dto.QuizResultDto;

@Service
public class QuizResultBizImpl implements QuizResultBiz{
	
	@Autowired
	private QuizResultDao quizResultDao;
	
	@Override
	public int insert(QuizResultDto dto) {
		return quizResultDao.insert(dto);
	}
	
	
}
