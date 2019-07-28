package com.solrecipe.recipe.recipegram.service;

import java.util.List;

import org.springframework.stereotype.Service;


import com.solrecipe.recipe.recipegram.domain.ImgVO;
import com.solrecipe.recipe.recipegram.domain.RecipegramCriteria;
import com.solrecipe.recipe.recipegram.domain.RecipegramVO;
import com.solrecipe.recipe.recipegram.domain.ReplyVO;


public interface RecipegramService {
	public int insertRecipegram(RecipegramVO recipegramvo);
	public void insertRecipegram_img(List<String> list, RecipegramVO recipegramvo);
	public void insertRecipegram_hash(String[] hashTag, RecipegramVO recipegramvo);
	public List<RecipegramVO> rgListWithSearch(RecipegramCriteria cri);
	public List<RecipegramVO> getRecipegramLike();
	public List<RecipegramVO> getMoreNewRecipegram(int startNum);
	public void insetReply(ReplyVO replyvo);
	public List<ReplyVO> selectRecipegramReplyByCode(ReplyVO replyvo);
	
}
