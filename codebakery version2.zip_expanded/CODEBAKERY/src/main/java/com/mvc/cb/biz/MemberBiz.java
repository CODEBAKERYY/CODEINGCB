package com.mvc.cb.biz;

import com.mvc.cb.model.dto.MemberDto;

public interface MemberBiz {
	public MemberDto login(MemberDto dto);
	//추상 메소드 생성
	public MemberDto getInfo(MemberDto dto);
//	 update 그냥 버전
	public int updateMember(MemberDto dto);
	public int update_nonpw(MemberDto dto);
	
	public MemberDto selectone(String user_id);
//  회원 탈퇴
	public int member_delete(MemberDto dto);
	
	
}
