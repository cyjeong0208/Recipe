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
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.solrecipe.recipe.user.domain.MemberVO;
import com.solrecipe.recipe.user.email.service.MailService;
import com.solrecipe.recipe.user.service.UserService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping(value="/mail")
@Log4j
public class MailController {

	
	@Autowired
	private MailService mailService;

	@Autowired
	UserService userService;
	
	
	//이메일, 인증번호 저장
	private Map<String, Integer> mail_map = new HashMap<String, Integer>();
	
	//이메일,result 저장
	private Map<String, int[]> check_map = new HashMap<String, int[]>();
//	private Map<String, Integer> check_map = new HashMap<String, Integer>();
	
	
	public void setMailService(MailService mailService) {
		this.mailService = mailService;
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
		public String checkCode(MemberVO membervo, @RequestParam String email, @RequestParam int joinCode, HttpServletResponse response, RedirectAttributes rttr) throws IOException {
			
				
				int[] results = {1,0};
				int result = 1;  //이메일  
				int result1 = 0;  // 임시번호 
				check_map.clear();  //map 초기화
				if(mail_map.containsKey(email)) {
					//임시번호가 일치할때 
					if(joinCode==mail_map.get(email)) {
						
						membervo.setUser_username(email);
						//임시비밀번호 
						//membervo.setUser_pw(code);
						System.out.println("joinCode : " + joinCode);
						System.out.println(mail_map.get(email));
						
						System.out.println("USERNAME :" + membervo.getUser_username());
						result = userService.confirmUser(membervo.getUser_username());
						
						//이메일 중복이 아닐때... 
						if(result==0) {
							
							System.out.println("1");
							result1 = userService.insertMail(membervo);
							
							//이메일중복없고, 메일 잘 들어갓을때
							if(result1 == 1) {
								System.out.println("2");
								rttr.addFlashAttribute("mailmsg", "mail_check_success");
								
	
								results[0] = result;  //0
								results[1] = result1; //1
								//check_map.put(email, results);
								//check_map.put(email, result);
//								return "main";
							}
						}
						
						
					
					}
					//ㅇ너런이러댜ㅓㄹㄷ제ㅓ렏저렏저ㅔㄹ대저ㅔㅐ 우네!!!!!!
	
					//임시번호가 일치하지않을때 
					else {
						membervo.setUser_username(email);
						//임시비밀번호 
						//membervo.setUser_pw(code);
						System.out.println("3");
						
						System.out.println("USERNAME :" + membervo.getUser_username());
						result = userService.confirmUser(membervo.getUser_username());
						
						//이메일 중복이 아닐때... 
						if(result==0) {
							results[0] = result; //0
							results[1] = result1;//0
						}
						
					}
				}
//				results[0] = result;
//				results[1] = result1;
				///ㄴ아러ㅣ웨.. 이상하게... 에네럳ㅈ래ㅔㄷ저ㅐㅔ
				//여긴잘도닏ㅇ라ㅓㄷ쟈고댜조ㅔㄹㄴㄷㄹㅇ니
				System.out.println("email : " + results[0]);
				System.out.println("joincode : " + results[1]);
				check_map.put(email, results);
				return null;
				
			
			

			
		}

	
	
		@RequestMapping(value="/move", method = RequestMethod.GET, produces = "application/json")
		@ResponseBody
		public Map<String, int[]> moveSignup(@RequestBody(required = false) String user_username) throws Exception {
			
	
//				if(check_map.containsKey(user_username)) {
//					if(check_map.get(user_username)==1) {
//					//result (DB에 저장이 되었는지 아닌지 check) 
//					System.out.println("1");
//					
//					return user_username;
//					}
//					return null;
//				}else {
//					System.out.println("3");
//					
//					return null;
//				}
			
			return check_map;
			

			
		}
	
	
}
