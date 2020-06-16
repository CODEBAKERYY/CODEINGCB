package com.mvc.cb;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mvc.cb.biz.MentorBiz;
import com.mvc.cb.biz.UserBiz;

@Controller
public class MentorController {

	private static final Logger logger = LoggerFactory.getLogger(UserController.class);

	@Autowired
	private UserBiz u_biz;

	@Autowired
	private MentorBiz m_biz;

	@RequestMapping(value = "/mentor_detail.do")
	public String mentorDetail(Model model) {

		logger.info("mentor selectAll");
		model.addAttribute("mentor", m_biz.selectList());
		System.out.println(m_biz.selectList());
		logger.info("mentorReview selectAll");
//		model.addAttribute("mentorreview", mr_biz.selectList());
		return "mentor_detail";
	}

}
