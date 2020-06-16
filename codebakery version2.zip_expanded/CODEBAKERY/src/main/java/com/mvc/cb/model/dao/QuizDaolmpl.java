package com.mvc.cb.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mvc.cb.model.dto.QuizDto;

@Repository
public class QuizDaolmpl implements QuizDao{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int insert(QuizDto dto) {
		
		int res = 0;
		
		try {
			res = sqlSession.insert(NAMESPACE+"insert",dto);
		}catch(Exception e) {
			System.out.println("[error] : QuizInsert");
			e.printStackTrace();
		}
		
		return res;
	}
	
}
