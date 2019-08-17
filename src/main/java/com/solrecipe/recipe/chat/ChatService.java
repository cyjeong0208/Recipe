package com.solrecipe.recipe.chat;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.solrecipe.recipe.user.domain.MemberVO;

public interface ChatService {
	
	/* 관수 */
	
	//채팅방 목록을 싹다 읽어온다.
	List<ChatRoomVO> getChatList(int type, int page, String localSearch, String titleSearch);
	
	//채팅방의 갯수를 반환한다.
	int getTotalCnt(int type);
	
	MemberVO getMyVO(String id);
	
	/*-----------------------------------------------------*/
	
	/* 상언 */
	public int makeChatRoom(ChatRoomVO vo, Integer select);
	
	//채팅방을 db에 삽입한다.
	public int insertChatRoom(ChatRoomVO vo, Integer select);
	
	//채팅방의 현재 사용자를 db에 삽입한다.
	public int insertUser(ChatUserVO vo, Integer select);
	
	//채팅방에 채팅 내용을 기록한다.
	public int insertChat(ChatVO vo, Integer select);
	
	//채팅방을 삭제한다. 채팅방은 change_tb(혹은 with_tb) 에서 삭제하면 그 채팅방과 관련된 
	// CHANGE_CHAT_TB, CHANGE_USER_TB 의 row를 모두 한번에 지워진다. 
	// db에서 테이블 설계시 on delete cascade 했기 때문이다.
	public int deleteChatRoom(Integer chatroom_num,Integer select);
	
	
	//19.07.29 
	
	//해당 채팅방에 있는 user_num들의 user_detail 정보를 가져오기 
	public List<MemberVO> getChatRoomUsers(Integer chatroom_num, Integer select);		
	
	//해당 채팅방의 상세 정보 읽어오기.
	public ChatRoomVO getChatRoomDetail(Integer chatroom_num, Integer select);
		
	
	//해당 채팅방의 "현재 인원(=chat_curmember)" 의 값을 1증가 시키는 것이다. 만약 chat_maxmember 보다 큰값으로 update되려고 하면,  update되지 않게 해놨다.
	//그러므로, chat_maxmember보다 작으면서 값이 증가하면 반환값이 1일 테고, 아니면 0이다. 그리고 0일 때 throw new Exception() 을 해서 rollback 을 시킨다.
	public int plusChatUserNum(Integer chatroom_num, Integer select);
		
	
	//19.08.02  채팅 방을 나갔을 때 필요한 sql 작성

	//chat_user_tb에서 해당 채팅방의 특정 user_num을 지운다.
	public int deleteChatUser(@Param("chatroom_num") int chatroom_num, @Param("user_num") int user_num, @Param("select") int select);
		
	//change_tb에서 curmember 의 갯수를 감소 시킨다.
	//chat_status를 1->0으로 바꾸는 것은 CHANGE_TB_CHATSTATUS_TRIGGER 로 해결
	public int minusChatUserNum(@Param("chatroom_num") Integer chatroom_num,@Param("select") Integer select);
		
		
	
}
