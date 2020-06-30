package com.mvc.cb.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mvc.cb.model.dao.MyPointDao;
import com.mvc.cb.model.dto.PointDto;

@Service
public class MyPointBizImpl implements MyPointBiz{

	@Autowired
	private MyPointDao dao;
	
	@Override
	public List<PointDto> selectAll(String id) {
		return dao.selectAll(id);
	}

}