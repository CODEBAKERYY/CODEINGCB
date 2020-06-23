package com.mvc.cb.biz;

import com.mvc.cb.model.dto.UserDto;

public interface MyPageBiz {

	public int updateMember(UserDto dto);
	public int update_nonpw(UserDto dto);
	
	public int member_delete(UserDto dto);
	
	public UserDto getInfo(UserDto dto);
}
