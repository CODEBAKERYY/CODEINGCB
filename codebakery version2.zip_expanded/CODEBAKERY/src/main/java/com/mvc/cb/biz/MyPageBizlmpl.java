package com.mvc.cb.biz;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mvc.cb.model.dao.MyPageDao;
import com.mvc.cb.model.dto.UserDto;
@Service
public class MyPageBizlmpl implements MyPageBiz{

	@Autowired
	private MyPageDao dao;
	
	@Override
	public int updateMember(UserDto dto) {
		return dao.updateMember(dto);
	}

	@Override
	public int update_nonpw(UserDto dto) {
		return dao.non_pw_update(dto);
	}



	@Override
	public UserDto getInfo(UserDto dto) {
		return dao.getInfo(dto);
	}

	@Override
	public int deactivate(UserDto dto) {
		return dao.deactivate(dto);
	}

}
