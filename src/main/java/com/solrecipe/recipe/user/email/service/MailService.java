package com.solrecipe.recipe.user.email.service;


import org.springframework.stereotype.Service;

@Service
public interface MailService {

	
//제목, 내용, 보내는 메일 주소, 받는 메일 주소, 첨부파일경로
	public boolean send(String subject, String text, String from, String to, String filePath);

}
