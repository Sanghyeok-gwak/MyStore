package com.gd.mystore.service;

import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

@Service
public class EmailService {

    @Autowired
    private JavaMailSenderImpl mailSender;
    private int authNumber; 

   public void makeRandomNumber() {
	   // 난수의 범위 111111 ~ 999999 (6자리 난수)
	   // 영문자 필요한 경우 아스키코드 활용
	   Random r = new Random();
	   int checkNum = r.nextInt(888888) + 111111;
	   System.out.println("인증번호 : " + checkNum);
	   authNumber = checkNum;
   }
   
   public String joinEmail(String email) {
		makeRandomNumber();
		String setFrom = "semi_mvp@naver.com";
		String toMail = email;
		String title = "[MY STORE]변경된 비밀번호 입니다."; // 이메일 제목 
		String content = 
				"<h1>MY STORE</h1>" + 	//html 형식으로 작성 
               "<br><br>" + 
			    "변경된 비밀번호는 '" + authNumber + "' 입니다." + 
			    "<br>" + 
			    "마이페이지에서 수정 해주세요." +
			    "<br>" +
			    "<br>" +
			    "<img src=\"https://i.ibb.co/2659g1K/employee2-jpg.png\" class=\"head_img\">"; //홈페이지 로고?
		mailSend(setFrom, toMail, title, content);
		return Integer.toString(authNumber);
	}
   
   public void mailSend(String setFrom, String toMail, String title, String content) { 
		MimeMessage message = mailSender.createMimeMessage();
		// true 매개값을 전달하면 multipart 형식의 메세지 전달이 가능.문자 인코딩 설정도 가능하다.
		try {
			MimeMessageHelper helper = new MimeMessageHelper(message,true,"utf-8");
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			// true 전달 > html 형식으로 전송 , 작성하지 않으면 단순 텍스트로 전달.
			helper.setText(content,true);
			mailSender.send(message);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}
   
}
