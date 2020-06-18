package com.mvc.cb;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mvc.cb.biz.MentorBiz;
import com.mvc.cb.biz.MentorReviewBiz;
import com.mvc.cb.biz.UserBiz;
import com.mvc.cb.model.dto.UserDto;

@Controller
public class UserController {

	private static final Logger logger = LoggerFactory.getLogger(UserController.class);

	@Autowired
	private UserBiz u_biz;

	@Autowired
	private MentorBiz m_biz;

	// 메인으로 이동시 해당 정보
	@RequestMapping(value = "/main.do")
	public String main(Model model) {
		logger.info("mentor selectAll");
		model.addAttribute("mentor", m_biz.selectList());
		System.out.println(m_biz.selectList());
		return "main";
	}
	
	// selectOne
	@RequestMapping(value = "/mentor_review.do")
	public String mentorReviewOne(Model model, int mentor_No) {

		logger.info("mentor selectOne");
		model.addAttribute("review", m_biz.selectOne(mentor_No));
		System.out.println(m_biz.selectOne(mentor_No));

		return "main";
	}

	// 회원가입
	@RequestMapping(value = "/sign.do")
	public String signup() {
		return "signup";
	}

	// 회원가입 폼 이동
	@RequestMapping("/signup.do")
	public String insertRes(UserDto dto) {
		logger.info("signup");
		System.out.println(dto);
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
		}
		return "redirect:main.do";
	}
}
