package com.mvc.cb.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mvc.cb.model.dto.UserDto;

@Repository
public class MyPageDaolmpl {

	public class MyPageDaoImpl implements MyPageDao{
		//객체 생성 필요 없이 autowired
		@Autowired
		private SqlSessionTemplate sqlSession;
		
		@Override
		public UserDto login(UserDto dto) {
			MemberDto res = null;
			try {
				res = sqlSession.selectOne(NAMESPACE+"login",dto);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			return res;
		}

		@Override
		public int updateMember(UserDto dto) {
			return sqlSession.update(NAMESPACE+"memberUpdate",dto);
		}
	//
//		@Override
//		public boolean checkPw(String user_pw, String user_pwchk) {
//			boolean result = false;
//			Map<String, String> map = new HashMap<String,String>();
//			map.put("user_pw", user_pw);
//			map.put("user_pwchk", user_pwchk);
//			int count = sqlSession.selectOne(NAMESPACE+"checkPw",map);
//			if(count == 1) result = true;
//			return result;
//		}
	//	

		@Override
		public int non_pw_update(UserDto dto) {
			return sqlSession.update(NAMESPACE+"update_nonpw",dto);
		}

		@Override
		public int update_ajax(UserDto dto) {
			return sqlSession.update(NAMESPACE+"update_ajax",dto);
		}
		
   }
}
