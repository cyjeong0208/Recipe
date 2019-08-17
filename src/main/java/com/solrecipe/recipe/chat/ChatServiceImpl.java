package com.solrecipe.recipe.chat;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import com.solrecipe.recipe.user.domain.MemberVO;

import lombok.Setter;

//@Service 대신에 bean을 직접 넣어줬다. 만약 Service를 쓸거면 아래와 같이 해준다.
//@Service(value = "chatService")

//이렇게 하고나서 ChatController에서 @Autowired 하는 곳에서 
//@Setter(onMethod_ = @Autowired)
//private ChatService service;
public class ChatServiceImpl implements ChatService {
	
	@Setter(onMethod_ = @Autowired)
	private ChatMapper mapper;
	
	@Autowired
	private PlatformTransactionManager manager;
	
	/* 관수 */
	@Override
	public List<ChatRoomVO> getChatList(int type, int page,String localSearch, String titleSearch) {
		if("".equals(localSearch)) {localSearch=null;}
		if("".equals(titleSearch)) {titleSearch=null;}
		System.out.println("ChatServiceImpl=>getChatList()=> localSearch: "+localSearch+" / titleSearch: "+titleSearch);
		int startNum = (page-1)*15;
		return mapper.getChatList(type, startNum,localSearch,titleSearch);
	}
	
	
	@Override
	public int getTotalCnt(int type) {
		return mapper.getTotalCnt(type);
	}
	
	@Override
	public MemberVO getMyVO(String id) {
		return mapper.getMyVO(id);
	}
	
	
	/*-----------------------------------------------------*/
	
	/* 상언 */
	@Override
	public int insertChatRoom(ChatRoomVO vo, Integer select) {
		return mapper.insertChatRoom(vo, select);
	}

	@Override
	public int insertUser(ChatUserVO vo, Integer select) {
		return mapper.insertUser(vo, select);
	}

	
	@Override
	public int insertChat(ChatVO vo, Integer select) {
		return mapper.insertChat(vo, select);
	}

	
	@Override
	public int deleteChatRoom(Integer chatroom_num, Integer select) {
		return mapper.deleteChatRoom(chatroom_num, select);
	}

	@Override
	public int makeChatRoom(ChatRoomVO vo, Integer select) {
		
		
		TransactionStatus status = manager.getTransaction(new DefaultTransactionDefinition());
		try {
			insertChatRoom(vo, select);
			manager.commit(status);
		} catch (Exception e) {
			e.printStackTrace();
			manager.rollback(status);
			vo.setChatroom_num(-1);
		} 
		
		return vo.getChatroom_num();
		
	}


	//19.07.29 
	
	@Override
	public List<MemberVO> getChatRoomUsers(Integer chatroom_num, Integer select) {
		return mapper.getChatRoomUsers(chatroom_num, select);
	}


	@Override
	public ChatRoomVO getChatRoomDetail(Integer chatroom_num, Integer select) {
		return mapper.getChatRoomDetail(chatroom_num, select);
	}


	@Override
	public int plusChatUserNum(Integer chatroom_num, Integer select) {
		return mapper.plusChatUserNum(chatroom_num, select);
	}


	
	//19.08.02  채팅 방을 나갔을 때 필요한 sql 작성
	
	@Override
	public int deleteChatUser(int chatroom_num, int user_num, int select) {
		return mapper.deleteChatUser(chatroom_num, user_num, select);
	}
	

	@Override
	public int minusChatUserNum(Integer chatroom_num, Integer select) {
		return mapper.minusChatUserNum(chatroom_num, select);
	}
	
	
	
}
