package com.mvc.cb.biz;

import com.mvc.cb.model.dto.UserDto;

public interface UserBiz {

	
	public int signup(UserDto dto);

	public UserDto login(UserDto dto);

	public UserDto idcheck(String user_Id);
	
	
}
