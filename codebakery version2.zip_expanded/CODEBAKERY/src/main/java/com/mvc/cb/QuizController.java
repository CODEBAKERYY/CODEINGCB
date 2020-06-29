package com.mvc.cb;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
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
import com.mvc.cb.biz.QuizResultBiz;
import com.mvc.cb.model.dto.QuizDto;
import com.mvc.cb.model.dto.QuizResultDto;
import com.mvc.cb.model.dto.TryQuizDto;

@Controller
public class QuizController {

	@Autowired
	private QuizBiz quizBiz;

	@Autowired
	private QuizResultBiz quizResultBiz;

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
	public String quizAnswer(QuizResultDto quizResultDto, String quiz_answer, String quiz_type, int quiz_No, String user_Id, HttpServletRequest request, HttpServletResponse response) {
		//quiz_No로 해당 문제 정보가져오기
		QuizDto quizDto = quizBiz.selectOne(quiz_No);
		//문제의 정답
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
				
				//컴파일 출력값을 toString으로 변환하여 answer와 비교한다.
				String answerResult = IOUtils.toString(process.getInputStream(), "UTF-8");
				answerResult = answerResult.trim(); //앞뒤 공백제거
				String errorOutput = IOUtils.toString(process.getErrorStream());
				
				int res = quizResultBiz.insert(quizResultDto);
				
				System.out.println("문제 답 : " + answer);
				
				if(answer.equals(answerResult)) {
					System.out.println("컴파일 성공 : " + answerResult);
					
				}else {
					System.out.println("컴파일 실패 : " + errorOutput);
				}
				
			} catch (FileNotFoundException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
		}else {
			System.out.println("실패");
			System.out.println("자바가 아님");
		}
		return "redirect:quiz.do";
	}
}