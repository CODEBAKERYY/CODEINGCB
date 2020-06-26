package com.mvc.cb;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.PageContext;

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
	public String quiz_submit() {
		return "quiz_submit";
	}

	@RequestMapping(value = "/quiz_Answer.do")
	public String quizAnswer(String quiz_answer, String quiz_type, HttpServletRequest request,
			HttpServletResponse response) {

		if (quiz_type.equals("java")) {

			try {
				String path = WebUtils.getRealPath(request.getSession().getServletContext(), "/test");
				File file = new File(path + "/test.java");
				OutputStream output = new FileOutputStream(file);

				String str = quiz_answer;
				byte[] by = str.getBytes();
				output.write(by);
				output.close();

				File dir = new File(path);
				Runtime runtime = Runtime.getRuntime();
				Process process = runtime.exec("java test.java", null, dir);

				try {
					process.waitFor();
					String output1 = IOUtils.toString(process.getInputStream());
					String errorOutput = IOUtils.toString(process.getErrorStream());

					System.out.println("output1 : " + output1);
					System.out.println("errorOutput : " + errorOutput);
				} catch (InterruptedException e) {
					e.printStackTrace();
				}
				// push push baby
			} catch (FileNotFoundException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		} else {
			System.out.println("실패");
		}
		return "redirect:quiz.do";
	}
}