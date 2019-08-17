package com.solrecipe.recipe.chat;

import java.util.Date;

import com.solrecipe.recipe.user.domain.MemberVO;

import lombok.Data;

@Data
public class ChatRoomVO {
	int chatroom_num;		//채팅방 번호
	String chat_address;	//채팅방 주소
	int chat_curmember;		//채팅방 현재 인원
	int chat_maxmember;		//채팅방 최대 인원
	int user_num;			//개설자의 닉네임을 띄워주기 위해서 필요하다.
	int chat_status;		//1이면 진행, 0이면 마감된 방
	String chat_title;		//채팅방 제목
	Date firstdate;			//개설일 
	
	MemberVO memberVO;		// join결과 출력을 위한VO
	

}