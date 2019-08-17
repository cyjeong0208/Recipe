package com.solrecipe.recipe.chat;

import java.sql.Date;

public class ChatVO {//채팅방 내용을 저장하는 VO
	
	Integer chat_num;
	String chat_content;
	Integer chatroom_num;	//change_tb 혹은 with_tb의 chat 
	Integer user_num;		//user_detail의 user_num을 참조
	Date firstdate;
	
	
	
	public ChatVO() {

	}


	public ChatVO(Integer chat_num, String chat_content, Integer chatroom_num, Integer user_num, Date firstdate) {
		this.chat_num = chat_num;
		this.chat_content = chat_content;
		this.chatroom_num = chatroom_num;
		this.user_num = user_num;
		this.firstdate = firstdate;
	}




	public int getChat_num() {
		return chat_num;
	}



	public void setChat_num(int chat_num) {
		this.chat_num = chat_num;
	}



	public String getChat_content() {
		return chat_content;
	}



	public void setChat_content(String chat_content) {
		this.chat_content = chat_content;
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



	public Date getFirstdate() {
		return firstdate;
	}



	public void setFirstdate(Date firstdate) {
		this.firstdate = firstdate;
	}



	@Override
	public String toString() {
		return "ChatVO [chat_num=" + chat_num + ", chat_content=" + chat_content + ", chatroom_num=" + chatroom_num
				+ ", user_num=" + user_num + ", firstdate=" + firstdate + "]";
	}
	
}
