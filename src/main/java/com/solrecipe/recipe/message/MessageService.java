package com.solrecipe.recipe.message;

import java.util.List;

public interface MessageService {
	List<MessageVO> getList(int user_num	, int page);
	int sendMsg(MessageVO vo);
	MessageVO getDetailMsg(int message_num);
	int answerMsg(MessageVO vo);
}
