package com.solrecipe.recipe.recipegram.domain;

import java.sql.Date;
import java.util.List;

import lombok.Data;

@Data
public class ReplyVO {
	int recipegram_reply_num;
	int recipegram_num;
	int user_num;
	String recipegram_reply_content;
	Date firstdate;
	Date updatedate;
	String user_nickname;
	
	private List<RereplyVO> rereplyList;   
}
