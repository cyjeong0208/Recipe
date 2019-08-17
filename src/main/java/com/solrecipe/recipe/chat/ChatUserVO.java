package com.solrecipe.recipe.chat;

public class ChatUserVO {
	
	int chatroom_num;	// 채팅방 번호
	int user_num;		// 회원 번호
	
	
	
	
	public ChatUserVO() {

	}
	
	
	
	public ChatUserVO(int chatroom_num, int user_num) {
		this.chatroom_num = chatroom_num;
		this.user_num = user_num;
	}



	public int getChatroom_num() {
		return chatroom_num;
	}
	public void setChatroom_num(int chatroom_num) {
		this.chatroom_num = chatroom_num;
	}
	public int getUser_num() {
		return user_num;
	}
	public void setUser_num(int user_num) {
		this.user_num = user_num;
	}
	
	@Override
	public String toString() {
		return "ChatUserVO [chatroom_num=" + chatroom_num + ", user_num=" + user_num + "]";
	}
	
	
}
