package com.mvc.cb.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mvc.cb.model.dto.UserDto;

@Repository
public class MyPageDaolmpl implements MyPageDao{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int updateMember(UserDto dto) {
		System.out.println("update 실행");
		return sqlSession.update(NAMESPACE+"memberUpdate",dto);
	}

	@Override
	public int non_pw_update(UserDto dto) {
		System.out.println("non_pw_update안돌아?");
		return sqlSession.update(NAMESPACE+"update_nonpw",dto);
	}

	@Override
	public int member_delete(UserDto dto) {
		return sqlSession.delete(NAMESPACE+"member_delete",dto);
	}

	@Override
	public UserDto getInfo(UserDto dto) {
		UserDto res = null;
			try {
				res = sqlSession.selectOne(NAMESPACE + "getInfo",dto);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		return res;
	}

}
