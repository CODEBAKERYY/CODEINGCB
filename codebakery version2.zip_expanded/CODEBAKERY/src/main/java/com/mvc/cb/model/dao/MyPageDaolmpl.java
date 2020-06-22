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
		//수정할 부분
		return sqlSession.update(NAMESPACE+"update_nonpw",dto);
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

	@Override
	public int deactivate(UserDto dto) {
		System.out.println("탈퇴 진행중"); 
		int res = sqlSession.delete(NAMESPACE+"member_delete", dto);
		return res;
	}

}
