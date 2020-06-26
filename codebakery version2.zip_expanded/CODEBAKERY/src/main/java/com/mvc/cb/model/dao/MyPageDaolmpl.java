package com.mvc.cb.model.dao;

import java.util.ArrayList;
import java.util.List;

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
	
	//관리자 유저리스트
	@Override
	public List<UserDto> userList() {
		
		List<UserDto> list = new ArrayList<UserDto>();
		
		try {
	         list = sqlSession.selectList(NAMESPACE + "userList");
	         } catch(Exception e) {
	            System.out.println("[error] : userList");
	            e.printStackTrace();
	         }
	         
	         return list;
		
	}

	@Override
	public int updatePoint(UserDto dto) {
		System.out.println("포인트 충전 중");
		int res = sqlSession.update(NAMESPACE+"pointUpdate", dto);
		return res;
	}

}
