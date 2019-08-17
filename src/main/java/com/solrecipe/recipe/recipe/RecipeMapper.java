package com.solrecipe.recipe.recipe;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.junit.runners.Parameterized.Parameters;

public interface RecipeMapper {
	
	public Long getRecipeNum();

	public List<Recipe_basicVO> getAll_RECIPE_EXCEL();

	public List<Recipe_basicVO> getAll_RECIPE();
	
	public List<Recipe_basicVO> searchEXCEL_RECIPE(@Param("ingredients") String[] ingredients);
	
	public List<Recipe_basicVO> search_RECIPE(@Param("ingredients") String[] ingredients);
	
	public int insertRecipe(Recipe_basicVO basic);
	
	public int insertCooking(Recipe_CookingVO cooking);
	
	public Recipe_basicVO getRecipeDetail(@Param("recipe_num") Long recipe_num,@Param("excel") Integer excel);
	
	public List<Recipe_CookingVO> getCookingDetail(@Param("recipe_num") Long recipe_num,@Param("excel") Integer excel);

	public String getUserNickName(@Param("user_username")String user_username);
	
	//190810 추가. Recipe_basicVO에 excel도 있으므로 excel을 따로 추가 X
	//레시피 수정하기 관련
	public int updateRecipeBasic(Recipe_basicVO vo);
	public int updateRecipeCooking(@Param("vo") Recipe_CookingVO vo, @Param("excel") int excel);
	
	//190811 찜하기 관련
	public int insertMarkRecipe(Recipe_MarkVO vo);
	public int deleteMarkRecipe(Recipe_MarkVO vo);
	public List<Recipe_MarkVO> selectUserMarkRecipe(@Param("user_num") int user_num);
	public Integer getUserNumById(@Param("user_id") String user_id);
	
	//관수 추가.
	public int modifyRecipe(Recipe_basicVO basic);
	
	int deleteRecipeBasic(@Param("excel")int excel, @Param("recipe_num")int recipeNum);
	
	int deleteRecipeCooking(@Param("excel")int excel, @Param("recipe_num")int recipeNum);
	
}
