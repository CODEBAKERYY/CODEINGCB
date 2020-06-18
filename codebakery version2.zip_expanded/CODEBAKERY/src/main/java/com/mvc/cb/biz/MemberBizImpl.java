package com.mvc.cb.biz;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mvc.cb.model.dao.MemberDao;
import com.mvc.cb.model.dto.MemberDto;

@Service
public class MemberBizImpl implements MemberBiz{
	
	@Autowired
	private MemberDao dao;
	
	@Override
	public MemberDto login(MemberDto dto) {
		return dao.login(dto);
	}

	@Override
	public MemberDto getInfo(MemberDto dto) {
		return dao.getInfo(dto);
	}


	@Override
	public int updateMember(MemberDto dto) {
		return dao.updateMember(dto);
	}



	@Override
	public int update_nonpw(MemberDto dto) {
		return dao.non_pw_update(dto);
	}




	@Override
	public MemberDto selectone(String user_id) {
		
		return null;
	}

	@Override
	public int member_delete(MemberDto dto) {
		
		return dao.member_delete(dto);
	}
	
	
	
}
