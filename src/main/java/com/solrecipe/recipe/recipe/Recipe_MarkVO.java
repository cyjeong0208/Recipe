package com.solrecipe.recipe.recipe;

import java.sql.Date;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class Recipe_MarkVO {
	int markrecipe_num;
	int user_num;
	Date firstdate;
	int excel;
	int recipe_num;
	
	public Recipe_MarkVO(int user_num, int excel, int recipe_num) {
		super();
		this.user_num = user_num;
		this.excel = excel;
		this.recipe_num = recipe_num;
	}
	
}
