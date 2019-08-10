//package com.solrecipe.recipe.user.api.controller;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.bind.annotation.ResponseBody;
// 
//import com.solrecipe.recipe.user.api.KakaoAPI;
// 
//@Controller
//public class KakaoController {
// 
//    @Autowired
//    private KakaoAPI kakao;
//    
////    @RequestMapping(value="/main")
////    public String index() {
////        
////        return "main";
////    }
//    
//    @RequestMapping(value="/main")
//    public String login(@RequestParam("code") String code) {
//        String access_Token = kakao.getAccessToken(code);
//        System.out.println("controller access_token : " + access_Token);
//        
//        return "main";
//    }
//}