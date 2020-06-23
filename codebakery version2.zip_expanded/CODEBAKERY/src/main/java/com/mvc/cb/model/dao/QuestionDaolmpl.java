package com.mvc.cb.model.dao;

import java.util.ArrayList;
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
import java.util.Arrays;
>>>>>>> parent of 4d88b8a... 승연이꺼 추가
=======
import java.util.Arrays;
>>>>>>> parent of 4d88b8a... 승연이꺼 추가
=======
>>>>>>> parent of 3d4349c... ㅈㄷㄹ
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mvc.cb.model.dto.QuestionDto;

@Repository
public class QuestionDaolmpl implements QuestionDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<QuestionDto> selectList() {
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> parent of 3d4349c... ㅈㄷㄹ
		
		List<QuestionDto> list = new ArrayList<QuestionDto>();
		
		try {
			list = sqlSession.selectList(NAMESPACE+"selectList");
			
		}catch(Exception e) {
			System.out.println("[error] : Question selectList");
			e.printStackTrace();
		}
		
		
<<<<<<< HEAD
=======

		List<QuestionDto> list = new ArrayList<QuestionDto>();

		try {
			list = sqlSession.selectList(NAMESPACE + "selectList");

		} catch (Exception e) {
			System.out.println("[error] : Question selectList");
			e.printStackTrace();
		}

>>>>>>> parent of 4d88b8a... 승연이꺼 추가
=======

		List<QuestionDto> list = new ArrayList<QuestionDto>();

		try {
			list = sqlSession.selectList(NAMESPACE + "selectList");

		} catch (Exception e) {
			System.out.println("[error] : Question selectList");
			e.printStackTrace();
		}

>>>>>>> parent of 4d88b8a... 승연이꺼 추가
=======
>>>>>>> parent of 3d4349c... ㅈㄷㄹ
		return list;
	}

	@Override
	public QuestionDto selectOne(int question_No) {

		QuestionDto dto = null;

		try {
			dto = sqlSession.selectOne(NAMESPACE + "selectOne", question_No);
		} catch (Exception e) {
			System.out.println("[error] : Question selectOne");
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public int insert(QuestionDto dto) {

		int res = 0;

		try {
<<<<<<< HEAD
<<<<<<< HEAD
			res = sqlSession.insert(NAMESPACE+"insert", dto);
		} catch(Exception e) {
=======
			res = sqlSession.insert(NAMESPACE + "insert", dto);

		} catch (Exception e) {
>>>>>>> parent of 4d88b8a... 승연이꺼 추가
=======
			res = sqlSession.insert(NAMESPACE + "insert", dto);

		} catch (Exception e) {
>>>>>>> parent of 4d88b8a... 승연이꺼 추가
			System.out.println("[error] : Question insert");
			e.printStackTrace();
		}

		return res;
	}

	@Override
	public int delete(int question_No) {

		int res = 0;

		try {
			res = sqlSession.delete(NAMESPACE + "delete", question_No);
		} catch (Exception e) {
			System.out.println("[error] : Question delete");
			e.printStackTrace();
		}

		return res;
	}

	@Override
	public int update(QuestionDto dto) {

		int res = 0;

		try {
			res = sqlSession.update(NAMESPACE + "update", dto);
		} catch (Exception e) {
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
<<<<<<< HEAD
<<<<<<< HEAD
		
		
		
		sqlSession.update(NAMESPACE+"plusCnt", question_No);
		
=======

		sqlSession.update(NAMESPACE + "plusCnt", question_No);

>>>>>>> parent of 4d88b8a... 승연이꺼 추가
	}

=======

		sqlSession.update(NAMESPACE + "plusCnt", question_No);

	}

<<<<<<< HEAD
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

<<<<<<< HEAD
>>>>>>> parent of 4d88b8a... 승연이꺼 추가
=======
>>>>>>> parent of 4d88b8a... 승연이꺼 추가
=======
>>>>>>> parent of 3d4349c... ㅈㄷㄹ
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
