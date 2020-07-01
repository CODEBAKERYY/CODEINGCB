package com.mvc.cb;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mvc.cb.biz.MentorBiz;
import com.mvc.cb.biz.MentorReviewBiz;
import com.mvc.cb.model.dto.MentorDto;
import com.mvc.cb.model.dto.MentorReviewDto;
import com.mvc.cb.model.dto.UserDto;

@Controller
public class ChatController {

	private static final Logger logger = LoggerFactory.getLogger(UserController.class);

	@Autowired
	private MentorBiz m_biz;
	
	@Autowired
	private MentorReviewBiz mr_biz;

	@RequestMapping(value = "/chat.do")
	public String chat(int mentor_No, Model model) {
		model.addAttribute("mentor_No", mentor_No);
		return "chat";
	}

	@RequestMapping("/review.do")
	public String review(int mentor_No, Model model) {
		model.addAttribute("mentor_No", mentor_No);
		return "review";
	}

	@RequestMapping("/reviewinsert.do")
	public String insertReview(int mentor_No, HttpServletRequest request,HttpSession session) {
		System.out.println("리뷰 인서트 들어왔다.");
		System.out.println(mentor_No);
		session = request.getSession(false);
		UserDto user = (UserDto) session.getAttribute("User"); 
		String review = request.getParameter("review_Content");
		MentorReviewDto rdto = new MentorReviewDto();
		rdto.setReview_Content(review);
		rdto.setMentor_No(mentor_No);
		rdto.setUser_Id(user.getUser_Id());
		int res  = mr_biz.insert(rdto);
		return "redirect:main.do";
	}
}