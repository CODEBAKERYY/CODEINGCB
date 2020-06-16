package com.mvc.cb.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mvc.cb.model.dto.AnswerDto;

@Repository
public class AnswerDaolmpl implements AnswerDao{
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<AnswerDto> selectList(int question_No) {
		
		List<AnswerDto> list = new ArrayList<AnswerDto>();
		
		try {
			list = sqlSession.selectList(NAMESPACE+"selectList", question_No);
		}catch(Exception e) {
			System.out.println("[error] : Answer selectList");
			e.printStackTrace();
		}
		return list;
	}

}
