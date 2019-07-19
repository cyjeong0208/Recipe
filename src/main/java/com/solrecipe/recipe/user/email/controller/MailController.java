package com.solrecipe.recipe.user.email.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;


import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.solrecipe.recipe.user.domain.MemberVO;
import com.solrecipe.recipe.user.email.service.MailService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping(value="/mail")
@Log4j
public class MailController {
	
	private MemberVO membervo;
	@Autowired
	private MailService mailService;
	
	//이메일, 인증번호 저장
	private Map<String, Integer> mail_map = new HashMap<String, Integer>();
	
	
	public void setMailService(MailService mailService) {
		this.mailService = mailService;
	}

	public void setMembervo(MemberVO membervo) {
		this.membervo = membervo;
	}



	//회원가입 이메일 인증 
	@RequestMapping(value="/send", method = RequestMethod.POST, produces = "application/json")
	//@GetMapping("/sendMail")  HttpSession session   @RequestParam String email
	@ResponseBody
	public int sendMail(HttpSession session, @RequestParam String email) {
		
		int ran = new Random().nextInt(100000) + 10000;
		
		log.info("RAN : " + ran);
		log.info("EMAIL : " +email);
		
		String joinCode = String.valueOf(ran);
		session.setAttribute("joinCode", joinCode);
		
		String subject = "[자취방레시피] 회원가입 인증 코드 발급 안내입니다.";
		StringBuilder sb = new StringBuilder();
		sb.append("귀하의 인증 코드는 " + joinCode + " 입니다. ");
		
		mailService.send(subject, sb.toString(), "cyjeong0208@gmail.com", email, null);
		
	
		mail_map.put(email, ran);
		
		return ran;
	}
	
	//회원가입 이메일 인증번호 확인 
		
		
		@RequestMapping(value="/check", method = RequestMethod.POST, produces = "application/json")
		//@GetMapping("/sendMail")  HttpSession session   @RequestParam String email
		@ResponseBody
		public String checkCode(@RequestParam String email, @RequestParam int joinCode, HttpServletResponse response) throws IOException {
			
	
				if(mail_map.containsKey(email)) {
					if(joinCode==mail_map.get(email)) {
						
						return null;
					
					}else {
						
						return null;
					}
				}else {
					
					return null;
				}
				
			

			
		}

	
	
}
