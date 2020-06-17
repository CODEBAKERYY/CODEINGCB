//package com.mvc.cb;
//
//import java.util.HashMap;
//import java.util.Map;
//
//import javax.servlet.http.HttpSession;
//
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.RequestBody;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.bind.annotation.ResponseBody;
//
//@Controller
//public class MypageController {
//	
//	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
//	
//	@Autowired
//	private MyPageBiz biz;
//	
//	@Autowired
//	private MemberDao dao;
//	
//	public String loginForm() {
//		return "";
//	}
//	
//	@RequestMapping("/login.do")
//	public String loginform() {
//		logger.info("LOGIN PAGE");
//		return "login";
//	}
//	
//	//로그인은 seesion필요									post형식으로 전달하니까 여기도  post
//	@RequestMapping(value="/ajaxlogin.do", method=RequestMethod.POST)
//	@ResponseBody
//	public Map<String,Boolean> ajaxLogin(HttpSession session, @RequestBody MemberDto dto){
//		logger.info("LOGIN");
//		System.out.println("dto: " + dto);
//		/*
//		   json으로 request한 파라미터들을 java에서 받으려면 java오브젝트로 변환이 필요,
//		   response시 java오브젝트를 json으로 변환이 필요
//		   	이를 처리해 주는 어노테이션 @RequestBody: json->자바 object, @ResponseBody: 자바 object->json
//		 */
//		//입력한 아이디 비밀번호 들어가야함.
//		MemberDto res = biz.login(dto);
//		boolean check = false;
//		if(res != null) {
//			session.setAttribute("login", res);
//			check=true;
//		}
//		
//		System.out.println("res: " + res); //확인된 개인정보 가져옴 확인
//		
//		//map생성??
//		Map<String,Boolean> map = new HashMap<String,Boolean>();
//		map.put("check", check);
//		
//		return map;
//	}
//	@RequestMapping("/modify.do")
//	public String memberUpdate(MemberDto dto,HttpSession session) {
//		System.out.println("user_id : " + dto.getUser_id());
//		if(dto.getUser_pw().equals(dto.getUser_pwchk())) {
//			
//			biz.updateMember(dto);
//			session.removeAttribute("login");
//			MemberDto res = biz.login(dto);
//			session.setAttribute("login", res);
//			
//			return "mypage";
//			
//		}else if(dto.getUser_pw() ==null && dto.getUser_pw() =="" &&dto.getUser_pwchk()==null && dto.getUser_pwchk()=="" ) {
//			biz.update_nonpw(dto);
//			
//			return "mypage";
//			
//		}else if(dto.getUser_pw()!= dto.getUser_pwchk()) {
//			
//			
//			return "mypage";
//		}
//		
//		return "mypage";
//		
//		
//	}
//	
////	 ajax update 만들기 
//	@RequestMapping(value="/ajaxupdate.do", method=RequestMethod.POST)
//	@ResponseBody
//	public int ajaxUpdate(HttpSession session, @RequestBody MemberDto dto){
//		logger.info("UPDATE");
//		System.out.println("dto: " + dto);
//		/*
//		   json으로 request한 파라미터들을 java에서 받으려면 java오브젝트로 변환이 필요,
//		   response시 java오브젝트를 json으로 변환이 필요
//		   	이를 처리해 주는 어노테이션 @RequestBody: json->자바 object, @ResponseBody: 자바 object->json
//		 */
//		//입력한 아이디 비밀번호 들어가야함.
//		int res = biz.update_ajax(dto);
//		//(res>0)?true:false;
//		// Boolean is = biz.update_ajax(dto);
//		
//		// Map<String,Boolean> map = new HashMap<String,Boolean>();
//		// map.put("check",is);
//		
//		System.out.println("입력 성공?숫자뜨면 성공: " + res); //확인된 개인정보 가져옴 확인
//		session.invalidate();
//		
//		return res;
//	}
//	
//	
//	@RequestMapping(value="/a.do", method = RequestMethod.POST)
//	public Map<String, Boolean> test(@RequestBody MemberDto dto){
//		System.out.println("a.do!!");
//		Map<String,Boolean> map = new HashMap<String,Boolean>();
//		map.put("check",true);
//		return map;
//	}
////	탈퇴 팝업 맵핑
//	@RequestMapping("deactivatepopup.do")
//	public String deactivatePopup() {
//		return "deactivate";
//	}
//	
//	@RequestMapping("pwcheckpopup.do")
//	public String pwcheckPopup() {
//		return "pwcheck";
//	}
//	@RequestMapping(value = "/mypage_modify.do")
//	public String QnABoard() {
//		return "login";
//	}
//	
//	@Autowired
//	private BoardBiz biz;
//	
//	@RequestMapping("/main.do")
//	public String main() {
//		logger.info("MAIN PAGE");
//		return "main";
//	}
//
//	@RequestMapping("/mypage.do")
//	public String mypage() {
//		logger.info("MY PAGE");
//		return "mypage";
//	}
//
//	@RequestMapping("/apply.do")
//	public String mento_apply() {
//		logger.info("APPLY PAGE");
//		return "mypage_apply";
//	}
//	@RequestMapping("/point.do")
//	public String pointchk() {
//		logger.info("APPLY PAGE");
//		return "mypage_point";
//	}
//	@RequestMapping("/mypage_modify.do")
//	public String modify() {
//		logger.info("mypage_modify");
//		return "mypage_modify";
//	}
//
//
//}
