package com.solrecipe.recipe.chat;

import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class EchoHandler2 extends TextWebSocketHandler {//클라이언트에서 서버에 보낼때 오직 text만 가능
	
	private final Logger logger = LoggerFactory.getLogger(getClass());
	
	HttpServletRequest request;
	
	//접속하는 사용자에 대한 세션을 보관하기 위해 정의
	private Set<WebSocketSession> sessionSet = new HashSet<WebSocketSession>();

	public EchoHandler2() {
		super();
		this.logger.info("create SocketHandler instance");
	}
	

	//클라이언트 에서의 연결을 종료할 경우 발생하는 이벤트, 채팅창을 닫으면 자동 호출된다.
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		
		super.afterConnectionClosed(session, status);
		
		sessionSet.remove(session);//이제 더이상 이 사용자에게는 메시지를 뿌려줄 필요가 없으인 set에서 제거
		this.logger.info("remove session!");
	}


	//1. 클라이언트에서 접속하여 성공할 경우 자동으로 발생하는 이벤트 , session에는 연결 요청한 client session 정보가 담김
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		//10명이 접속하면 10개의 session이 sessionSet에 저장
		super.afterConnectionEstablished(session);
		System.out.println(session.toString());//StandardWebSocketSession[id=0(,1,2....한명 들어올때마다 늘어난다), uri=ws://localhost:8090/springwebsocket2/broadcasting.do]
		sessionSet.add(session);
		this.logger.info("add session!");
	}
	
	/* 웹소캣을 통해서 연결이 완료되면 이녀석이 자동으로 호출된다.*/

	//2. 웹소켓 서버측에 텍스트 메시지가 접수되면 호출되는 메소드
	// 클라이언트에서 send를 이용해서 메시지 발송흘 한 경우 실행된다.
	public void handleMessage(WebSocketSession session, WebSocketMessage<?> message) throws Exception {
		
		super.handleMessage(session, message);
		
		//session.getAttribute();
		//HandshakeInterceptor의 beforeHandshake() 메서드에서 저장한 map을 가져온다.
		Map<String, Object> map = session.getAttributes();
		String userName = (String)map.get("userName");
		System.out.println("사용자의 아이디 : "+userName);
		
		
		for(WebSocketSession client_session : this.sessionSet) {
			if(client_session.isOpen()) {
				try {
					//연결한 모든 사용자에게 메시지를 뿌려준다 (중요!)
					client_session.sendMessage(message);
				} catch (Exception ignored) {
					this.logger.error("fail to send message!",ignored);
				}
			}
		}
	}

	//전송 에러 발생할 때 호출
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
		this.logger.error("web socket error!",exception);
		
	}
	

	
	
	
}

