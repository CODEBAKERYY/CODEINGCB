package com.mvc.cb.biz;

import java.util.List;

import com.mvc.cb.model.dto.MentorDto;

public interface MentorBiz {

	public List<MentorDto> selectList();

	public MentorDto selectOne(int MENTOR_NO);
}
