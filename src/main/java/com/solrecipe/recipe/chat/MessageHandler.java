package com.solrecipe.recipe.chat;

import static org.springframework.test.web.client.response.MockRestResponseCreators.withUnauthorizedRequest;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.SimpMessageSendingOperations;
import org.springframework.security.core.userdetails.User.UserBuilder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.DefaultTransactionDefinition;
import org.springframework.web.socket.TextMessage;

import com.solrecipe.recipe.user.domain.MemberVO;

import lombok.RequiredArgsConstructor;


//@MessageMapping을 통해 Websocket으로 들어오는 메시지 발행을 처리합니다. 
//클라이언트에서는 prefix를 붙여서 /pub/chat/message로 발행 요청을 하면 Controller(Handler)가 
//해당 메시지를 받아 처리합니다. 메시지가 발행되면 /sub/chat/room/{roomId}로 메시지를
//send 하는 것을 볼 수 있는데 클라이언트에서는 해당 주소를(/sub/chat/room/{roomId})
//구독(subscribe)하고 있다가 메시지가 전달되면 화면에 출력하면 됩니다. 
//여기서 /sub/chat/room/{roomId}는 채팅룸을 구분하는 값이므로 pub/sub에서 Topic의 역할이라고 보면 됩니다.
//기존의 WebSockChatHandler가 했던 역할을 대체하므로 WebSockChatHandler는 삭제합니다. 

@Controller
public class MessageHandler {
	
	private final SimpMessageSendingOperations messagingTemplate;
	private ChatService service;
	private PlatformTransactionManager manager;
	
	
	@Autowired
	public MessageHandler(SimpMessageSendingOperations messagingTemplate, ChatService service,PlatformTransactionManager manager) {
		this.messagingTemplate = messagingTemplate;
		this.service = service;
		this.manager = manager;
	}
	
	
	// @MessageMapping : WebConfig에서 destinationprefix (/pub) + 클라이언트가 전송할 mapping주소 
	@MessageMapping("/chat/message/{select}")
	// json타입으로 넘어온 message로 chatMessage가 초기화 됨.
	public void message(ChatMessage message,@DestinationVariable String select) {
		
		int selectNum = select.equals("change")? 0:1; //change : with
		
		int chatroom_num = message.getRoomId();
		int userNum = message.getUserNum();
		DefaultTransactionDefinition definition = new DefaultTransactionDefinition();
		
		
		
		//새로운 방을 개설했을 경우.
		if(ChatMessage.MessageType.NEW.equals(message.getType())) {
			
			
			definition.setIsolationLevel(TransactionDefinition.ISOLATION_READ_COMMITTED);//dirty read 방지
			TransactionStatus status = manager.getTransaction(definition);
			ChatRoomVO chatroomDetail=null;
			try {
				
				chatroomDetail = service.getChatRoomDetail(chatroom_num, selectNum);
				
				// 접속도중 채팅방이 없어진 상태거나, 채팅방의 진행상태가 "마감"일 때 못들어오게 막는다.
				if(chatroomDetail == null || chatroomDetail.getChat_status() == 0) {
					message.setMessage("없어진 채팅방이거나 마감이된 채팅방입니다. 다른 채팅방을 이용해주세요");
					message.setSender("ERROR");
					throw new Exception("없어진 채팅방이거나 마감이된 채팅방입니다");
				}
				
				message.setChatroomDetail(chatroomDetail);
				
				List<MemberVO> userList = service.getChatRoomUsers(chatroom_num, selectNum);
				message.setUserList(userList);
				message.setMessage("방이 개설되었습니다.");
		    	message.setSender("SERVER");
	    	} catch (Exception e) {
	    		/* ignore - this transaciton is just for preventing DIRTY READ */
			} finally {
				manager.commit(status);
			}
			
			
		}else if (ChatMessage.MessageType.JOIN.equals(message.getType())) { //채팅방에 참여할 경우
			
			// 알고리즘 설계를 위한 트랜잭션일 뿐, 실제로 문제가 생겨서 에러가 나는 것을 상정한 것은 아니다.
			TransactionStatus status = manager.getTransaction(definition);
			ChatRoomVO chatroomDetail=null;
			
			try {
				
				chatroomDetail = service.getChatRoomDetail(chatroom_num, selectNum);
				
				// 접속도중 채팅방이 없어진 상태거나, 채팅방의 진행상태가 "마감"일 때 못들어오게 막는다.
				if(chatroomDetail == null || chatroomDetail.getChat_status() == 0) {
					message.setMessage("없어진 채팅방이거나 마감이된 채팅방입니다. 다른 채팅방을 이용해주세요");
					message.setSender("ERROR");
					throw new Exception("없어진 채팅방이거나 마감이된 채팅방입니다");
				}
				
				message.setChatroomDetail(chatroomDetail);
				
				int insertUser = service.insertUser(new ChatUserVO(chatroom_num, userNum), selectNum);
				
				if(insertUser==1) {	//만약에 채팅방에 없던 회원이면 들어가는데에 문제가 없습니다.
			    	
					int plus = service.plusChatUserNum(chatroom_num, selectNum);
					
					if(plus==0) { //정원이 꽉찼을 때는 curmember가 증가하지 않아서 update한 행의 갯수가 0이 나옵니다.
						
						message.setMessage("정원이 꽉 찼습니다.");
						message.setSender("ERROR");
						throw new Exception("정원이 꽉찼습니다.");
						
					} else {
						List<MemberVO> userList = service.getChatRoomUsers(chatroom_num, selectNum);
						message.setUserList(userList);
						message.setMessage(message.getSender() + " 님이 입장하셨습니다.");
				    	message.setSender("SERVER");
					}
				} else {			//insert의 반환값이 0이라는 것은 채팅방에 이미 회원번호가 존재할 때입니다. 이것은 불가능한 일입니다.
					message.setSender("ERROR");
					message.setMessage("중복된 회원이 같은 방에 입장한 것은 불가능합니다.");
				}
				
				manager.commit(status);
				
			} catch (Exception e) {
				//insertUser() 메서드를 통해서 추가되었던 인원을 다시 없애기 위해서 트랜잭션을 썼다.
				manager.rollback(status);
			} 
			
			
	    	
	    } else if(ChatMessage.MessageType.EXIT.equals(message.getType())) { //채팅방을 나갈 경우
	    	
	    	if(message.getMessage() == null) {//에러에 의해서 날라온 EXIT 메시지가 아니면 인원수를 채팅방에서 감소 시킨다.
	    										//에러에 의한 게 아니면 인원수를 감소 시키지 않는다.
		    	TransactionStatus status = manager.getTransaction(definition);
		    	
		    	try {
			    	service.deleteChatUser(chatroom_num, userNum, selectNum);
			    	service.minusChatUserNum(chatroom_num, selectNum);
			    	
		    	} 
		    	catch (Exception e) { /* ignore - just for wrapping to one transaction */	} 
		    	finally {
		    		message.setMessage(message.getSender() + " 님이 나가셨습니다.");
			    	message.setSender("SERVER");
		    		manager.commit(status);
		    	}
	    	} 

	    } else if(ChatMessage.MessageType.TALK.equals(message.getType())) {
			try {
				ChatVO vo = new ChatVO(null,message.getMessage(),chatroom_num,userNum,null);
				service.insertChat(vo, selectNum);
				System.out.println("welldone");
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		
		
		if(select.equals("change")) {	
			messagingTemplate.convertAndSend("/sub/chat/room/" + message.getRoomId()+"/select/change", message);
		} else {
			messagingTemplate.convertAndSend("/sub/chat/room/" + message.getRoomId()+"/select/with", message);
		}
		
	    
	    // 받은 메시지를 돌려 보내므로, message는 그대로 JSON타입이다.  //select 추
	    
	    // @SendToUser는 특정 url로만 메시지를 보낼 떄 사용. 즉 귓속말에 사용?
	    // @SendTo 1:n 메시지를 보낼때. 
	    
	    
	}		
	    	
}
