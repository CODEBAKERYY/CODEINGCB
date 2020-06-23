package com.mvc.cb.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mvc.cb.model.dto.NoticeCommentDto;

@Repository
public class NoticeCommentDaolmpl implements NoticeCommentDao{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<NoticeCommentDto> selectAll(int notice_No) {
		
		List<NoticeCommentDto> list = new ArrayList<NoticeCommentDto>();
		
		
		try {
			list = sqlSession.selectList(NAMESPACE + "selectList",notice_No);
			} catch(Exception e) {
				System.out.println("[error] : select list");
				e.printStackTrace();
			}
			
			return list;
		
	}

	@Override
	public NoticeCommentDto selectOne(int comment_No) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insert(NoticeCommentDto dto) {
		
		int res = 0;
		try {
			res = sqlSession.insert(NAMESPACE + "insert",dto);
		} catch(Exception e) {
			System.out.println("[error] : comment insert");
			e.printStackTrace();
		}
		
		return res;
		
	}

	@Override
	public int update(NoticeCommentDto dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(int comment_No) {
		// TODO Auto-generated method stub
		return 0;
	}

}
