package com.mvc.cb.biz;

import java.util.List;

import com.mvc.cb.model.dto.UserDto;

public interface MyPageBiz {

	public List<UserDto> selectList();
	public UserDto selectOne(int myno);
	public int insert(UserDto dto);
	public int update(UserDto dto);
	public int delete(int myno);
	
	public UserDto login(UserDto dto);
	//추상 메소드 생성

//	 update 그냥 버전
	public int updateMember(UserDto dto);
	public int update_nonpw(UserDto dto);
//ajax이용 업데이트
	public int update_ajax(UserDto dto);
	
}
