package com.solrecipe.recipe.chat;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.http.server.ServletServerHttpRequest;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.server.support.HttpSessionHandshakeInterceptor;


//https://hypnosis001.tistory.com/15    오리지날 코드

/*
웹소켓에서 HttpSession 객체를 사용하도록하기 위한 클래스 정의
WebSocektHandler에서는 접속자에 대한 정보가 WebSocektSession에 저장되는데 이는 HttplSession 클래스와  다르기 때문에
이용자의 ID 등 개발자가 필요한 이용자의 정보를 저장할 때는 HttpSession에 저장해 둔 이용자의 ID를 WebSocketHandler의 WebSocketSession에 저장해두고 이용자를 관리
할 수 있다. WebSocketHandler를 구현한 클래스 안에서는 HttpSevletRequest등의 서블릿 관련 클래스를 사용할 수 없으므로  WebSocketHandler 보다 앞서 실행되는
HttpSessionHandshakeInterceptor 인터셉터를 이용하여 이용자의 HttpSession에 접속하고 세션에 저장된 내용을 WebSocketHandler로 전달해주면 WebSocketHandler 안에서도
이용자의 ID 등 필요한 이용자 정보를 사용하고 관리할 수 있게 된다.
*/
public class HandshakeInterceptor extends HttpSessionHandshakeInterceptor {
	//소켓과 통신이 이루어지기 전에 이 클래스의 메서드가 자동 호출
	//자동으로 호출되는 메소드  beforeHandshake와 afterHandshake, 명시적 호출 X
	public boolean beforeHandshake(ServerHttpRequest request, ServerHttpResponse response, WebSocketHandler wsHandler,
			Map<String, Object> map) throws Exception {
		//Map이 핸들러에게 보내줄 정보를 담는 통이된다.
		
		System.out.println("Before Handshake");
		
		ServletServerHttpRequest ssreq = (ServletServerHttpRequest) request;
		
		System.out.println("URI : "+request.getURI()); //http://localhost:8090/springwebsocket2/broadcasting.do
		
		HttpServletRequest req = ssreq.getServletRequest();
		
		String user_num = (String)req.getParameter("user_num");
		String chatroom_num = (String)req.getParameter("chatroom_num");
		String select = (String)req.getParameter("select");
		System.out.println("beforeHandshake() , select 값 => "+select);
		map.put("select", select);// new WebSocket(~) 한 위치가 change_index인지 with_index인지 구별하는 기준점 0: change_index, 1: with_index
		map.put("user_num",user_num);// new WebSocket을 요청한 사용자의 user_num(PK 값임)
		map.put("chatroom_num",chatroom_num);// new WebSocket을 요청한 사용자가 들어가려는 채팅방 번호
		//req.removeAttribute(name);
		//나중에 사용자를 관리한다던가, 또는 어떤 추가적인 정보를 웹소켓에 보내고 싶으면 map에다가 넣어주고 보내면 된다.
		//얘는 Session.setAttribute 같은게 없다. 그저 아래처럼 정보를 보낼 뿐이다. 
		//이러고 나서 SocketHandler.java 의  public void handleMessage 에서 읽는다.
		return super.beforeHandshake(request, response, wsHandler, map);
	
	}

	//웹소켓 연결이 다 끝나면 자동으로 호출
	public void afterHandshake(ServerHttpRequest request, ServerHttpResponse response, WebSocketHandler wsHandler,
			Exception ex) {
		System.out.println("After Handshake");
		
		
		super.afterHandshake(request, response, wsHandler, ex);
	}
	
	
	
	
}
