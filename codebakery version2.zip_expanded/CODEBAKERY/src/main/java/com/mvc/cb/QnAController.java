package com.mvc.cb;



import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mvc.cb.biz.AnswerBiz;
import com.mvc.cb.biz.QCommentBiz;
import com.mvc.cb.biz.QuestionBiz;
import com.mvc.cb.model.dto.AnswerDto;
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
import com.mvc.cb.model.dto.QnACommentDto;
>>>>>>> parent of 4d88b8a... 승연이꺼 추가
=======
import com.mvc.cb.model.dto.QnACommentDto;
>>>>>>> parent of 4d88b8a... 승연이꺼 추가
=======
>>>>>>> parent of 3d4349c... ㅈㄷㄹ
import com.mvc.cb.model.dto.QuestionDto;

@Controller
public class QnAController {
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Autowired
	private QuestionBiz q_biz;
	
	@Autowired
	private AnswerBiz a_biz;
	
	@Autowired
	private QCommentBiz c_biz;
	
	
	// 메뉴에서 '질의응답'을 누르면 들어오는 요청
	@RequestMapping(value = "/qna.do")
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> parent of 3d4349c... ㅈㄷㄹ
	public String QnAList(Model model)
			//, QnAPagingDto dto 
//						@RequestParam(value="nowPage", required=false)String nowPage,
//						@RequestParam(value="cntPerPage", required=false)String cntPerPage,
//						@RequestParam("question_No")int question_No) 
						{
		logger.info("QnAList");
		model.addAttribute("list", q_biz.selectList());
		//q_biz.plusCnt(question_No);
<<<<<<< HEAD
		
//		int total = q_biz.countBoard();
//		if(nowPage == null && cntPerPage == null) {
//			nowPage = "1";
//			cntPerPage = "5";
//		} 
=======
	public String QnAList(Model model) {
		logger.info("QnAList");
		model.addAttribute("list", q_biz.selectList());
=======
	public String QnAList(Model model) {
		logger.info("QnAList");
		model.addAttribute("list", q_biz.selectList());
>>>>>>> parent of 4d88b8a... 승연이꺼 추가
		
		System.out.println();
		
		//model.addAttribute("cnt", a_biz.cntAnswer(question_No));
<<<<<<< HEAD
>>>>>>> parent of 4d88b8a... 승연이꺼 추가
=======
>>>>>>> parent of 4d88b8a... 승연이꺼 추가
=======
		
//		int total = q_biz.countBoard();
//		if(nowPage == null && cntPerPage == null) {
//			nowPage = "1";
//			cntPerPage = "5";
//		} 
>>>>>>> parent of 3d4349c... ㅈㄷㄹ
		
		return "qna";
	}
	
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
	// 하나의 질문제목을 클릭했을때 들어오는 요청
=======
=======
>>>>>>> parent of 4d88b8a... 승연이꺼 추가
	// 질문제목을 클릭했을때 들어오는 요청
>>>>>>> parent of 4d88b8a... 승연이꺼 추가
=======
	// 하나의 질문제목을 클릭했을때 들어오는 요청
>>>>>>> parent of 3d4349c... ㅈㄷㄹ
	@RequestMapping( value = "/qna_detail.do")
	public String QnADetail(Model model, Integer question_No) {
		logger.info("QnaDetail");
		
		//조회수 증가
		q_biz.plusCnt(question_No);
		
		model.addAttribute("qlist", q_biz.selectOne(question_No));
		model.addAttribute("alist", a_biz.selectList(question_No));
		model.addAttribute("clist", c_biz.selectList(question_No));
		
		return "qna_detail";
	}
	
	// 질의응답 게시판에서 글쓰기를 눌렀을시 들어오는 요청
	@RequestMapping( value = "/qna_write.do" )
	public String QnAWrite(String user_Id) {
		logger.info("QnAWrite");
		System.out.println("qnawrite"+user_Id);
		return "qna_write";
	}
	
	// 글쓰기 성공후 페이지 이동
	@RequestMapping( value = "/insert_question.do" )
	public String insertQnA(QuestionDto dto) {
		logger.info("insert_Question");
		
		System.out.println(dto.getQuestion_Tag());
		System.out.println(dto.getUser_Id());
		
		int res = q_biz.insert(dto);
		
		
		if(res>0) {
			return  "redirect:qna.do";
		} else {
			return "redirect:qna_write.do";
		}
	}
	
	// 질문글 삭제
	@RequestMapping( value = "/qna_delete.do" )
	public String deleteQnA(int question_No) {
		logger.info("delete_Question");
		int res = q_biz.delete(question_No);
		
		if(res>0) {
			return "redirect:qna.do";
		} else {
			return "redirect:qna_detail.do?question_No="+question_No;
		}
	}
	
	// 질문글 수정눌렀을시 들어오는 요청
	@RequestMapping( value="/qna_update.do" )
	public String QnAEdit(Model model, int question_No) {
		logger.info("edit_Question");
		model.addAttribute("dto", q_biz.selectOne(question_No));
		return "qna_update";
	}
	
	// 질문글 수정 성공 후 페이지이동
	@RequestMapping( value="/update_question.do" )
	public String updateQnA(QuestionDto dto) {
		logger.info("update_Question");
		int res = q_biz.update(dto);
		
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
=======
>>>>>>> parent of 4d88b8a... 승연이꺼 추가
//		String str = dto.getQuestion_Tag();
//		
//		String[] split =  str.split(",");
//		
//		System.out.println(split.length);
//		System.out.println(Arrays.toString(split));
//		
//		String tags = "";
//		
//		for(int i=0; i<split.length; i++) {
//			tags += split[i];
//			System.out.println(tags);
//		}
//		
//		model.addAttribute("tag", tags);
		
<<<<<<< HEAD
>>>>>>> parent of 4d88b8a... 승연이꺼 추가
=======
>>>>>>> parent of 4d88b8a... 승연이꺼 추가
=======
>>>>>>> parent of 3d4349c... ㅈㄷㄹ
		if(res>0) {
			return "redirect:qna_detail.do?question_No="+dto.getQuestion_No();
		} else {
			return "redirect:qna_update.do?question_No="+dto.getQuestion_No();
		}
	}
	
	// 답변삭제
	@RequestMapping( value="/answer_delete.do" )
	public String deleteAnswer(Integer answer_No, Integer question_No) {
		logger.info("Delete Answer");
		
		int res = a_biz.delete(answer_No);
		
		if(res>0) {
			return "redirect:qna_detail.do?question_No="+question_No;
		} else {
			return "redirect:qna_detail.do?question_No="+question_No;
		}
<<<<<<< HEAD
<<<<<<< HEAD
	}
=======
		}
		// ------------------------ 질문글 수정/삭제 END-------------------------
<<<<<<< HEAD
=======
		
		// ------------------------ 답변 직성/수정/삭제 START-------------------------
=======
	}
>>>>>>> parent of 3d4349c... ㅈㄷㄹ
	
	@RequestMapping( value="/answer_modify.do" )
	public String modifyAnswer(Integer question_No, Integer answer_No, String answer_Title, String answer_Content) {
		logger.info("Modify Answer");
		
<<<<<<< HEAD
		//답변수정 -> 팝업창으로 넘김
		@RequestMapping( value="/answer_modify.do" )
		public String modifyAnswer(Model model, AnswerDto dto) {
			logger.info("Modify Answer");
			
			model.addAttribute("ans", dto);
			
			return "modifyAnswer";
			}
>>>>>>> parent of 4d88b8a... 승연이꺼 추가
		
		// ------------------------ 답변 직성/수정/삭제 START-------------------------
>>>>>>> parent of 4d88b8a... 승연이꺼 추가
	
	@RequestMapping( value="/answer_modify.do" )
	public String modifyAnswer(Integer question_No, Integer answer_No, String answer_Title, String answer_Content) {
		logger.info("Modify Answer");
		
		AnswerDto dto = new AnswerDto();
		dto.setAnswer_No(answer_No);
		dto.setAnswer_Title(answer_Title);
		dto.setAnswer_Content(answer_Content);
		
<<<<<<< HEAD
		int res = a_biz.update(dto);
=======
		//팝업창에서 답변 변경후 넘김
		@RequestMapping( value="/changeAnswer.do" )
		public String changeAnswer(AnswerDto dto){
			logger.info("changeAnswer");
			
			
			int res = a_biz.update(dto);
			
			
			return "redirect:qna_detail.do?question_No="+dto.getQuestion_No();
		}
>>>>>>> parent of 4d88b8a... 승연이꺼 추가
=======
		AnswerDto dto = new AnswerDto();
		dto.setAnswer_No(answer_No);
		dto.setAnswer_Title(answer_Title);
		dto.setAnswer_Content(answer_Content);
		
		int res = a_biz.update(dto);
>>>>>>> parent of 3d4349c... ㅈㄷㄹ
		
		if(res>0) {
			return "redirect:qna_detail.do?question_No="+question_No;
		} else {
			return "redirect:qna_detail.do?question_No="+question_No;
		}
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> parent of 3d4349c... ㅈㄷㄹ
	}
	
	// 답변 작성시 들어오는 요청
	@RequestMapping( value="/answer_write.do" )
	public String insertAnswer(String answer_Title, String answer_Content) {
		logger.info("Insert Answer");
<<<<<<< HEAD
=======
=======
>>>>>>> parent of 4d88b8a... 승연이꺼 추가
		
		// ------------------------ 답변 등록/수정/삭제 END -------------------------
		
		// ------------------------ 댓글 등록/수정/삭제 START-------------------------
		
		
		// 질문글에 댓글 작성
		@RequestMapping( value = "/writeComment.do")
		public String insertComment(QnACommentDto dto) {
>>>>>>> parent of 4d88b8a... 승연이꺼 추가
=======
>>>>>>> parent of 3d4349c... ㅈㄷㄹ
		
		AnswerDto dto = new AnswerDto();
		dto.setAnswer_Title(answer_Title);
		dto.setAnswer_Content(answer_Content);
		
		int res = a_biz.insert(dto);

<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> parent of 3d4349c... ㅈㄷㄹ
		if(res>0) {
			return "redirect:qna_do";
		} else {
			return "redirect:qna_do";
		}
	}
<<<<<<< HEAD
=======
		// 댓글 수정
		@RequestMapping( value="/updateComment.do" )
		@ResponseBody
		public String updateComment(@RequestParam int comment_No, @RequestParam String comment_Content) {
			logger.info("updateComment");
			
			System.out.println(comment_No + " : "+comment_Content);
			QnACommentDto dto = new QnACommentDto();
			dto.setComment_No(comment_No);
			dto.setComment_Content(comment_Content);
			
			
			int res =  c_biz.update(dto);
			
			if(res>0) {
				return "location.reload()";
			} else {
				return "location.reload()";
			}
		}
		
		
		
		// ------------------------ 답변 등록/수정/삭제 END -------------------------
<<<<<<< HEAD
>>>>>>> parent of 4d88b8a... 승연이꺼 추가
=======
>>>>>>> parent of 4d88b8a... 승연이꺼 추가
=======
>>>>>>> parent of 3d4349c... ㅈㄷㄹ

}
