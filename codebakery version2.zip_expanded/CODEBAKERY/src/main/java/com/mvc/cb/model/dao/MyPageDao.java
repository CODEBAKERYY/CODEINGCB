package com.mvc.cb.model.dao;

import java.util.List;

import com.mvc.cb.model.dto.UserDto;

public interface MyPageDao {
	String NAMESPACE ="mymember.";
	public UserDto login(UserDto dto);
	public int updateMember(UserDto dto);
	public int non_pw_update(UserDto dto);
	public int update_ajax(UserDto dto);
	public List<UserDto> selectList();
	public UserDto getInfo(UserDto dto);
	public int member_delete(UserDto dto);
}
