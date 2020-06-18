package com.mvc.cb.model.dao;

import com.mvc.cb.model.dto.MemberDto;

public interface MemberDao {
	String NAMESPACE ="mymember.";
	public MemberDto login(MemberDto dto);
	public int updateMember(MemberDto dto);
	public int non_pw_update(MemberDto dto);
	public int update_ajax(MemberDto dto);
	public MemberDto getInfo(MemberDto dto);
	public int member_delete(MemberDto dto);
	
//	public boolean checkPw(String user_pw, String user_pwchk);
	
	
	
	
}
