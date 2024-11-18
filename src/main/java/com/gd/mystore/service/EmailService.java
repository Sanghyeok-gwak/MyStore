package com.gd.mystore.service;

import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class EmailService {

	@Autowired
	private JavaMailSenderImpl mailSender;
	
	public String randomPassword(int length) {
	    String charList = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
	    Random random = new Random();
	    StringBuilder randomString = new StringBuilder();

	    for (int i = 0; i < length; i++) {
	        int randomIndex = random.nextInt(charList.length());
	        randomString.append(charList.charAt(randomIndex));
	    }
	    return randomString.toString();
	}

	public void joinEmail(String email, String authNumber) {
		log.debug("joinEmail 진입");
		String setFrom = "semi_mvp@naver.com";
		String toMail = email;
		String title = "[MY STORE]변경된 비밀번호 입니다."; // 이메일 제목
		String content = "<h1>MY STORE</h1>" + // html 형식으로 작성
				"<br><br>" + "변경된 비밀번호는 '" + authNumber + "' 입니다." + "<br>" + "마이페이지에서 수정 해주세요." + "<br>" + "<br>"
				+ "<img src=\"https://i.ibb.co/2659g1K/employee2-jpg.png\" class=\"head_img\">"; // 홈페이지 로고?
		mailSend(setFrom, toMail, title, content);
	}

	public void mailSend(String setFrom, String toMail, String title, String content) {
		log.debug("mailSend 진입");
		MimeMessage message = mailSender.createMimeMessage();

		try {
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			// true 전달 > html 형식으로 전송 , 작성하지 않으면 단순 텍스트로 전달.
			helper.setText(content, true);
			mailSender.send(message);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}

}
