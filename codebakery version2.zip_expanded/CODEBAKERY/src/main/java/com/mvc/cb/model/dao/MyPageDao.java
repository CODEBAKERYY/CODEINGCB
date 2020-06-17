package com.mvc.cb.model.dao;

import com.mvc.cb.model.dto.UserDto;

public interface MyPageDao {
	String NAMESPACE ="mymember.";
	public UserDto login(UserDto dto);
	public int updateMember(UserDto dto);
	public int non_pw_update(UserDto dto);
	public int update_ajax(UserDto dto);
}
