package com.solrecipe.recipe.recipegram.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class RereplyVO {
	int recipegram_rereply_num;
	int recipegram_reply_num;
	int rere_user_num;
	int recipegram_num;
	String recipegram_rereply_content;
	Date firstdate;
	Date updatedate;
	String rere_user_nickname;
	
   
}
