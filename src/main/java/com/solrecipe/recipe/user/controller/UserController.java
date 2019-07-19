//package com.solrecipe.recipe.user.controller;
//
//import javax.servlet.http.HttpServletRequest;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//
//import com.solrecipe.recipe.user.domain.MemberVO;
//import com.solrecipe.recipe.user.email.service.MailService;
//import com.solrecipe.recipe.user.service.UserService;
//
//@Controller
//public class UserController {
//	
//	@Autowired
//	private UserService userservice;
//
//	
//	// 회원가입 컨트롤러
//	@RequestMapping(value = "/user", method = RequestMethod.POST)
//	public String userRegPass(MemberVO memberVO, HttpServletRequest request) {
//		// 회원가입 메서드
//		userservice.user_service(memberVO);
//		
//		return "redirect:/";
//	}
//
//}
