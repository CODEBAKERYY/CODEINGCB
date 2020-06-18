package com.mvc.cb.biz;

import java.util.List;

import com.mvc.cb.model.dto.UserDto;

public interface MyPageBiz {
	public UserDto login(UserDto dto);
	//추상 메소드 생성

//	 update 그냥 버전
	public int updateMember(UserDto dto);
	public int update_nonpw(UserDto dto);
//ajax이용 업데이트
	public int update_ajax(UserDto dto);

	List<UserDto> selectList();

	UserDto selectOne(int myno);

	int insert(UserDto dto);

	int update(UserDto dto);

	int delete(int myno);
//
	public UserDto getInfo(UserDto dto);
	public UserDto selectone(String user_id);
	public int member_delete(UserDto dto);
}
