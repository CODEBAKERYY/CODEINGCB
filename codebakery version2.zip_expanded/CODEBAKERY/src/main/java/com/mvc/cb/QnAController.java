package com.mvc.cb;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mvc.cb.biz.AnswerBiz;
import com.mvc.cb.biz.QCommentBiz;
import com.mvc.cb.biz.QuestionBiz;
import com.mvc.cb.model.dto.AnswerDto;
import com.mvc.cb.model.dto.PageMaker;
import com.mvc.cb.model.dto.QnACommentDto;
import com.mvc.cb.model.dto.QnAPagingDto;
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
	@RequestMapping("/qna.do")
	public String QnAList(Model model,Integer question_No ,
						 @RequestParam(value="page",required = false) Integer page) {
		
		logger.info("QnAList");
		
		//페이지가 넘어오지 않았을 경우 1페이지로 설정
		if( page == null ) {
			page = 1;
		}
		
		int total = q_biz.countBoard();
		
		QnAPagingDto paging = new QnAPagingDto();
		paging.setPage(page);
		paging.setTotalArticle(total);
		paging.setTotalPage(total);
		paging.setStartRow();
		paging.setEndRow();
		
		// 한 페이지에 출력 될  질문 게시글 리스트
		List<QuestionDto> qList = q_biz.selectList(paging); 

		// 한 페이지에 출력될 질문 게시글(qList)에 맞춰서 답변 수를 가져온다.
		List<Integer> cntList = a_biz.getCntAnswer(qList); 
		
		PageMaker maker = new PageMaker();
		maker.setPaging(paging);
		
		model.addAttribute("list", qList);
		model.addAttribute("cntList",cntList);
		model.addAttribute("pageMaker",maker);
		
		return "qna";
	}
	
	//태그를 눌렀을때 보여지는 리스트
	@RequestMapping( value="/tagList.do" )
	public String tagList(Model model, String question_Tag,
							@RequestParam(value="page",required = false) Integer page) {
		logger.info("tagList");
		
		//페이지가 넘어오지 않았을 경우 1페이지로 설정
		if( page == null ) {
			page = 1;
		}
		
		List<QuestionDto> list = q_biz.selectTagList(question_Tag);
		
		QnAPagingDto paging = new QnAPagingDto();
		paging.setPage(page);
		paging.setTotalArticle(list.size());
		paging.setTotalPage(list.size());
		paging.setStartRow();
		paging.setEndRow();
		
		// 한 페이지에 출력될 질문 게시글(qList)에 맞춰서 답변 수를 가져온다.
		List<Integer> cntList = a_biz.getCntAnswer(list);
		
		
		PageMaker maker = new PageMaker();
		maker.setPaging(paging);
		
		model.addAttribute("pageMaker",maker);
		model.addAttribute("cntList",cntList);
		model.addAttribute("list", list);
		
		return "qna";
	}
	

	// 질문제목을 클릭했을때 들어오는 요청
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
	
	
	// ------------------------ 질문글 작성/수정/삭제 START-------------------------
	
	// 글쓰기 버튼을 눌렀을때 들어오는 요청
	@RequestMapping( value = "/qna_write.do" )
	public String QnAWrite() {
		logger.info("QnAWrite");
		return "qna_write";
	}
	
	// 글쓰기 성공후 페이지 이동
	@RequestMapping( value = "/insert_question.do" )
	public String insertQnA(QuestionDto dto) {
		logger.info("insert_Question");
		
		int res = q_biz.insert(dto);
		
		if(res>0) {
			return  "redirect:qna.do";
		} else {
			return "redirect:qna_write.do";
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
	public String updateQnA(Model model, QuestionDto dto) {
		logger.info("update_Question");
		int res = q_biz.update(dto);
		
		
		if(res>0) {
			return "redirect:qna_detail.do?question_No="+dto.getQuestion_No();
		} else {
			return "redirect:qna_update.do?question_No="+dto.getQuestion_No();
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
	// ------------------------ 질문글 수정/삭제 END-------------------------
	

	// ------------------------ 답변 직성/수정/삭제 START-------------------------
	
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
		
		//답변수정 -> 팝업창으로 넘김
		@RequestMapping( value="/answer_modify.do" )
		public String modifyAnswer(Model model, AnswerDto dto) {
			logger.info("Modify Answer");
			
			model.addAttribute("ans", dto);
			
			return "modifyAnswer";
			}
		
		//팝업창에서 답변 변경후 넘김
		@RequestMapping( value="/changeAnswer.do" )
		public String changeAnswer(AnswerDto dto){
			logger.info("changeAnswer");
			
			
			int res = a_biz.update(dto);
			System.out.println(dto.getAnswer_Content());
			
			
			return "redirect:qna_detail.do?question_No="+dto.getQuestion_No();
		}
		
		// 답변 작성시 들어오는 요청
		@RequestMapping( value="/answer_write.do", method=RequestMethod.POST )
		@ResponseBody
		public String insertAnswer(AnswerDto dto) {
			logger.info("Insert Answer");
			
			int res = a_biz.insert(dto);
			
			if(res>0) {
				return "location.reload()";
			} else {
				return "redirect:qna_detail.do?question_No="+dto.getQuestion_No();
			}
		}
		
	// ------------------------ 답변 등록/수정/삭제 END -------------------------
	
	// ------------------------ 댓글 등록/수정/삭제 START-------------------------
		
		
		// 질문글에 댓글 작성
		@RequestMapping( value = "/writeComment.do")
		public String insertComment(QnACommentDto dto) {
		
			logger.info("insertComment");
			
			int res = c_biz.insert(dto);
			
			if(res>0) {
				return "redirect:qna_detail.do?question_No="+dto.getQuestion_No();
			} else {
				return "redirect:qna_detail.do?question_No="+dto.getQuestion_No();
			}
			
		}
		
		// 댓글 삭제
		@RequestMapping( value = "/qcomment_delete.do", method=RequestMethod.POST )
		@ResponseBody
		public String deleteComment(QnACommentDto dto){
			
			logger.info("delete qcomment");
			
			int res = c_biz.delete(dto.getComment_No());
			
			if(res>0) {
				return "location.reload()";
			} else {
				return "location.reload()";
			}
		}
		

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
		
		// 대댓글 등록
		@RequestMapping( value="/writeReply.do" )
		public String insertReply(QnACommentDto dto) {
			
			logger.info("insertBody");
			
			int res = c_biz.insertReply(dto);
			
			
			return "redirect:qna_detail.do?question_No="+dto.getQuestion_No();
		}
		
		
		
	// ------------------------ 답변 등록/수정/삭제 END -------------------------
		
		

}
