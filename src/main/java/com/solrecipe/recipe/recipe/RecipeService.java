package com.solrecipe.recipe.recipe;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import lombok.Setter;

@Service
public class RecipeService {
	
	@Setter(onMethod_ = @Autowired)
	private RecipeMapper mapper;
	
	@Autowired
	private PlatformTransactionManager manager;
	
	public Long getRecipeNum() {
		return mapper.getRecipeNum();
	}
	
	public List<Recipe_basicVO> getAll_RECIPE_EXCEL(){
		return mapper.getAll_RECIPE_EXCEL();
	}
	
	public List<Recipe_basicVO> getAll_RECIPE(){
		return mapper.getAll_RECIPE();
	}
	
	public List<Recipe_basicVO> searchEXCEL_RECIPE(String[] ingredients){
		return mapper.searchEXCEL_RECIPE(ingredients);
	}
	
	
	public List<Recipe_basicVO> search_RECIPE(String[] ingredients){
		return mapper.search_RECIPE(ingredients);
	}
	
	public int insertRecipe(Recipe_basicVO basic) {
		return mapper.insertRecipe(basic);
	}
	
	public int insertCooking(Recipe_CookingVO cooking) {
		return mapper.insertCooking(cooking);
	}
	
	public Recipe_basicVO getRecipeDetail(Long recipe_num,Integer excel) {
			
		Recipe_basicVO vo = mapper.getRecipeDetail(recipe_num, excel);
		
		String recipe_food_main = vo.getRecipe_food_main();
		String[] main_Array = recipe_food_main.split(",");
		recipe_food_main = "";
		for (String string : main_Array) {
			recipe_food_main += string+", ";
		}
		vo.setRecipe_food_main(recipe_food_main.substring(0,recipe_food_main.length()-2));
		
		
		if(!(vo.getRecipe_food_suv() == null || vo.getRecipe_food_suv().length()==0)) { 
			
			String recipe_food_suv = vo.getRecipe_food_suv();
			String[] suv_Array = recipe_food_suv.split(",");
			recipe_food_suv = "";
			for (String string : suv_Array) {
				recipe_food_suv += string+", ";
			}
			vo.setRecipe_food_suv(recipe_food_suv.substring(0,recipe_food_suv.length()-2));
			
		} else {
			vo.setRecipe_food_suv("없음");
		}
		
		return vo;
		
	}
	
	public List<Recipe_CookingVO> getCookingDetail(Long recipe_num,Integer excel) {
		return mapper.getCookingDetail(recipe_num, excel);
	}
	
	
	public String getUserNickName(String user_username) {
		return mapper.getUserNickName(user_username);
	}
	
	
	//레시피 수정 관련
	public int updateRecipeBasic(Recipe_basicVO basic) {
		return mapper.updateRecipeBasic(basic);
	}
	
	public int updateRecipeCooking(Recipe_CookingVO cooking,int excel) {
		return mapper.updateRecipeCooking(cooking,excel);
	}
	
	//레시피 찜하기 관련
	
	
	public int insertMarkRecipe(Recipe_MarkVO mark) {
		
		int result;
		TransactionStatus status = manager.getTransaction(new DefaultTransactionDefinition());
		try {
			result = mapper.insertMarkRecipe(mark);
			manager.commit(status);
		} catch (Exception e) {
			e.printStackTrace();
			manager.rollback(status);
			result = -1;
		} 
		
		return result;
	}
	
	
	
	public int deleteMarkRecipe(Recipe_MarkVO mark) {
		return mapper.deleteMarkRecipe(mark);
	}
	
	public List<Recipe_MarkVO> selectUserMarkRecipe(int user_num) {
		return mapper.selectUserMarkRecipe(user_num);
	}
	
	
	public Integer getUserNumById(String user_id) {
		return mapper.getUserNumById(user_id);
	}
	
	
	public int deleteRecipe(int excel, int recipeNum) {
		int i = mapper.deleteRecipeBasic(excel, recipeNum);
		int j =mapper.deleteRecipeCooking(excel, recipeNum);
		return i+j;
	}
	
}
