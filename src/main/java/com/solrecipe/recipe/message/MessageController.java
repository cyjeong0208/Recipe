package com.solrecipe.recipe.message;

import java.security.Principal;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.solrecipe.recipe.CommonServiceImpl;
import com.solrecipe.recipe.admin.AdminServiceImpl;
import com.solrecipe.recipe.admin.Paging;
import com.solrecipe.recipe.user.domain.MemberVO;

import lombok.Setter;

@Controller
public class MessageController {

	@Autowired
	private MessageServiceImpl messageService;

	@Setter(onMethod_ = { @Autowired })
	private CommonServiceImpl commonService;
	
	@Autowired
	private AdminServiceImpl adminService;
	
	// 최초에 메시지함 띄움
	@PostMapping(value = "/message.do", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public ArrayList<MessageVO> message(int page, Principal principal) throws Exception {
		String username = principal.getName();

		MemberVO vo = commonService.getMyVO(username);
		
		ArrayList<MessageVO> list = (ArrayList<MessageVO>) messageService.getList(vo.getUser_num(), page);
		
		return list;
	}
	
//	메시지함에서 페이징처리를 위한 페이징 객체를 얻는 콜
	@PostMapping(value = "/getPaging", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public Paging returnPaging(int page){
//		전체 메시지 개수를 구한다(페이징 처리를 위해)
		int totalPosts = adminService.getTotalCnt("message");
		Paging paging = new Paging(10,5,page,totalPosts);
		
		return paging;
	}
	
	// 메시지 상세보기
	@PostMapping(value = "/detailMsg", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public MessageVO detailMsg(int message_num) {

		MessageVO vo = messageService.getDetailMsg(message_num);
		return vo;
	}

	// 메시지 보냄.
	@PostMapping(value = "/sendMsg", produces = "application/text;charset=UTF-8")
	@ResponseBody
	public String sendMessage(String message_content, Principal principal) throws Exception {
		String username = principal.getName();
		MemberVO vo = commonService.getMyVO(username);

		// 보내는 유저 번호와, 내용을 초기화
		MessageVO messageVO = new MessageVO();
		messageVO.setSend_content(message_content);
		messageVO.setSender_num(vo.getUser_num());
		messageVO.setRecver_num(1);
		int n = messageService.sendMsg(messageVO);
		if (n == 1) {
			return "good";
		} else {
			return "bad";
		}
	}
	
	// 메시지 답변
	@PostMapping(value = "/answerMsg", produces = "application/text;charset=UTF-8")
	@ResponseBody
	public String answerMessage(int message_num, String recv_content) throws Exception {
		MessageVO messageVO = new MessageVO();
		messageVO.setMessage_num(message_num);
		messageVO.setRecv_content(recv_content);
		messageVO.setIsRecvSend(1);
		int n = messageService.answerMsg(messageVO);
		if (n == 1) {
			return "good";
		} else {
			return "bad";
		}
	}
}
