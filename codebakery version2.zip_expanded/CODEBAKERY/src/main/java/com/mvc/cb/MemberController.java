package com.mvc.cb;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mvc.cb.biz.MemberBiz;
import com.mvc.cb.model.dao.MemberDao;
import com.mvc.cb.model.dto.MemberDto;

@Controller
public class MemberController {
   private Logger logger = LoggerFactory.getLogger(MemberController.class);
   
   @Autowired
   private MemberBiz biz;
   
   @Autowired
   private MemberDao dao;
   
   public String loginForm() {
      return "";
   }
   
   @RequestMapping("/login.do")
   public String loginform() {
      logger.info("LOGIN PAGE");
      return "login";
   }
   
   //로그인은 seesion필요                           post형식으로 전달하니까 여기도  post
   @RequestMapping(value="/ajaxlogin.do", method=RequestMethod.POST)
   @ResponseBody
   public Map<String,Boolean> ajaxLogin(HttpSession session, @RequestBody MemberDto dto){
      logger.info("LOGIN");
      System.out.println("dto: " + dto);

      MemberDto res = biz.login(dto);
      boolean check = false;
      if(res != null) {
         session.setAttribute("login", res);
         check=true;
      }
      
      System.out.println("res: " + res); //확인된 개인정보 가져옴 확인
      
      //map생성??
      Map<String,Boolean> map = new HashMap<String,Boolean>();
      map.put("check", check);
      
      return map;
   }
   @RequestMapping("/modify.do")
   public String memberUpdate(MemberDto dto,HttpSession session,  HttpServletResponse response) throws IOException {
      System.out.println("user_id : " + dto.getUser_id());
      System.out.println("비번"+dto.getUser_pw());
      System.out.println("비번확인"+dto.getUser_pwchk());
      
      
      
      if((dto.getUser_pw()==null && dto.getUser_pw() ==null )|| (dto.getUser_pwchk()==""  && dto.getUser_pwchk()=="") ) {
         biz.update_nonpw(dto);
         
         System.out.println("비번은 수정 안함");
         
         session.removeAttribute("login");
         MemberDto res = biz.getInfo(dto);
         MemberDto reres = biz.login(res);
         session.setAttribute("login", res);
         

         boolean check = false;
         if(reres != null) {
            session.setAttribute("login", res);
            check=true;
         }
         
         
         
         System.out.println("뜨나?"+session.getAttribute("user_pw"));
         response.setContentType("text/html; charset=UTF-8");
         PrintWriter out = response.getWriter();
         out.println("<script>alert('정보가 수정 되었습니다'); location.href='mypage.do'; </script>");
         //중간에 거쳐오는 곳을 만들면? 
         out.flush();


         
         return "mypage";
      
      }else if(dto.getUser_pw().equals(dto.getUser_pwchk())) {
         
         biz.updateMember(dto);
         session.removeAttribute("login");
         MemberDto res = biz.login(dto);
         session.setAttribute("login", res);
         
         return "mypage";
         
      }else if(dto.getUser_pw()!= dto.getUser_pwchk()) {
         System.out.println("비번 불일치!!!!");
         
         return "mypage";
      }
      
      return "mypage";
      
      
   }
      
   

   
   
   @RequestMapping("/mypage.do")
   public String mypage() {
      logger.info("MY PAGE");
      return "mypage";
   }
   //탈퇴
   @RequestMapping("/deactivate.do")
   public String deactivate(String pw_deact) {
      logger.info("START DEACTIVATE");
      
      
      
      
      
      return "login"; //메인페이지 이름으로 넣어주기!!!********************
   }
   
   @RequestMapping("/mypageloading.do")
   public String mypageloading() {
      logger.info("MY PAGELOADING");
      return "mypageloading";
   }
   
   
//   @RequestMapping(value="/a.do", method = RequestMethod.POST)
//   public Map<String, Boolean> test(@RequestBody MemberDto dto){
//      System.out.println("a.do!!");
//      Map<String,Boolean> map = new HashMap<String,Boolean>();
//      map.put("check",true);
//      return map;
//   }
//   탈퇴 팝업 맵핑
   @RequestMapping("deactivatepopup.do")
   public String deactivatePopup() {
      return "deactivate";
   }
   
   @RequestMapping("pwcheckpopup.do")
   public String pwcheckPopup() {
      return "pwcheck";
   }
   
   
   
}