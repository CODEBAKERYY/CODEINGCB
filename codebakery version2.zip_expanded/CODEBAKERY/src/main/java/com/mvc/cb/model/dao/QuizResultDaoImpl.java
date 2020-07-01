package com.mvc.cb.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mvc.cb.model.dto.QuizResultDto;

@Repository
public class QuizResultDaoImpl implements QuizResultDao{
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int insert(QuizResultDto dto) {
		int res = 0;
		
		try {
			res = sqlSession.insert(NAMESPACE + "insert", dto);
		}catch(Exception e) {
			System.out.println("[error] : QuizResultInsert");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public List<QuizResultDto> selectList() {
		List<QuizResultDto> quizResultList = new ArrayList<QuizResultDto>();
		
		try {
			quizResultList = sqlSession.selectList(NAMESPACE+"selectList");
		}catch(Exception e) {
			System.out.println("[error] : QuizResult SelectList");
			e.printStackTrace();
		}
		return quizResultList;
	}

}
