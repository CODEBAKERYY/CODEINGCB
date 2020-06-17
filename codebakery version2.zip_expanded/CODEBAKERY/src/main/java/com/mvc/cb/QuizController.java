package com.mvc.cb;
	
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mvc.cb.biz.QuizBiz;
import com.mvc.cb.model.dto.QuizDto;

@Controller
public class QuizController {
	
	@Autowired 
	private QuizBiz quizBiz;
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@RequestMapping(value= "/quiz.do")
	public String quizList(Model model) {
		logger.info("QUIZ SELECT LIST");
//		model.addAttribute("quizList", quizBiz.selectList());
		
		return "quiz";
	}

	@RequestMapping(value="/quiz_write.do")
	public String QuizWrite() {
		return "quiz_write";
	}
	
	@RequestMapping(value="/insertQuiz.do")
	public String insertQuiz(QuizDto dto) {
		logger.info("INSERT QUIZ");
		int res = quizBiz.insert(dto);
		
		if(res>0) {
			return "redirect:quiz.do";
		}else {
			return "redirect:quiz_write.do";
		}
	}
}