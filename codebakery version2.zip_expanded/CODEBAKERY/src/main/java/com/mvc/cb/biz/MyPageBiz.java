package com.mvc.cb.biz;

import java.util.List;

import com.mvc.cb.model.dto.UserDto;

public interface MyPageBiz {

	public int updateMember(UserDto dto);
	public int update_nonpw(UserDto dto);
	
	public int member_delete(UserDto dto);
	
	public UserDto getInfo(UserDto dto);
	
	//관리자 유저리스트
	public List<UserDto> userList();
}
