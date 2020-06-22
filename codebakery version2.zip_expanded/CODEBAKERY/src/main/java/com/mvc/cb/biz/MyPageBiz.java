package com.mvc.cb.biz;

import com.mvc.cb.model.dto.UserDto;

public interface MyPageBiz {

	public int updateMember(UserDto dto);
	public int update_nonpw(UserDto dto);
	
	
	
	public UserDto getInfo(UserDto dto);
	public int deactivate(UserDto dto);
}
