package com.mvc.cb;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
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

import com.mvc.cb.biz.MentorBiz;
import com.mvc.cb.biz.MentorReviewBiz;
import com.mvc.cb.biz.MyPageBiz;
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
	
	@Autowired
	private MyPageBiz mp_biz;

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
	
	@RequestMapping(value = "payPoint.do", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Integer> payPoint(@RequestBody MentorDto mentor, HttpSession session) {
		logger.info("PAYPOINT.");
		System.out.println(mentor);
		int mentor_No = mentor.getMentor_No();
		int user_Point = mentor.getUser_Point();
		
		// 넘겨받은 멘토 정보
		m_biz.selectOne(mentor_No).getUser_Id();
		m_biz.selectOne(mentor_No).getUser_Point();
		
		UserDto udto = new UserDto();
		udto.setUser_Id(m_biz.selectOne(mentor_No).getUser_Id());
		udto.setUser_Point(m_biz.selectOne(mentor_No).getUser_Point() + user_Point);
		
		int mres = mp_biz.updatePoint(udto);
		
		UserDto user = ((UserDto)session.getAttribute("User"));
		System.out.println(user);
		
		user.setUser_Point(user.getUser_Point() - user_Point);
		
		int ures = mp_biz.updatePoint(user);
		
		if(mres > 0 && ures > 0) {
			logger.info("성공");
		}
		else {
			logger.info("실패");
		}
		
		Map<String, Integer> pointmap = new HashMap<String, Integer>();

		return pointmap;
	}

	@RequestMapping(value = "/reviewinsert.do")
	public String insertReview(MentorReviewDto dto, HttpServletRequest request, HttpSession session) {
		System.out.println("리뷰 인서트 들어왔다.");
		System.out.println(dto.getMentor_No());
		System.out.println(dto.toString());
		session = request.getSession(false);
		UserDto user = (UserDto) session.getAttribute("User");
		dto.setUser_Id(user.getUser_Id());
		System.out.println(dto.toString());
		int res = mr_biz.insert(dto);
		System.out.println(res);
		if (res > 0) {
			return "redirect:main.do";
		} else {
			return "redirect:review.do";
		}
	}
}