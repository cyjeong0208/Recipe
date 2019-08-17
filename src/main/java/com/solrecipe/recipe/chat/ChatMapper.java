package com.solrecipe.recipe.chat;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.security.access.prepost.PostAuthorize;

import com.solrecipe.recipe.user.domain.MemberVO;

public interface ChatMapper {
	
	//관수 꺼.
	
	//List<ChatRoomVO> getChatList(@Param("type")int type, @Param("startNum")int startNum);
	List<ChatRoomVO> getChatList(@Param("type")int type, @Param("startNum")int startNum,@Param("localSearch") String localSearch, @Param("titleSearch") String titleSearch);
	
	int getTotalCnt(int type);
	
	MemberVO getMyVO(@Param("id") String id);

	
	//내 꺼.
	
	//@Param("select")로 선택해서 0이면 Change_tb, 1이면 WITH_TB 에 insert를 진행한다.
	public int insertChatRoom(@Param("vo") ChatRoomVO vo, @Param("select") Integer select);
	
	//물물교환 채팅방 개설 , chatroom_num값을 반환한다.
	public int insertChangeChatRoom(ChatRoomVO vo);// chat_address, chat_maxmember, chat_title이 들어간 상태다.
	
	//공동구매 채팅방 개설, chatroom_num값을 반환한다.
	public int insertWithChatRoom(ChatRoomVO vo);// chat_address, chat_maxmember, chat_title이 들어간 상태다.
	
	
	
	
	
	//@Param("select")로 선택해서 0을 하면 CHANGE_USER_TB, 1이면  WITH_USER_TB 에 insert를 한다.
	public int insertUser(@Param("vo") ChatUserVO vo, @Param("select") Integer select);
	
	//CHANGE_USER_TB 삽입 , chat_user_num값을 반환한다.
	public int insertChangeUser(ChatUserVO vo);
	
	//WITH_USER_TB 삽입 , chat_user_num값을 반환한다.
	public int insertWithUser(ChatUserVO vo);
	
	
	
	
	//@Param("select") -> 0 : CHANGE_CHAT_TB , 1: WITH_CHAT_TB 에 insert
	public int insertChat(@Param("vo") ChatVO vo, @Param("select") Integer select);
	
	//CHANGE_CHAT_TB 삽입
	public int insertChangeChat(ChatVO vo);
	
	//WITH_CHAT_TB 삽입
	public int insertWithChat(ChatVO vo);
	
	
	//참고로 cascade on delete 가 걸려있어서 chat_tb에서 지워지는 로우와 관련된 모든 참조 로우들도 삭제된다.
	//테스트용으로 쓰고있다 , 나중에 실제로 쓰일 지는 잘 모르겠다...
	public int deleteChatRoom(@Param("chatroom_num") Integer chatroom_num,@Param("select") Integer select);
	
	
	//채팅방에 해당 회원이 있는지 검색하기 위한 select ==> 해당 객체를 뽑아내고 insertUser ※ 일단 지금은 필요없을듯. insertUser를 수정해서 문제가 해결되었다.
	//public int chatRoomUserSearch(@Param("chatroom_num") Integer chatroom_num,@Param("user_num") Integer user_num,@Param("select") Integer select);
	
	//해당 채팅방에 user_num을 insert 하는 것
	//public int insertUser(@Param("vo") ChatUserVO vo, @Param("select") Integer select); //위에 이미 선언 , vo 객체에는 user_num과 chat_num 만 세팅해주면 끝
	
	
	//해당 채팅방에 있는 user_num들의 user_detail 정보를 가져오기 
	public List<MemberVO> getChatRoomUsers(@Param("chatroom_num") Integer chatroom_num,@Param("select") Integer select);		
	
	//해당 채팅방의 상세 정보 읽어오기.
	public ChatRoomVO getChatRoomDetail(@Param("chatroom_num") Integer chatroom_num,@Param("select") Integer select);
	
	//해당 채팅방의 "현재 인원(=chat_curmember)" 의 값을 1증가 시키는 것이다. 만약 chat_maxmember 보다 큰값으로 update되려고 하면,  update되지 않게 해놨다.
	//그러므로, chat_maxmember보다 작으면서 값이 증가하면 반환값이 1일 테고, 아니면 0이다. 그리고 0일 때 throw new Exception() 을 해서 rollback 을 시킨다.
	public int plusChatUserNum(@Param("chatroom_num") Integer chatroom_num,@Param("select") Integer select);
	
	
	//19.08.02  채팅 방을 나갔을 때 필요한 sql 작성

	//chat_user_tb에서 해당 채팅방의 특정 user_num을 지운다.
	public int deleteChatUser(@Param("chatroom_num") int chatroom_num, @Param("user_num") int user_num, @Param("select") int select);
	
	//change_tb에서 curmember 의 갯수를 감소 시킨다.
	//chat_status를 1->0으로 바꾸는 것은 CHANGE_TB_CHATSTATUS_TRIGGER 로 해결
	public int minusChatUserNum(@Param("chatroom_num") Integer chatroom_num,@Param("select") Integer select);
	
	
	
	
	
}




