package com.mvc.cb;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
 
@Controller
public class MailController {
 
  @Autowired
  private JavaMailSender mailSender;

  @RequestMapping(value = "/mypage_apply.do")
  public String mailSending(HttpServletRequest request) {
   
    String setfrom = "jusu2529@gmail.com";         

    String tomail  = request.getParameter("tomail");     // 占쌨댐옙 占쏙옙占� 占싱몌옙占쏙옙
    String applicant  = request.getParameter("applicant");     // 占쌨댐옙 占쏙옙占� 占싱몌옙占쏙옙
    String title   = request.getParameter("title");      // 占쏙옙占쏙옙
    String content = request.getParameter("content");    // 占쏙옙占쏙옙
    String content1 = request.getParameter("content1");    // 占쏙옙占쏙옙

   
    System.out.println("content"+content);
    try {
      MimeMessage message = mailSender.createMimeMessage();
      MimeMessageHelper messageHelper 
                        = new MimeMessageHelper(message, true, "UTF-8");
 

      messageHelper.setFrom(setfrom);  
      messageHelper.setTo(tomail);     
      messageHelper.setSubject(title); 
      messageHelper.setText("신청자: "+applicant+"\n"+"경력사항: "+content+"\n"+"자기 소개: "+content1);  // 占쏙옙占쏙옙 占쏙옙占쏙옙



      mailSender.send(message);
    } catch(Exception e){
      System.out.println(e);
    }
   
//    return "redirect:/mypage_apply.do";
    return "mypage_apply";
  }
} 