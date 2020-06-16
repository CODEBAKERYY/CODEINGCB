package com.mvc.cb.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mvc.cb.model.dao.NoticeDao;
import com.mvc.cb.model.dto.NoticeDto;

@Service
public class NoticeBizlmpl implements NoticeBiz{
	
	@Autowired
	private NoticeDao dao;
	
	@Override
	public List<NoticeDto> selectAll() {
		return dao.selectAll();
	}

	@Override
	public NoticeDto selectOne(int notice_No) {
		return dao.selectOne(notice_No);
	}

	@Override
	public int insert(NoticeDto dto) {
		return dao.insert(dto);
	}

	@Override
	public int update(NoticeDto dto) {
		return dao.update(dto);
	}

	@Override
	public int delete(int notice_No) {
		return dao.delete(notice_No);
	}

	@Override
	public int viewUpdate(int notice_No) {
		return dao.viewUpdate(notice_No);
	}
	
}
