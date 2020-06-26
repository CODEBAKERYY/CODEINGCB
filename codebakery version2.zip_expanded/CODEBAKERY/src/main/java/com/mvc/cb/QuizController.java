package com.mvc.cb;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.util.WebUtils;

import com.mvc.cb.biz.QuizBiz;
import com.mvc.cb.model.dto.QuizDto;

@Controller
public class QuizController {

	@Autowired
	private QuizBiz quizBiz;

	private static final Logger logger = LoggerFactory.getLogger(UserController.class);

	@RequestMapping(value = "/quiz.do")
	public String quizList(Model model) {
		logger.info("QUIZ SELECT LIST");
		model.addAttribute("list", quizBiz.selectList());

		return "quiz";
	}

	@RequestMapping(value = "/quiz_detail.do")
	public String quizDetail(Model model, int quiz_No) {
		logger.info("quizDetail");

		model.addAttribute("list", quizBiz.selectOne(quiz_No));
		return "quiz_detail";
	}

	@RequestMapping(value = "/quiz_write.do")
	public String QuizWrite() {
		return "quiz_write";
	}

	@RequestMapping(value = "/insertQuiz.do")
	public String insertQuiz(QuizDto dto) {
		logger.info("INSERT QUIZ");
		int res = quizBiz.insert(dto);

		if (res > 0) {
			return "redirect:quiz.do";
		} else {
			return "redirect:quiz_write.do";
		}
	}

	@RequestMapping(value = "/quiz_submit.do")
	public String quiz_submit(Model model, int quiz_No) {
		logger.info("quiz_submit");
		
		model.addAttribute("list", quizBiz.selectOne(quiz_No));
		return "quiz_submit";
	}

	@RequestMapping(value = "/quiz_Answer.do")
	public String quizAnswer(String quiz_answer, String quiz_type, int quiz_No, HttpServletRequest request,	HttpServletResponse response) {
		QuizDto quizDto = quizBiz.selectOne(quiz_No);
		String answer = quizDto.getOutput_Sample();
		
		
		if (quiz_type.equals("java")) {
			try {
				String path = WebUtils.getRealPath(request.getSession().getServletContext(), "/test");
				File file = new File(path+"/test.java");
				OutputStream output = new FileOutputStream(file);

				String str = quiz_answer;
				byte[] by = str.getBytes();
				output.write(by);
				output.close();

				File dir = new File(path);
				Runtime runtime = Runtime.getRuntime();
				Process process = runtime.exec("java test.java", null, dir);
				process.waitFor();
				
				String answerResult = IOUtils.toString(process.getInputStream(), "UTF-8");
				String errorOutput = IOUtils.toString(process.getErrorStream());
				
				System.out.println("answer : " + answer);
				System.out.println("answerResult : "+ answerResult);
				System.out.println("errorOutput : " + errorOutput);

				System.out.println(answerResult.equals("Hello World!!!"));
				System.out.println(answerResult.toString().equals(answer));
				System.out.println(answerResult.toString().equals("Hello World!!!"));
				
				System.out.println(answerResult.hashCode());
				System.out.println(answer.hashCode());
				
				if(answer.equals(answerResult)) {
					System.out.println("컴파일 성공");
				}else {
					System.out.println("컴파일 실패");
				}
			} catch (FileNotFoundException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
		} else {
			System.out.println("실패");
		}
		return "redirect:quiz.do";
	}
}