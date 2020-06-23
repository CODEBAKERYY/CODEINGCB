package com.mvc.cb.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mvc.cb.model.dao.QuizDao;
import com.mvc.cb.model.dto.QuizDto;

@Service
public class QuizBizlmpl implements QuizBiz{
	
	@Autowired
	private QuizDao quizDao;

	@Override
	public int insert(QuizDto dto) {
		return quizDao.insert(dto);
	}

	@Override
	public List<QuizDto> selectList() {
		return quizDao.selectList();
	}

	@Override
	public int count() {
		return quizDao.count();
	}
}
