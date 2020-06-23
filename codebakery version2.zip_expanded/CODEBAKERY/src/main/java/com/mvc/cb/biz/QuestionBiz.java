package com.mvc.cb.biz;

import java.util.List;

import com.mvc.cb.model.dto.QuestionDto;

public interface QuestionBiz {
	
	public List<QuestionDto> selectList();
	public QuestionDto selectOne(int question_No);
	public int insert(QuestionDto dto);
	public int delete(int question_No);
	public int update(QuestionDto dto);

	public void plusCnt(int question_No);
<<<<<<< HEAD
<<<<<<< HEAD
	
//	//게시물 총 갯수
//	public int countBoard();
//		
//	//페이징 처리 게시글 조회
//	public List<QuestionDto> selectBoard(QnAPagingDto dto);
=======
	public int count();
	
>>>>>>> parent of 4d88b8a... 승연이꺼 추가
=======
	public int count();
	
>>>>>>> parent of 4d88b8a... 승연이꺼 추가
}
