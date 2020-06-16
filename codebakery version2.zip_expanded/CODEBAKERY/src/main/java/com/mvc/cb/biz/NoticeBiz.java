package com.mvc.cb.biz;

import java.util.List;

import com.mvc.cb.model.dto.NoticeDto;

public interface NoticeBiz {
	
	public List<NoticeDto> selectAll();
	public NoticeDto selectOne(int notice_No);
	public int insert(NoticeDto dto);
	public int update(NoticeDto dto);
	public int delete(int notice_No);
	public int viewUpdate(int notice_No);
	
}
