package com.mvc.cb;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mvc.cb.biz.AnswerBiz;
import com.mvc.cb.biz.QCommentBiz;
import com.mvc.cb.biz.QuestionBiz;

@Controller
public class QnAController {
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Autowired
	private QuestionBiz q_biz;
	
	@Autowired
	private AnswerBiz a_biz;
	
	@Autowired
	private QCommentBiz c_biz;
	
	
	// 헤더에 '질문응답'을 누르면 들어오는 요청
	@RequestMapping(value = "/qna.do")
	public String QnAList(Model model) {
		logger.info("QnAList");
		model.addAttribute("list", q_biz.selectList());
		return "qna";
	}
	
	// 제목을 클릭했을때 들어오는 요청
	@RequestMapping( value = "/qna_detail.do")
	public String QnADetail(Model model, Integer question_No) {
		logger.info("QnaDetail");
		model.addAttribute("qlist", q_biz.selectOne(question_No));
		model.addAttribute("alist", a_biz.selectList(question_No));
		model.addAttribute("clist", c_biz.selectList(question_No));
		return "qna_detail";
	}

}
