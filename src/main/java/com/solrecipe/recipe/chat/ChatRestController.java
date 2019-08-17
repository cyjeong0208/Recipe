package com.solrecipe.recipe.chat;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.solrecipe.recipe.user.domain.MemberVO;

import lombok.Setter;

@RestController
public class ChatRestController {
	
	@Setter(onMethod_ = @Autowired)
	private ChatService service;
	
	@GetMapping(value = "/JsonTesting", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public Map<String, Object> getChattings() {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("just", "just");
		map.put("for", new Integer[]{1,2,3,4});
		map.put("test", 1);
		/*  콘솔창 결과:
		  	for: (4) [1, 2, 3, 4]
			just: "just"
			test: 1 
		*/
		return map;
	}
	
//	@GetMapping(value = "/", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
//	public Map<String,Object> getChattingUsers(@RequestParam("chatroom_num") Integer chatroom_num){
//		if(chatroom_num == null) return null; //참고로 ajax는 null 받으면 에러
////		service.getChattingUsers();
//		return null;
////		MemberVO
//	}
	
	
}
