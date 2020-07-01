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
		model.addAttribute("resultList", quizResultBiz.selectList());
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

/*	@RequestMapping(value = "/quiz_Answer.do")
	public String quizAnswer(String quiz_answer, String quiz_type, int quiz_No, String user_Id, HttpServletRequest request, HttpServletResponse response) {
		//quiz_No로 해당 문제 정보가져오기
		QuizDto quizDto = quizBiz.selectOne(quiz_No);
		//문제의 정답
		String answer = quizDto.getOutput_Sample();
		
		int correctUser = 0;
		int tryUser = 0;
		double correctRate = 0;
		
		if (quiz_type.equals("java")) {
			try {
				String path = WebUtils.getRealPath(request.getSession().getServletContext(), "/test");
				
				File storage = new File(path);
				if (!storage.exists()) { // 경로 존재 여부
					storage.mkdirs(); // 디렉토리 생성
				}
				
				File newfile = new File(path + "/test.java");
				if (!newfile.exists()) {
					newfile.createNewFile();
				}

				OutputStream output = new FileOutputStream(newfile);
//				File file = new File(path+"/test.java");
//				OutputStream output = new FileOutputStream(file);

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
				
				System.out.println("문제 답 : " + answer);
				
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
				if(answer.equals(answerResult)) { //컴파일 성공시
					System.out.println("컴파일 성공 : " + answerResult);
					
					//quizResultDto에 값을 넣은 후 insert하여 테이블에 추가하기(성공일 때)
					QuizResultDto quizResultDto = new QuizResultDto(quiz_No, quiz_answer, answer, answerResult, "성공", user_Id);
					int res = quizResultBiz.insert(quizResultDto);
					
					if(res>0) {
						System.out.println("성공입니다.");
						
						//제출, 정답자, 정답률 업데이트
						tryUser = quizDto.getTry_User()+1;
						correctUser = quizDto.getCorrect_User()+1;
						//소수 3자리까지 보여줌
						correctRate = Math.round(((correctUser/tryUser)*1000)/1000);
						
						//QuizDto에 넣어주고 DB에 업데이트
						quizDto.setTry_User(tryUser);
						quizDto.setCorrect_User(correctUser);
						quizDto.setCorrect_Rate(correctRate);
=======
=======
>>>>>>> parent of 0eb6467... 가즈아아아아아아아
=======
>>>>>>> parent of 0eb6467... 가즈아아아아아아아
				if(answerResult != null) {
					if(answer.equals(answerResult)) { //컴파일 성공시
						System.out.println("컴파일 성공 : " + answerResult);
						
						//quizResultDto에 값을 넣은 후 insert하여 테이블에 추가하기(성공일 때)
						QuizResultDto quizResultDto = new QuizResultDto(quiz_No, quiz_answer, answer, answerResult, "성공", user_Id);
						int res = quizResultBiz.insert(quizResultDto);
						
						if(res>0) {
							System.out.println("성공입니다.");
							
							//제출, 정답자, 정답률 업데이트
							tryUser = quizDto.getTry_User()+1;
							correctUser = quizDto.getCorrect_User()+1;
							//소수 3자리까지 보여줌
							correctRate = Math.round(((correctUser/tryUser)*1000)/1000);
							
							//QuizDto에 넣어주고 DB에 업데이트
							quizDto.setTry_User(tryUser);
							quizDto.setCorrect_User(correctUser);
							quizDto.setCorrect_Rate(correctRate);
							
							res = quizBiz.update(quizDto);
							
							if(res >0) {
								System.out.println("Quiz correct_User, try_User, correct_Rate 수정 완료");
							}else {
								System.out.println("Quiz correct_User, try_User, correct_Rate 수정 실패");
							}
						}else {
							System.out.println("성공.quizResultInsert 에러");
						}
					}else {	//컴파일 실패시(리턴값이 다를때)
						System.out.println("컴파일 실패(리턴값이 다름) : " + answerResult);
>>>>>>> parent of 0eb6467... 가즈아아아아아아아
						
						res = quizBiz.update(quizDto);
						
<<<<<<< HEAD
						if(res >0) {
							System.out.println("Quiz correct_User, try_User, correct_Rate 수정 완료");
=======
						if(res>0) {
							System.out.println("실패입니다.");
							
							//제출, 정답률 업데이트
							tryUser = quizDto.getTry_User()+1;
							//소수 3자리까지 보여줌
							correctRate = Math.round(((correctUser/tryUser)*1000)/1000);
							
							//QuizDto에 넣어주고 db에 업데이트
							quizDto.setTry_User(tryUser);
							quizDto.setCorrect_Rate(correctRate);
							
							
							res = quizBiz.update(quizDto);
							
							if(res >0) {
								System.out.println("Quiz try_User, correct_Rate 수정 완료");
							}else {
								System.out.println("Quiz try_User, correct_Rate 수정 실패");
							}
>>>>>>> parent of 0eb6467... 가즈아아아아아아아
						}else {
							System.out.println("Quiz correct_User, try_User, correct_Rate 수정 실패");
						}
					}else {
						System.out.println("성공.quizResultInsert 에러");
					}
					
				}else {	//컴파일 실패시
					System.out.println("컴파일 실패 : " + errorOutput);
					
					//quizResultDto에 값을 넣은 후 insert하여 테이블에 추가하기(실패일 때)
					QuizResultDto quizResultDto = new QuizResultDto(quiz_No, quiz_answer, answer, errorOutput, "실패", user_Id);
					int res = quizResultBiz.insert(quizResultDto);
					
					if(res>0) {
						System.out.println("실패입니다.");
						
						//제출, 정답자, 정답률 업데이트
						tryUser = quizDto.getTry_User()+1;
						correctUser = quizDto.getCorrect_User();
						//소수 3자리까지 보여줌
						correctRate = Math.round(((correctUser/tryUser)*1000)/1000);
						
						//QuizDto에 넣어주고 db에 업데이트
						quizDto.setTry_User(tryUser);
						quizDto.setCorrect_User(correctUser);
						quizDto.setCorrect_Rate(correctRate);
						
						res = quizBiz.update(quizDto);
						
						if(res >0) {
							System.out.println("Quiz try_User, correct_Rate 수정 완료");
						}else {
							System.out.println("Quiz try_User, correct_Rate 수정 실패");
						}
					}else {
						System.out.println("실패.quizResultInsert 에러");
					}
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else {
			System.out.println("실패");
			System.out.println("자바가 아님");
		}
		return "redirect:quiz.do";
	}*/
}