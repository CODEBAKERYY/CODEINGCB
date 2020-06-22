package com.mvc.cb.model.dao;

import com.mvc.cb.model.dto.UserDto;

public interface MyPageDao {

	String NAMESPACE = "myuser.";
	
	public int updateMember(UserDto dto);

	public int non_pw_update(UserDto dto);

	

	public UserDto getInfo(UserDto dto);

	public int deactivate(UserDto dto);

}
