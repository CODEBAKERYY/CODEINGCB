package com.mvc.cb.biz;

import com.mvc.cb.model.dto.UserDto;

public interface MyPageBiz {
	public UserDto login(UserDto dto);
	//추상 메소드 생성

//	 update 그냥 버전
	public int updateMember(UserDto dto);
	public int update_nonpw(UserDto dto);
//ajax이용 업데이트
	public int update_ajax(UserDto dto);
	
	
	
}
