package com.mvc.cb;

import java.util.List;

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
	public String QnAList(Model model)
			//, QnAPagingDto dto 
//						@RequestParam(value="nowPage", required=false)String nowPage,
//						@RequestParam(value="cntPerPage", required=false)String cntPerPage,
//						@RequestParam("question_No")int question_No) 
						{
		logger.info("QnAList");
		model.addAttribute("list", q_biz.selectList());
		//q_biz.plusCnt(question_No);
		
//		int total = q_biz.countBoard();
//		if(nowPage == null && cntPerPage == null) {
//			nowPage = "1";
//			cntPerPage = "5";
//		} 
		
		return "qna";
	}
	
	// 하나의 질문제목을 클릭했을때 들어오는 요청
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
	}
	
	@RequestMapping( value="/answer_modify.do" )
	public String modifyAnswer(Integer question_No, Integer answer_No, String answer_Title, String answer_Content) {
		logger.info("Modify Answer");
		
		AnswerDto dto = new AnswerDto();
		dto.setAnswer_No(answer_No);
		dto.setAnswer_Title(answer_Title);
		dto.setAnswer_Content(answer_Content);
		
		int res = a_biz.update(dto);
		
		if(res>0) {
			return "redirect:qna_detail.do?question_No="+question_No;
		} else {
			return "redirect:qna_detail.do?question_No="+question_No;
		}
	}
	
	// 답변 작성시 들어오는 요청
	@RequestMapping( value="/answer_write.do" )
	public String insertAnswer(String answer_Title, String answer_Content) {
		logger.info("Insert Answer");
		
		AnswerDto dto = new AnswerDto();
		dto.setAnswer_Title(answer_Title);
		dto.setAnswer_Content(answer_Content);
		
		int res = a_biz.insert(dto);

		if(res>0) {
			return "redirect:qna_do";
		} else {
			return "redirect:qna_do";
		}
	}

}
