package com.mvc.cb.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mvc.cb.model.dto.PointDto;

@Repository
public class MyPointDaoImpl implements MyPointDao{
	
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<PointDto> selectAll(String user_Id) {
		System.out.println("MyPointDao 포인트 사용내역 가저오는 중");
		List<PointDto> list = new ArrayList<PointDto>();
		try {
			list = sqlSession.selectList(NAMESPACE + "selectList",user_Id);
		} catch (Exception e) {
			System.out.println("[error]mypointdaoimpl : select list");
			e.printStackTrace();
		}
		return list;
	}
	
	

	@Override
	public int insert(PointDto dto) {
		System.out.println("MyPointDao 포인트 사용내역 넣는중");
		int res = 0;
		try {
			res = sqlSession.insert(NAMESPACE + "insert",dto);
			
		} catch(Exception e) {
			System.out.println("[error] : insert");
			e.printStackTrace();
		}
		
		return res;
	}
	
	
	
}
