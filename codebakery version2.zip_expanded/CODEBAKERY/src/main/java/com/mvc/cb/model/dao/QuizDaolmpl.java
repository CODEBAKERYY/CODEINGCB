package com.mvc.cb.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mvc.cb.model.dto.QuizDto;

@Repository
public class QuizDaolmpl implements QuizDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int insert(QuizDto dto) {

		int res = 0;

		try {
			res = sqlSession.insert(NAMESPACE + "insert", dto);
		} catch (Exception e) {
			System.out.println("[error] : QuizInsert");
			e.printStackTrace();
		}

		return res;
	}

	@Override
	public List<QuizDto> selectList() {

		List<QuizDto> quizList = new ArrayList<QuizDto>();

		try {
			quizList = sqlSession.selectList(NAMESPACE + "selectList");
			if (quizList == null) {
				System.out.println("왜 널이 뜰까유????????????????????????????????");
			}
		} catch (Exception e) {
			System.out.println("[error] : selectList");
			e.printStackTrace();
		}

		return quizList;
	}

	@Override
	public int count() {
		int res = 0;

		try {
			res = sqlSession.selectOne(NAMESPACE + "count");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public QuizDto selectOne(int quiz_No) {

		QuizDto dto = null;

		try {
			dto = sqlSession.selectOne(NAMESPACE + "selectOne", quiz_No);
		} catch (Exception e) {
			System.out.println("[error] : Quiz selectOne");
			e.printStackTrace();
		}

		return dto;
	}
}