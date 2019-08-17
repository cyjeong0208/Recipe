package com.solrecipe.recipe.message;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface MessageMapper {
	
	List<MessageVO> getList(@Param("user_num")int user_num, @Param("startNum")int startNum, @Param("endNum")int endNum);
	String getNickname(int user_num);
	
	int sendMsg(MessageVO vo);
	MessageVO getDetailMsg(int message_num);
	
	int answerMsg(MessageVO vo);
}

