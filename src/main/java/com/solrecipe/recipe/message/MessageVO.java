package com.solrecipe.recipe.message;

import java.sql.Date;

import com.solrecipe.recipe.admin.Paging;

import lombok.Data;

@Data
public class MessageVO {
	private int message_num;
	private int sender_num; // 보낸이 user_num
	private int recver_num; //받은이 user_num
	private String send_content; // 보낸내용
	private String recv_content; // 받은내용
	private Date sendDate;		//보낸날짜
	private Date recvSendDate;	//답변날짜
	private int isRecvSend; // 답변여부 1:답변 0:미답변
	
	private String sender_nickname;		// 닉네임 써야함
	private String recver_nickname;		// 닉네임 써야함
	private String index_content; 	// 메시지함에 ...과 함께 나올 내용.
}
