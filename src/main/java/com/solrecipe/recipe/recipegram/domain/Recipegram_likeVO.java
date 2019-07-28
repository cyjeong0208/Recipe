package com.solrecipe.recipe.recipegram.domain;

import lombok.Data;

@Data
//어느 user가 어떤 recipegram에 좋아요를 눌럿는지... 
public class Recipegram_likeVO {
	int recipegram_like_num;
	int recipegram_like;
	int user_num;
	int recipegram_num;
}
