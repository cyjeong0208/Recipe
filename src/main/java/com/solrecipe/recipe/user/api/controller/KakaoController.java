package com.solrecipe.recipe.user.api.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
 
import com.solrecipe.recipe.user.api.KakaoAPI;
import com.solrecipe.recipe.user.service.UserService;
 
@Controller
public class KakaoController {
 
	@Autowired
    private KakaoAPI kakao;
	
	@Autowired
	UserService userService;
	
	
	@RequestMapping(value="/kakao_login")
	public String login(@RequestParam("code") String code, HttpSession session) {
		String access_Token = kakao.getAccessToken(code);
		System.out.println("CODE : " + code);
		System.out.println("token : " + access_Token);
	    HashMap<String, Object> userInfo = kakao.getUserInfo(access_Token);
	    System.out.println("login Controller : " + userInfo);
	    System.out.println("before session : " +session.getAttribute("userId"));
	    //    클라이언트의 이메일이 존재할 때 세션에 해당 이메일과 토큰 등록
	    if (userInfo.get("id") != null) {
	        session.setAttribute("userId", userInfo.get("id"));
	        session.setAttribute("userNickname", userInfo.get("nickname"));
	        session.setAttribute("access_Token", access_Token);
	    }
	    
	    String kakao_id = (String)session.getAttribute("userId");
	    
	    int chkKakao = userService.chkKakaouser(kakao_id);
	    
	    System.out.println("before chkKakao : " + chkKakao);
		
	    //없어어어엉 
	    if(chkKakao == 0) {
	    	chkKakao = -1;
	    }
	    
	    
	    System.out.println("chkKakao : " + chkKakao);
	
	    session.setAttribute("chkKakao", chkKakao);
	    
	    
	    System.out.println("session : " +session.getAttribute("chkKakao"));
	    return "redirect:/main";
	}
	
	@RequestMapping(value="/kakao_logout")
	public String logout(HttpSession session) {
	    kakao.kakaoLogout((String)session.getAttribute("access_Token"));
	    session.removeAttribute("access_Token");
	    session.removeAttribute("userId");
	    session.removeAttribute("userNickname");
	    return "redirect:/main";
	}


}