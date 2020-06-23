package com.mvc.cb.model.dao;

import java.util.List;

import com.mvc.cb.model.dto.MentorReviewDto;

public interface MentorReviewDao {
	
	String NAMESPACE = "mentorReview.";

	List<MentorReviewDto> selectList();

	MentorReviewDto selectOne(int mentor_No);

	List<MentorReviewDto> review(int mentor_No);

}
