package com.mvc.cb.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mvc.cb.model.dto.MentorReviewDto;

@Repository
public class MentorReviewDaolmpl implements MentorReviewDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<MentorReviewDto> selectList() {

		List<MentorReviewDto> list = new ArrayList<MentorReviewDto>();

		try {
			list = sqlSession.selectList(NAMESPACE + "ReviewAll");
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

}
