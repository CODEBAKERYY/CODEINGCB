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

	@Override
	public int delete(int answer_No) {
		return dao.delete(answer_No);
	}

	@Override
	public int update(AnswerDto dto) {
		return dao.update(dto);
	}

	@Override
	public int insert(AnswerDto dto) {
		return dao.insert(dto);
	}
<<<<<<< HEAD
<<<<<<< HEAD
	
<<<<<<< HEAD
=======
=======
>>>>>>> parent of 4d88b8a... 승연이꺼 추가

	public int cntAnswer(Integer question_No) {
		return dao.cntAnswer(question_No);
	}

	@Override
	public int count() {
		return dao.count();
	}

>>>>>>> parent of 4d88b8a... 승연이꺼 추가
=======
>>>>>>> parent of 3d4349c... ㅈㄷㄹ

}
