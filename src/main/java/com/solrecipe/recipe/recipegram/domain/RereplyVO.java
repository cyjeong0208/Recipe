package com.solrecipe.recipe.recipegram.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class RereplyVO {
	int recipegram_rereply_num;
	int recipegram_reply_num;
	int user_num;
	int recipegram_num;
	String recipegram_rereply_content;
	Date firstdate;
	Date updatedate;
	private String user_nickname;
	
   
}
