package com.solrecipe.recipe.user.controller;



import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.solrecipe.recipe.user.domain.AuthVO;
import com.solrecipe.recipe.user.domain.MemberVO;
import com.solrecipe.recipe.user.service.UserService;

import lombok.Setter;

@Controller
public class UserController {
	

	@Setter(onMethod_ = @Autowired)
	private PasswordEncoder pwencoder;

	@Autowired
	UserService userService;
	


	//회원가입 
	@RequestMapping("/signup")
	@ResponseBody
	public String updatePW(MemberVO memberVO, AuthVO authVO, @RequestParam String user_pw, @RequestParam String user_username,
							@RequestParam String user_nickname, RedirectAttributes rttr, HttpServletResponse response) throws IOException {
		//암호화
		String enpw = pwencoder.encode(user_pw);
		memberVO.setUser_pw(enpw);
		
		System.out.println(user_nickname);
		//닉네임 없을 때,.,,, 
		if(user_nickname==null || user_nickname.equals("")) {
			String[] nickname = user_username.split("@");
			memberVO.setUser_nickname(nickname[0]);
		}
		
		int result = userService.updatePW(memberVO);  //pw insert 
		
		memberVO.setFirstdate(new Timestamp(System.currentTimeMillis()));		
		memberVO.setUpdatedate(new Timestamp(System.currentTimeMillis()));
		
		int result1 = userService.insertMember(memberVO); //detail insert
		int result2 = userService.insertAuth(authVO); // auth insert
		
		if(result == 1 && result1 ==1 && result2 ==1) {
			
//			memberVO.setUser_name(user_name);
			
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('회원가입 완료...');");
			out.println("location.href='main'");
			out.println("</script>");
			out.close();
			return "main";
			
		}
		else {
			rttr.addFlashAttribute("joinmsg", "join_fail");
			return "main";
		}
	}
	
//	//회원가입 
//	@RequestMapping("/signup_insert")
//	public String insertUser(MemberVO memberVO, RedirectAttributes rttr) {
//		System.out.println("insert");
//	//암호화
//		memberVO.setFirstdate(new Timestamp(System.currentTimeMillis()));		
//		memberVO.setUpdatedate(new Timestamp(System.currentTimeMillis()));
//		int result = userService.insertMember(memberVO);
//		System.out.println("insert result :" +result);
//		if(result == 1) {
//			rttr.addFlashAttribute("joinmsg", "join_success");
//			return "main";
//		}
//		else {
//			rttr.addFlashAttribute("joinmsg", "join_fail");
//			return "main";
//		}
//	}	
//	
		

}
