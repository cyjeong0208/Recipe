package com.solrecipe.recipe.recipe;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
public class Recipe_basicVO {
	
	Long recipe_num;		//레시피 번호
	String recipe_title;	//레시피 타이틀
	String recipe_img;		//레시피 대표 이미지 URL
	Date firstdate;			//게시한 날짜
	Date updatedate;		//수정한 날짜
	String recipe_food_main;//주재료 
	String recipe_food_suv;//부재료
	int excel;				//xml에서 읽어들인건지 아닌지를 구별
	int user_num;
	String user_nickname;
	
	public Recipe_basicVO() {
		
	}
	
	
}
