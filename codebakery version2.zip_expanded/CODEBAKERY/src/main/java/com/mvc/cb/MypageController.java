package com.mvc.cb;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mvc.cb.biz.MyPageBiz;
import com.mvc.cb.biz.UserBiz;
import com.mvc.cb.model.dto.UserDto;

@Controller
public class MypageController {

	private static final Logger logger = LoggerFactory.getLogger(UserController.class);

	@Autowired
	private UserBiz u_biz;

	@Autowired
	private MyPageBiz biz;

	@RequestMapping(value = "/mypage_modify.do")
	public String mypage_modify() {
		return "mypage_modify";
	}

	@RequestMapping("admin.do")
	public String Admin() {
		return "admin_mypage";
	}

	@RequestMapping("/modify.do")
	public String memberUpdate(UserDto dto, HttpSession session, HttpServletResponse response) {
		System.out.println("user_id = " + dto.getUser_Id());
		System.out.println("user_name = " + dto.getUser_Name());
		System.out.println("user_phone = " + dto.getUser_Phone());
		System.out.println("user_mail = " + dto.getUser_Mail());

		biz.update_nonpw(dto);
		session.removeAttribute("login");
		UserDto res = biz.getInfo(dto);
		UserDto reres = u_biz.login(res);

		if (reres != null) {
			session.setAttribute("login", res);
		} else {
			System.out.println("수정 실패!!");
		}

		return "mypage_modify";
	}

}
