package com.solrecipe.recipe.chat;

import java.util.List;

import com.solrecipe.recipe.user.domain.MemberVO;

import lombok.Data;

@Data
public class ChatMessage {
    // 메시지 타입 : 입장, 채팅
    public enum MessageType {
        NEW, JOIN, TALK, EXIT
    }
    
    
    
//    ChatRoomVO chatroom=null;
    
    private MessageType type; // 메시지 타입 -> 첫 입장시 join, 그냥 채팅 시 talk
    private int roomId; // 방번호
    private int userNum;
    private String sender; // 메시지 보낸사람
    private String message; // 메시지
    private ChatRoomVO chatroomDetail;
    List<MemberVO> userList; //참고로 아무것도 값을 안주면 json이 아예 무시한다. 하지만 null이라도 
    
}