//package com.solrecipe.recipe.user.api.controller;
//
//import javax.servlet.http.HttpSession;
//
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestParam;
//
//import com.fasterxml.jackson.databind.JsonNode;
//import com.solrecipe.recipe.user.api.Kakao_restapi;
//
//public class KakaoController {
//	@RequestMapping(value = "/oauth", produces = "application/json")
//    public String kakaoLogin(@RequestParam("code") String code, Model model, HttpSession session) {
//        System.out.println("로그인 할때 임시 코드값");
//        //카카오 홈페이지에서 받은 결과 코드
//        System.out.println(code);
//        System.out.println("로그인 후 결과값");
//        
//        //카카오 rest api 객체 선언
//        Kakao_restapi kr = new Kakao_restapi();
//        //결과값을 node에 담아줌
//        JsonNode node = kr.getAccessToken(code);
//        //결과값 출력
//        System.out.println(node);
//        //노드 안에 있는 access_token값을 꺼내 문자열로 변환
//        String token = node.get("access_token").toString();
//        //세션에 담아준다.
//        session.setAttribute("token", token);
//        
//        return "logininfo";
//    }
//	
//	@RequestMapping(value = "/logout", produces = "application/json")
//    public String Logout(HttpSession session) {
//        //kakao restapi 객체 선언
//        Kakao_restapi kr = new Kakao_restapi();
//        //노드에 로그아웃한 결과값음 담아줌 매개변수는 세션에 잇는 token을 가져와 문자열로 변환
//        JsonNode node = kr.Logout(session.getAttribute("token").toString());
//        //결과 값 출력
//        System.out.println("로그인 후 반환되는 아이디 : " + node.get("id"));
//        return "redirect:/";
//    }    
//	
//
//
//
//}
