package com.solrecipe.recipe.recipegram.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.solrecipe.recipe.recipegram.domain.HashVO;
import com.solrecipe.recipe.recipegram.domain.ImgVO;
import com.solrecipe.recipe.recipegram.domain.RecipegramCriteria;
import com.solrecipe.recipe.recipegram.domain.RecipegramVO;
import com.solrecipe.recipe.recipegram.domain.ReplyVO;

public interface RecipegramMapper {
	int insertRecipegram(RecipegramVO recipegramvo);
	int insertRecipegram_img(ImgVO imgvo);
	void insertRecipegram_hash(HashVO hashvo);
	List<RecipegramVO> recipegramList();
	List<RecipegramVO> getRecipegramList(RecipegramCriteria cri);
	List<RecipegramVO> getRecipegramLike();
	List<RecipegramVO> getMoreNewRecipegram(int startNum);
	void insetReply(ReplyVO replyvo);
	List<ReplyVO> selectRecipegramReplyByCode(ReplyVO replyvo);
	
}
