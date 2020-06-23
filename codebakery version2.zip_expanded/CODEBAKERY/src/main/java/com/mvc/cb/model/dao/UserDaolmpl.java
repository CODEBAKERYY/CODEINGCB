package com.mvc.cb.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mvc.cb.model.dto.UserDto;

@Repository
public class UserDaolmpl implements UserDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int signup(UserDto dto) {
		System.out.println("다오 인설트문 왔다");
		int res = 0;
		try {
			res = sqlSession.insert(NAMESPACE + "insert", dto);
			System.out.println("다오에서 insert 돌았단다");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("error");
		}

		return res;
	}

	@Override
	public UserDto login(UserDto dto) {
		
		System.out.println("로그인 왔다");
		UserDto res = null;

		try {
			res = sqlSession.selectOne(NAMESPACE + "login", dto);
			System.out.println("로그인 가져왔다");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}

}
