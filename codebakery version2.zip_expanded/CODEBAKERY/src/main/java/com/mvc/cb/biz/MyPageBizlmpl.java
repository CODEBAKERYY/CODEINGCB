//package com.mvc.cb.biz;
//
//import java.util.List;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Service;
//
//import com.mvc.cb.model.dao.MyPageDao;
//import com.mvc.cb.model.dto.UserDto;
//
//@Service
//public class MyPageBizlmpl implements MyPageBiz{
//
//	
//	
//	@Autowired
//	private MyPageDao dao;
////	MyPageDao로 수정하기
//	
//	@Override
//	public UserDto login(UserDto dto) {
//		return dao.login(dto);
//	}
//
//
//
//	@Override
//	public int updateMember(UserDto dto) {
//		return dao.updateMember(dto);
//	}
//
//
//
//	@Override
//	public int update_nonpw(UserDto dto) {
//		return dao.non_pw_update(dto);
//	}
//
//
//
//	@Override
//	public int update_ajax(UserDto dto) {
//		return dao.update_ajax(dto);
//	}
//	
//	@Override
//	public List<UserDto> selectList() {
//		
//		return dao.selectList();
//	}
//
//	@Override
//	public UserDto selectOne(int myno) {
////         MyPageDto로 수정
//		return null;
//	}
//
//	@Override
//	public int insert(UserDto dto) {
//		// TODO Auto-generated method stub
//		return 0;
//	}
//
//	@Override
//	public int update(UserDto dto) {
//		// TODO Auto-generated method stub
//		return 0;
//	}
//
//	@Override
//	public int delete(int myno) {
//		// TODO Auto-generated method stub
//		return 0;
//	}
//}
