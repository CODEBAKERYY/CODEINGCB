package com.mvc.cb;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	@RequestMapping("/admin.do")
	public String Admin(Model model) {
		List<UserDto> userlist = biz.userList();
		model.addAttribute("userlist",userlist);
		return "admin_mypage";
	}
	
	//관리자 등급조정 페이지 띄움
	@RequestMapping("/adjust_rating.do")
	public String adjust() {
		logger.info("adjust_rating");
		return "adjust_rating";
	}
	
	//관리자 등급조정 결과
	@RequestMapping("/adjustres.do")
	public String adjustres(UserDto dto) {
		logger.info("adjustres");
		int res = u_biz.adjust(dto);
		System.out.println();
		return "redirect:admin_mypage.do";
	}
	

	@RequestMapping("mypoint.do")
	public String myPoint() {
		return "redirect:mypage_point";
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
	
	@RequestMapping("deactivatepopup.do")
	public String deactivatePopup() {
		return "deactivate";
	}
	
	@RequestMapping("deactivate.do")
	public String deactivate(UserDto dto,HttpSession session, HttpServletResponse response) throws IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
				
		UserDto res = biz.getInfo(dto);
		System.out.println(dto.getUser_Pw()+"/"+res.getUser_Pw());
		
		if( !dto.getUser_Pw().equals( res.getUser_Pw()) ) {
			
			out.println("<script>alert('비밀번호가 일치하지 않습니다.');</script>");
			out.flush();
			return "mypage_modify";
			
		}else if( dto.getUser_Pw().equals( res.getUser_Pw())){
				biz.member_delete(dto);
				System.out.println("탈퇴 진행 마무리 메인으로 이동");
				
				session.removeAttribute("User");
				
				
				out.println("<script>alert('계정이 삭제되었습니다.'); window.close();</script>");
			
		}
		
		out.flush();
		return "main";
		 
	}
	
	
	
	
	
	
	
	
	
	
	
	

	@RequestMapping(value = "/payment.do")
	public String payment() {
		return "mypage_payment";
	}
	

	 //map을 쓰는이유는 json와 비슷(k,v)하기 때문에
	@RequestMapping(value="charge.do",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Boolean> charge(HttpSession session,@RequestBody UserDto dto){
		logger.info("CHARGE gogo");
		
		
		int res = biz.updatePoint(dto);
		
		session.removeAttribute("login");
		UserDto relogin = biz.getInfo(dto);
		session.setAttribute("login", relogin);
		
		System.out.println("뭐라고 받아질까"+res);
		boolean check = false;
		if(res > 0) {		//업데이트이가정상적으로 될때
			
			check = true;
		}
		Map<String,Boolean> map = new HashMap<String,Boolean>();
		map.put("check",check);
		return map;
	}
	
	
	
}
