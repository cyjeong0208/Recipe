package com.solrecipe.recipe.user.email.service;

import java.util.Random;

import javax.mail.Message.RecipientType;
import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public interface MailService {

	
//제목, 내용, 보내는 메일 주소, 받는 메일 주소, 첨부파일경로
	public boolean send(String subject, String text, String from, String to, String filePath);

}
