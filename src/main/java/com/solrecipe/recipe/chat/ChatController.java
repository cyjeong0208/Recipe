package com.solrecipe.recipe.chat;

import java.security.Principal;
import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;

import com.solrecipe.recipe.user.domain.MemberVO;

import lombok.Setter;

@Controller
public class ChatController {
	
	@Setter(onMethod_ = @Autowired)
	private ChatService service;
	
	
	@RequestMapping("/change_index")
	public String chat_index(@RequestParam(value = "page", defaultValue="1") int page, 
							 @RequestParam(value = "select", required = false) Integer select, 
							 Model model, Principal principal, 
							 @RequestParam(value = "localSearch",required = false) String localSearch,
							 @RequestParam(value = "titleSearch",required = false) String titleSearch) {
		
		System.out.println("localSearch: "+localSearch);
		System.out.println("titleSearch: "+titleSearch);
		
		
		MemberVO myVO;
		// 닉네임 항상 들고다니기
		if (principal != null) {
			String username = principal.getName();
			myVO = service.getMyVO(username);//myVO는 user_num이랑 user_nickname 을 들고 있다.
		}
		else {//로그인이 안된 상태이므로!
			return "/main";
		}
		
//		System.out.println("myVO.name:"+myVO.getUser_num());
//		System.out.println("myVO.name:"+myVO.getUser_nickname());
//		System.out.println("select : " + select);
		
		
		if(select != null)	System.out.println("chat_index() -> 현재 select 값: "+select);
		int listCnt = 15;
		int pageCnt = 5;
		int totalCnt = service.getTotalCnt(0);
		int totalPage = totalCnt/listCnt+1;
		
		if (page > totalPage){
			page = totalPage;
		}
		int startPage = ((page - 1) / pageCnt) * pageCnt + 1;
		
		int endPage = startPage + pageCnt - 1;
		if (endPage > totalPage) {
			endPage = totalPage;
		}
		
		// 0 -> change_tb   1 -> with_tb 호출 테이블 선택
		 ArrayList<ChatRoomVO> chatList;
		if(select == null || select == 0 ) { chatList = (ArrayList<ChatRoomVO>) service.getChatList(0, page,localSearch,titleSearch);  }
		else {  chatList = (ArrayList<ChatRoomVO>) service.getChatList(1, page,localSearch,titleSearch);  }
		
		
		System.out.println("나오는 값들");
		
		chatList.forEach(s->System.out.println(s));
		//채팅방 어디에서나 user_nickname과 user_num을 쓸 수 있다.
		model.addAttribute("nickname", myVO.getUser_nickname());
		model.addAttribute("userNum", myVO.getUser_num());
		
		model.addAttribute("chatList", chatList);
		model.addAttribute("page", page);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("localSearch",localSearch);
		model.addAttribute("titleSearch",titleSearch);
		
		
		if(select == null || select == 0 ) { //기본은 /chat/change_index
			return ("/chat/change_index");
		} else {							//기본은 /chat/with_index
			return "/chat/with_index";
		}
		
	}
	
	@PostMapping(value = "/makeChatRoom") 
	public String makeChatRoom(ChatRoomVO vo, @RequestParam("select") Integer select, RedirectAttributes rttr) {
		
		
//		System.out.println(select==0?"물물교환 채팅방 개설":"공동구매 채팅방 개설");
//		System.out.println("채팅방 제목: "+vo.getChat_title());
//		System.out.println("채팅방 주소: "+vo.getChat_address());
//		System.out.println("최대인원수: " +vo.getChat_maxmember());
//		System.out.println("현재 로그인한 회원의 회원번호: "+vo.getUser_num());
		
		
		int chatroom_num = service.makeChatRoom(vo, select);	//성공하면 채팅방 번호를, 실패하면 -1
		System.out.println("채팅방 번호: "+chatroom_num);
//		rttr.addFlashAttribute("insertSuccess", chatroom_num);
		rttr.addFlashAttribute("createdRoomNum", chatroom_num);
		rttr.addAttribute("select",select);
		if(select == 0) {
			return "redirect:/change_index";
		} else {
			return "redirect:/change_index?select=1";
		}
	}
	
	
}
