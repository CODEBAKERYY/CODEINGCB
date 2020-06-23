package com.mvc.cb.biz;

import java.util.List;

import com.mvc.cb.model.dto.QnACommentDto;

public interface QCommentBiz {
	
	public List<QnACommentDto> selectList(int question_No);
<<<<<<< HEAD

=======
	
	public int insert(QnACommentDto dto);
	
	public int update(QnACommentDto dto);
	
	public int delete(int comment_No);
	
>>>>>>> parent of 4d88b8a... 승연이꺼 추가
}
