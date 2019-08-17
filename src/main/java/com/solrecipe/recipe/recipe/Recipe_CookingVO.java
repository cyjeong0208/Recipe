package com.solrecipe.recipe.recipe;

public class Recipe_CookingVO {
	
	Long recipe_num;
	Long cooking_num;
	String cooking_content;
	String cooking_img;
	
	public Long getRecipe_num() {
		return recipe_num;
	}
	public void setRecipe_num(Long recipe_num) {
		this.recipe_num = recipe_num;
	}
	public Long getCooking_num() {
		return cooking_num;
	}
	public void setCooking_num(Long cooking_num) {
		this.cooking_num = cooking_num;
	}
	public String getCooking_content() {
		return cooking_content;
	}
	public void setCooking_content(String cooking_content) {
		this.cooking_content = cooking_content;
	}
	public String getCooking_img() {
		return cooking_img;
	}
	public void setCooking_img(String cooking_img) {
		this.cooking_img = cooking_img;
	}
	
	@Override
	public String toString() {
		return "Recipe_CookingVO [recipe_num=" + recipe_num + ", cooking_num=" + cooking_num + ", cooking_content="
				+ cooking_content + ", cooking_img=" + cooking_img + "]";
	}
	
}
