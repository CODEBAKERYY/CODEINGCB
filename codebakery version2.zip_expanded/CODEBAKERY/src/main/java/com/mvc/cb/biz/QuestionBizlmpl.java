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

	@Override
	public int insert(QuestionDto dto) {
		return dao.insert(dto);
	}

	@Override
	public int delete(int question_No) {
		return dao.delete(question_No);
	}

	@Override
	public int update(QuestionDto dto) {
		return dao.update(dto);
	}

	@Override
	public void plusCnt(int question_No) {
		dao.plusCnt(question_No);
	}


//	@Override
//	public int countBoard() {
//		return dao.countBoard();
//	}
//
//	@Override
//	public List<QuestionDto> selectBoard(QnAPagingDto dto) {
//		return dao.selectBoard(dto);
//	}

}
