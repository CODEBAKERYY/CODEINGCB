package com.mvc.cb.model.dao;

import com.mvc.cb.model.dto.UserDto;

public interface UserDao {
	
	String NAMESPACE = "myuser.";

	public int signup(UserDto dto);

	public UserDto login(UserDto dto);
}
