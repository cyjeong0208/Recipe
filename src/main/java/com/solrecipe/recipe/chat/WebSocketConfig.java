package com.solrecipe.recipe.chat;

import org.springframework.context.annotation.Configuration;
import org.springframework.messaging.simp.config.MessageBrokerRegistry;
import org.springframework.web.socket.config.annotation.EnableWebSocketMessageBroker;
import org.springframework.web.socket.config.annotation.StompEndpointRegistry;
import org.springframework.web.socket.config.annotation.WebSocketMessageBrokerConfigurer;

@Configuration
@EnableWebSocketMessageBroker // 메시지 브로커 역할을 하는 설정파일임을 표시
public class WebSocketConfig implements WebSocketMessageBrokerConfigurer {
 
	 
//	pub/sub 메시징을 구현하기 위해 메시지를 발행하는 요청의 prefix는 /pub로 시작하도록 설정하고 
//	메시지를 구독하는 요청의 prefix는 /sub로 시작하도록 설정합니다. 
//	그리고 stomp websocket의 연결 endpoint는 /ws-stomp로 설정합니다. 
//	따라서 개발서버의 접속 주소는 다음과 같이 됩니다. ws://localhost:8080/ws-stomp
	
    @Override
    public void configureMessageBroker(MessageBrokerRegistry config) {
        config.enableSimpleBroker("/sub");//chat/rom/piel + ~ 아무렇게나 정해도 된다.
        config.setApplicationDestinationPrefixes("/pub");//  "/pub/~~/~~ 아무렇게나 정해도 된다 
    }
 
    @Override
    public void registerStompEndpoints(StompEndpointRegistry registry) {
        				//new SockJS('/ws-stomp') 에서만 사용 
    	registry.addEndpoint("/ws-stomp").setAllowedOrigins("*")
                .withSockJS(); // SockJS 사용하면 꼭 명시.
    }
    
    
}
