package com.mvc.cb;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.util.WebUtils;

import com.mvc.cb.biz.AnswerBiz;
import com.mvc.cb.biz.MentorBiz;
import com.mvc.cb.biz.MentorReviewBiz;
import com.mvc.cb.biz.QCommentBiz;
import com.mvc.cb.biz.QuestionBiz;
import com.mvc.cb.biz.QuizBiz;
import com.mvc.cb.biz.UserBiz;
import com.mvc.cb.model.dto.UserDto;

@Controller
public class UserController {

	private static final Logger logger = LoggerFactory.getLogger(UserController.class);

	@Autowired
	private UserBiz u_biz;

	@Autowired
	private MentorBiz m_biz;

	@Autowired
	private MentorReviewBiz mr_biz;

	@Autowired
	private QuestionBiz q_biz;

	@Autowired
	private QuizBiz qu_biz;

	@Autowired
	AnswerBiz an_biz;

	// 메인으로 이동시 해당 정보
	@RequestMapping(value = "/main.do")
	public String main(Model model) {
		logger.info("멘토 다 들고나온다");
		model.addAttribute("mentor", m_biz.selectList());
		System.out.println(m_biz.selectList());
		model.addAttribute("question", q_biz.count());
		model.addAttribute("quiz", qu_biz.count());
		model.addAttribute("answer", an_biz.count());
		return "main";
	}

//	// selectOne
//	@RequestMapping(value = "/mentor_review.do")
//	public String mentorReviewOne(Model model, int mentor_No) {
//
//		logger.info("mentor reviewList selectOne");
//		System.out.println("mentor_No : " + mentor_No);
//		System.out.println(mr_biz.review(mentor_No));
//
//		return "main";
//	}

	// 회원가입
	@RequestMapping(value = "/sign.do")
	public String signup() {
		return "signup";
	}

	// 회원가입 폼 이동
	@RequestMapping("/signup.do")
	public String insertRes(UserDto dto, MultipartFile pic, HttpServletRequest request, HttpServletResponse response) {
		logger.info("signup");
		System.out.println(dto);
		String originalFile = pic.getOriginalFilename();
//		String uploadPath = request.getSession().getServletContext().getRealPath("./upload"); // 업로드 경로

		InputStream inputStream = null;
		OutputStream outputStream = null;

		try {
			inputStream = pic.getInputStream();
			String path = WebUtils.getRealPath(request.getSession().getServletContext(), "/upload");
			System.out.println("업로드 될 실제 경로 : " + path);

			File storage = new File(path);
			if (!storage.exists()) { // 경로 존재 여부
				storage.mkdirs(); // 디렉토리 생성
			}
			File newfile = new File(path + "/" + originalFile);
			if (!newfile.exists()) {
				newfile.createNewFile();
			}

			outputStream = new FileOutputStream(newfile);

			int read = 0;
			byte[] b = new byte[(int) pic.getSize()];

			//
			while ((read = inputStream.read(b)) != -1) {
				outputStream.write(b, 0, read);
			}
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				inputStream.close();
				outputStream.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		String user_Pic = "/" + originalFile;
		dto.setUser_Pic(user_Pic);
		int res = u_biz.signup(dto);

		if (res > 0) {
			return "redirect:main.do";
		} else {
			return "redirect:signup.do";
		}
	}

	// 로그인 폼 이동
	@RequestMapping("login.do")
	public String login() {
		logger.info("login");
		return "login";
	}

	// 로그인 확인
	@RequestMapping("loginchk.do")
	public String loginchk(HttpSession session, UserDto dto) {
		logger.info("LOGIN chk");
		UserDto res = u_biz.login(dto);
		if (res != null) {
			session.setAttribute("User", res);
		} else {
			return "redirect:login.do";
		}
		return "redirect:main.do";
	}

	// 로그아웃
	@RequestMapping("logout.do")
	public String loginOut(HttpSession session) {
		logger.info("LOGOUT");
		session.removeAttribute("User");
		return "redirect:main.do";
	}

	// 아이디 체크
	@RequestMapping(value = "idcheck.do", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Boolean> idchk(@RequestBody UserDto dto) {

		System.out.println("ajax넘어왔다");
		System.out.println(dto.getUser_Id());

		logger.info("ID CHECK");
		String user_Id = dto.getUser_Id();
		System.out.println(user_Id);
		UserDto res = null;
		res = u_biz.idcheck(user_Id);
		System.out.println(res);
		Boolean check = true;
		if(res==null) {
			check=false;
		}
		System.out.println("ajax: res : " + res);
		Map<String, Boolean> map = new HashMap<String, Boolean>();
		map.put("check", check);
		return map;
	}

}
