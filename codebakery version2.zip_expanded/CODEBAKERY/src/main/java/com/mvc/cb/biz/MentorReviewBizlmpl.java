package com.mvc.cb.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mvc.cb.model.dao.MentorReviewDao;
import com.mvc.cb.model.dto.MentorReviewDto;

@Service
public class MentorReviewBizlmpl implements MentorReviewBiz{

	
	
	@Autowired
	private MentorReviewDao dao;
	
	@Override
	public List<MentorReviewDto> selectList() {
		return dao.selectList();
	}

}
