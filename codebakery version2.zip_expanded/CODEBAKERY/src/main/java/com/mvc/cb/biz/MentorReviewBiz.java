package com.mvc.cb.biz;

import java.util.List;

import com.mvc.cb.model.dto.MentorReviewDto;

public interface MentorReviewBiz {

	public List<MentorReviewDto> selectList();

	public MentorReviewDto selectOne(int mentor_No);

	public List<MentorReviewDto> reviewAll(int mentor_No);

}
