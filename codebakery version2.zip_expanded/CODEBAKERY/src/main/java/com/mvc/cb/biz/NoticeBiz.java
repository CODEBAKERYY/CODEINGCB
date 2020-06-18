package com.mvc.cb.biz;

import java.util.List;

import com.mvc.cb.model.dto.NoticeDto;
import com.mvc.cb.model.dto.Pagination;

public interface NoticeBiz {
	
	public List<NoticeDto> selectAll(Pagination pagination);
	public NoticeDto selectOne(int notice_No);
	public int insert(NoticeDto dto);
	public int update(NoticeDto dto);
	public int delete(int notice_No);
	public int viewUpdate(int notice_No);
	public int pageCnt(Pagination pagination);
	
}
