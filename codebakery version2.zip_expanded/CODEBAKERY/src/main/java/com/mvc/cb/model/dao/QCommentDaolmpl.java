package com.mvc.cb.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mvc.cb.model.dto.QnACommentDto;

@Repository
public class QCommentDaolmpl implements QCommentDao{
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<QnACommentDto> selectList(int question_No) {
		
		List<QnACommentDto> list = new ArrayList<QnACommentDto>();
		
		try {
			list = sqlSession.selectList(NAMESPACE+"selectList", question_No);
		}catch(Exception e) {
			System.out.println("[error] : QCommentDao selectList");
			e.printStackTrace();
		}
		
		return list;
	}
	
	

}
