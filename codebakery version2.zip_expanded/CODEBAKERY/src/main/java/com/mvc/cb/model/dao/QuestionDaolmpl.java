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

	@Override
	public int insert(QuestionDto dto) {
		
		int res = 0;
		
		try {
			res = sqlSession.insert(NAMESPACE+"insert", dto);
		} catch(Exception e) {
			System.out.println("[error] : Question insert");
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int delete(int question_No) {
		
		int res = 0;
		
		try {
			res = sqlSession.delete(NAMESPACE+"delete", question_No);
		} catch(Exception e) {
			System.out.println("[error] : Question delete");
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int update(QuestionDto dto) {
		
		int res = 0;
		
		try {
			res = sqlSession.update(NAMESPACE+"update", dto);
		} catch(Exception e) {
			System.out.println("[error] : Question update");
			e.printStackTrace();
		}
		return res;
	}

//	@Override
//	public int countBoard() {
//		return 0;
//	}

	@Override
	public void plusCnt(int question_No) {
		
		
		sqlSession.update(NAMESPACE+"plusCnt", question_No);
		
	}

//	@Override
//	public List<QuestionDto> selectBoard(QnAPagingDto dto) {
//		return null;
//	}
//
//	@Override
//	public boolean plusCnt(int question_No) {
//		// TODO Auto-generated method stub
//		return false;
//	}

}
