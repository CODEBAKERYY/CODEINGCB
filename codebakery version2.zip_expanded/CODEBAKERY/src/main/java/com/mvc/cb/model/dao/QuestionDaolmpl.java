package com.mvc.cb.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mvc.cb.model.dto.QuestionDto;

@Repository
public class QuestionDaolmpl implements QuestionDao{
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<QuestionDto> selectList() {
		
		List<QuestionDto> list = new ArrayList<QuestionDto>();
		
		try {
			list = sqlSession.selectList(NAMESPACE+"selectList");
			
		}catch(Exception e) {
			System.out.println("[error] : Question selectList");
			e.printStackTrace();
		}
		
		
		return list;
	}

	@Override
	public QuestionDto selectOne(int question_No) {
		
		QuestionDto dto = null;
		
		try {
			dto = sqlSession.selectOne(NAMESPACE+"selectOne", question_No);
		}catch(Exception e){
			System.out.println("[error] : Question selectOne");
			e.printStackTrace();
		}
		return dto;
	}

}
