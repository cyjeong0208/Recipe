package com.solrecipe.recipe.recipegram.domain;



import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;

import lombok.Data;

@Data
public class RecipegramVO {
	int recipegram_num;
	private String user_nickname;
	String recipegram_content;
	int recipegram_like_cnt;
	Date firstdate;
	Date updatedate;
	int recipegram_secret;
	int user_num;
	
	private List<ImgVO> imgList;
	private List<HashVO> hashList;
	private List<ReplyVO> replyList;
	private List<Recipegram_likeVO> likeList;
}
