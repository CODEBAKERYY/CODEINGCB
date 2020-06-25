package com.mvc.cb;

import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	
	//관리자 회원관리 페이지 이동
	@RequestMapping("admin.do")
	public String Admin(Model model) {
		List<UserDto> userlist = biz.userList();
		model.addAttribute("userlist",userlist);
		return "admin_mypage";
	}
	
	

	@RequestMapping("mypoint.do")
	public String myPoint() {
		return "mypage_point";
	}

	@RequestMapping("apply.do")
	public String applyMentor() {
		return "mypage_apply";
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
