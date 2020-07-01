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
import com.mvc.cb.biz.MyPointBiz;
import com.mvc.cb.biz.UserBiz;
import com.mvc.cb.model.dto.PointDto;
import com.mvc.cb.model.dto.UserDto;

@Controller
public class MypageController {

	private static final Logger logger = LoggerFactory.getLogger(UserController.class);

	@Autowired
	private UserBiz u_biz;

	@Autowired
	private MyPageBiz biz;
	
	@Autowired
	private MyPointBiz p_biz;

	@RequestMapping(value = "/chkPw.do")
	public String chkPw() {

		logger.info("chkPw");

		return "mypage_chkPw";
	}

	@RequestMapping(value = "/mypage_modify.do")
	public String mypage_modify() {
		return "mypage_modify";
	}

	// 관리자 회원관리 페이지 이동
	@RequestMapping("/admin.do")
	public String Admin(Model model) {
		List<UserDto> userlist = biz.userList();
		model.addAttribute("userlist", userlist);
		return "admin_mypage";
	}

	// 관리자 등급조정 페이지 띄움
	@RequestMapping("/adjust_rating.do")
	public String adjust(Model model, String user_Id) {
		logger.info("adjust_rating");
		model.addAttribute("userone", biz.selectOne(user_Id));
		return "adjust_rating";
	}

	// 관리자 등급조정 결과
	@RequestMapping("/adjustres.do")
	@ResponseBody
	public Map<String, Integer> adjustres(@RequestBody UserDto dto) {
		logger.info("adjustres");
		int res = u_biz.adjust(dto);

		Map<String, Integer> adjustres = new HashMap<String, Integer>();
		adjustres.put("adjust", res);

		return adjustres;
	}

//	포인트 내역 페이지로 인해 수정---------------------------------------------------------
	@RequestMapping("/mypoint.do")
	public String pointchk(Model model,String id) {
		logger.info("APPLY PAGE");
		
		System.out.println(id);
		model.addAttribute("list", p_biz.selectAll(id));
		
		return "mypage_point";
	}
//----------------------------------------------------------------------------------	

	@RequestMapping("apply.do")
	public String applyMentor() {
		return "mypage_apply";
	}

	@RequestMapping("/modify.do")
	public String memberUpdate(UserDto dto, HttpSession session) {

		logger.info("memberUpdate");

		int res = biz.updateMember(dto);

		if (res > 0) {
			session.removeAttribute("User");
			session.setAttribute("User", dto);

		} else {
			System.out.println("회원 정보 수정 실패!");
		}

		return "redirect:mypage_modify.do";
	}

	@RequestMapping("deactivatepopup.do")
	public String deactivatePopup() {
		return "mypage_deactivate";
	}

	@RequestMapping("deactivate.do")
	public String deactivate(UserDto dto, HttpSession session, HttpServletResponse response) throws IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();

		UserDto res = biz.getInfo(dto);
		System.out.println(dto.getUser_Pw() + "/" + res.getUser_Pw());

		if (!dto.getUser_Pw().equals(res.getUser_Pw())) {

			out.println("<script>alert('비밀번호가 일치하지 않습니다.');</script>");
			out.flush();
			return "mypage_modify";

		} else if (dto.getUser_Pw().equals(res.getUser_Pw())) {
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

	@RequestMapping(value="charge_middle.do",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Boolean> charge(HttpSession session,@RequestBody UserDto dto){
		logger.info("CHARGE gogo");
		System.out.println("dto"+dto);
		
		String payid = dto.getUser_Id();
		String sessionid = ((UserDto)session.getAttribute("User")).getUser_Id();
		
		System.out.println("결제 아이디 받기: "+payid+""+sessionid);
		
		boolean check = false;
		if( payid.equals(sessionid)) {		//업데이트이가정상적으로 될때
			
			check = true;
		}
		Map<String,Boolean> map = new HashMap<String,Boolean>();
		map.put("check",check);
		return map;
	}
	

	 //map을 쓰는이유는 json와 비슷(k,v)하기 때문에
	@RequestMapping(value="charge.do",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Boolean> charge(HttpSession session,@RequestBody Map<String, Object> param){
		logger.info("CHARGE 업데이트 적용");
		
		String user_Id = (String) param.get("user_Id");
		int user_Point = (Integer)(param.get("user_Point"));
		logger.info("CHARGE 업데이트 적용"+user_Point);
		String point_Charge = (String)param.get("point_Charge");
		String point_Date =  (String)param.get("point_Date");
		
		UserDto dto = new UserDto();
		dto.setUser_Id(user_Id);
		dto.setUser_Point(user_Point);
		
		PointDto pointdto = new PointDto();
		pointdto.setPoint_Charge(point_Charge);
		pointdto.setPoint_Date(point_Date);
		pointdto.setUser_Id(user_Id);
		
		System.out.println("point_Charge:"+point_Charge+""+point_Date);
		logger.info("userid"+point_Charge+""+point_Date);
		
		logger.info("userid"+user_Id+"" +user_Point);
		System.out.println("userid"+user_Id+""+ user_Point);
		
		//포인트 충전 update
		int res = biz.updatePoint(dto);
		System.out.println("pointdto:        "+pointdto);
		//pointdto:        com.mvc.cb.model.dto.PointDto@47bbc232
		//포인트 사용 내역 insert
	    int charge = p_biz.insert(pointdto); 
		
		session.removeAttribute("User");
		UserDto relogin = biz.getInfo(dto);
		UserDto reres = u_biz.login( relogin);

		
		session.setAttribute("User", reres);
		
		System.out.println("뭐라고 받아질까"+reres); //포인트 업데이트 되서 받아진다.
		boolean check = false;
		if((res > 0)&&(charge>0)) {		//업데이트이가정상적으로 될때
			
			check = true;
		}
		Map<String,Boolean> map = new HashMap<String,Boolean>();
		map.put("check",check);
		return map;
	}
	

}
