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
 
 
 
  // mailSending �ڵ�
  @RequestMapping(value = "/mypage_apply.do")
  public String mailSending(HttpServletRequest request) {
   
    String setfrom = "jusu2529@gmail.com";         
    String tomail  = request.getParameter("tomail");     // �޴� ��� �̸���
    String applicant  = request.getParameter("applicant");     // �޴� ��� �̸���
    String title   = request.getParameter("title");      // ����
    String content = request.getParameter("content");    // ����
    String content1 = request.getParameter("content1");    // ����
   
    System.out.println("content"+content);
    try {
      MimeMessage message = mailSender.createMimeMessage();
      MimeMessageHelper messageHelper 
                        = new MimeMessageHelper(message, true, "UTF-8");
 
      messageHelper.setFrom(setfrom);  // �����»�� �����ϰų� �ϸ� �����۵��� ����
      messageHelper.setTo(tomail);     // �޴»�� �̸���
      messageHelper.setSubject(title); // ���������� ������ �����ϴ�
      messageHelper.setText("��û��: "+applicant+"\n"+"���� ���: "+content+"\n"+"���� �Ұ�: "+content1);  // ���� ����
//    					 +"\n"+content1 �߰��غ���
      mailSender.send(message);
    } catch(Exception e){
      System.out.println(e);
    }
   
//    return "redirect:/mypage_apply.do";
    return "mypage_apply";
  }
} 
