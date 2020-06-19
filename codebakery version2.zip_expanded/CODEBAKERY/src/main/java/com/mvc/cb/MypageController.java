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
	public String QnABoard() {
		return "mypage_modify";
	}
	
	@RequestMapping("/modify.do")
	public String memberUpdate(UserDto dto, HttpSession session,HttpServletResponse response) {
		System.out.println("user_id 여기까지= " +dto.getUser_Id());
		System.out.println("user_name = " +dto.getUser_Name());
		System.out.println("user_phone = " +dto.getUser_Phone());
		System.out.println("user_mail = " +dto.getUser_Mail());
		
		
		if(dto.getUser_Pw() == null || dto.getUser_Pw() == "") {
			biz.update_nonpw(dto);
			session.removeAttribute("User");
			UserDto res = biz.getInfo(dto);
			System.out.println("getInfo "+res);
			UserDto reres = u_biz.login(res);
			
			if(reres!=null) {
				session.setAttribute("User", res);
			}else {
				System.out.println("수정 실패!!");
			}			
			
			return "mypage_modify";
		}else {
			
			biz.updateMember(dto);
			session.removeAttribute("User");
			UserDto res = u_biz.login(dto);
			session.setAttribute("User", res);
			
			return "mypage_modify";
			
		}		
	}
	
	
	

}
