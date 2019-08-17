package com.solrecipe.recipe.chat;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.solrecipe.recipe.user.domain.MemberVO;

// 서버단위SocketHandler 정의
// websocket에서 서버단위 프로세스를 정의할 수 있다.

public class EchoHandler extends TextWebSocketHandler{
	
	@Autowired
	private ChatService service;
	
	// 로그 띄우려고 있는거.
	private final Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	private PlatformTransactionManager manager;
	
	//https://possiblelossofprecision.net/?p=813 How to change HashSet Thread-safe-> but doesnt need in j2EE
	//private Set<WebSocketSession> sessionSet = Collections.synchronizedSet(new HashSet<WebSocketSession>());
	
	//접속하는 사용자에 대한 웹소켓세션을 보관하기 위해 정의
	private Set<WebSocketSession> sessionSet = new HashSet<WebSocketSession>();
	
//	private Set<ChatRoom> chatroomManager = new HashSet<EchoHandler.ChatRoom>();
	
	//private Set<ChatRoom> ChatroomRepository = new HashSet<EchoHandler.ChatRoom>();
	
	public EchoHandler() {
		super();
		this.logger.info("----------------create SocketHandler instance!----------------------");
	}
	
	// 세션이 연결된 이후(클라이언트가 소켓에 접속한 이후)
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception{
		
		super.afterConnectionEstablished(session);
		
		System.out.println("session: "+session);
		
		Map<String, Object> map = session.getAttributes();
		List<MemberVO> list =null;
		Integer user_num = Integer.parseInt((String)map.get("user_num"));
		Integer chatroom_num  = Integer.parseInt((String)map.get("chatroom_num"));
		Integer select = Integer.parseInt((String)map.get("select"));
		System.out.println("afterConnectionEstablished() -> user_num : " + user_num);
		System.out.println("afterConnectionEstablished() -> chatroom_num: " + chatroom_num);
		System.out.println("afterConnectionEstablished() -> select: " + select);
		
		
		//1. 채팅방 입장 불가 조건  => 채팅방이 없다(혹은 접속 중에 없어졌다)  또는   CHANGE_TB.CHAT_STATUS가  1-->0  으로 변할때(= 방이 마감되었을 때)
		JsonObject response = new JsonObject();
		ChatRoomVO chatroom = service.getChatRoomDetail(chatroom_num, select);
		
		
		if(chatroom == null ) { 
			
			response.addProperty("denied", "존재하지 않는 방입니다.");
			session.sendMessage(new TextMessage(response.toString()));
			session.close();
			
		} else if(chatroom.getChat_status() == 0) {
		
			response.addProperty("denied", "채팅방이 마감되었습니다.");
			session.sendMessage(new TextMessage(response.toString()));
			session.close();
			
		}  else if(chatroom.getChat_curmember() >= chatroom.getChat_maxmember()) {
			  
			response.addProperty("denied", "채팅방 정원이 초과되었습니다."); session.sendMessage(new
			TextMessage(response.toString())); session.close();
			
		}
			 
		
		
		
		ChatUserVO user =  new ChatUserVO();
		user.setChatroom_num(chatroom_num);
		user.setUser_num(user_num);
		
		
		TransactionStatus status = manager.getTransaction(new DefaultTransactionDefinition());
		try {
			
			Integer insertSuccess = service.insertUser(user, select);
			
			if(insertSuccess == 0 && chatroom.getChat_curmember() == 1) {
				response.addProperty("newChatRoom", chatroom_num+" 번 채팅방이 개설되었습니다.");
			} else if (insertSuccess == 1 && chatroom.getChat_curmember() + 1 > chatroom.getChat_maxmember()) {
				throw new Exception("정원초과");
			} else if(insertSuccess == 1 && chatroom.getChat_curmember() + 1 <= chatroom.getChat_maxmember()) {
				service.plusChatUserNum(chatroom_num, select);//해당 채팅방의 curmember+1
				chatroom = service.getChatRoomDetail(chatroom_num, select);
			} else if(insertSuccess ==0 && chatroom.getChat_curmember() != 1) {
				//throw new Exception("중복된 회원"); // 지금은 테스트 중이니 하지 않는다.
			}
			
			list = service.getChatRoomUsers(chatroom_num, select);
			manager.commit(status);
			
		} catch (Exception e) {
			
			e.printStackTrace();
			manager.rollback(status);	//insertUser() 메서드를 통해서 추가되었던 인원을 다시 없애기 위해서 트랜잭션을 썼다.
			response.addProperty("denied", "채팅방 접속이 불가합니다.");
			session.sendMessage(new TextMessage(response.toString()));
			session.close();
			
		} 
		
		//여기까지 오면 문제가 없는 거다. 이제 데이터를 모아보자.
		
		
		ArrayList<String> UserList = new ArrayList<String>();
		Gson gson = new Gson();
		
		for(MemberVO vo : list) {
			String jsonObject_str = gson.toJson(vo);
			UserList.add(jsonObject_str);
		}
		
		response.addProperty("userList", UserList.toString());
		response.addProperty("chatroom", gson.toJson(chatroom));
		response.addProperty("user_num", user_num);
		response.addProperty("chatroom_num", chatroom_num);
		
		sessionSet.add(session);
		
		logger.info("session Id - {}  연결됨 / 현재 sessionSet.size() - {}", session.getId(), sessionSet.size());
		response.addProperty("connect_success", "connect Success!!");
		System.out.println("현재 접속자는? "+session.getPrincipal().getName());
		session.sendMessage(new TextMessage(response.toString()));
	}
	
	//클라이언트 에서의 연결을 종료할 경우 발생하는 이벤트, 채팅창을 닫으면 자동 호출된다.
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		
		super.afterConnectionClosed(session, status);
		
		sessionSet.remove(session);//이제 더이상 이 사용자에게는 메시지를 뿌려줄 필요가 없으인 set에서 제거
		logger.info("{} 연결 해제됨", session.getId());
		this.logger.info("remove session!");
	}
	
//	웹소켓 서버측에 텍스트 메시지가 접수되면 호출되는 메소드
//	클라이언트에서 send를 이용해서 메시지 발송을 한 경우 실행된다.
	public void handleMessage(WebSocketSession session, WebSocketMessage<?> message) throws Exception{
		super.handleMessage(session, message);
//		System.out.println(session.getPrincipal().getName());
		// session.getAttributes() :
		// HandshakeInterceptor의 beforeHandshake() 메소드에서 저장한 map을 가져온다.
		Map<String, Object> map = session.getAttributes();
		Integer user_num  = Integer.parseInt((String) map.get("user_num"));
//		System.out.println("handleMessage() => map: " +map);
		System.out.println("handleMessage() => user_num: "+user_num);
		//https://yookeun.github.io/java/2017/05/27/java-gson/  : gson 사용법
		JsonObject response = new JsonObject();
		
		response.addProperty("user_num", user_num);
		response.addProperty("message", message.getPayload().toString());	//받은 메시지
		TextMessage message_ = new TextMessage(response.toString());
		
		// https://www.programcreek.com/java-api-examples/?api=org.springframework.web.socket.TextMessage

		// 메세지 전원에게 뿌려주는 과정.
		for(WebSocketSession client_session : this.sessionSet) {
			if(client_session.isOpen()){
				try {
					client_session.sendMessage(message_); 
					//	client_session.sendMessage(new TextMessage(session.getPrincipal().getName()+ "|" + message.getPayload())); 
				}catch(Exception ignored) {
					this.logger.error("fail to send message!", ignored);
				}
			}
		}
	}

	// 전송 에러 발생할 때 호출
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception{
		this.logger.error("web socket error!",exception	);
	}
	
	

}












