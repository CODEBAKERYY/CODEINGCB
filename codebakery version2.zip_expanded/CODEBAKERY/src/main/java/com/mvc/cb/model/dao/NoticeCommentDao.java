package com.mvc.cb.model.dao;

import java.util.List;

import com.mvc.cb.model.dto.NoticeCommentDto;

public interface NoticeCommentDao {
   
   String NAMESPACE = "notice_comment.";
   
   public List<NoticeCommentDto> selectAll(int notice_No);
   public NoticeCommentDto selectOne(int comment_No);
   public int insert(NoticeCommentDto dto);
   public int update(NoticeCommentDto dto);
   public int delete(int comment_No);

}