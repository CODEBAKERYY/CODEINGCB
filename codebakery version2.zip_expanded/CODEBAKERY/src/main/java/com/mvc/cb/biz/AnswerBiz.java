package com.mvc.cb.biz;

import java.util.List;

import com.mvc.cb.model.dto.AnswerDto;

public interface AnswerBiz {
	
	
	// 답변리스트 불러오기
	public List<AnswerDto> selectList(int question_No);

	public int delete(int answer_No);

	public int update(AnswerDto dto);
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
=======
>>>>>>> parent of 4d88b8a... 승연이꺼 추가

	public int insert(AnswerDto dto);

	public int cntAnswer(Integer question_No);
<<<<<<< HEAD
=======

	public int count();
>>>>>>> parent of 4d88b8a... 승연이꺼 추가

	public int count();
>>>>>>> parent of 4d88b8a... 승연이꺼 추가
=======
>>>>>>> parent of 3d4349c... ㅈㄷㄹ

	public int insert(AnswerDto dto);
}
