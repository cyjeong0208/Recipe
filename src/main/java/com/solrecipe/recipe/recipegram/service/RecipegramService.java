package com.solrecipe.recipe.recipegram.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;


import com.solrecipe.recipe.recipegram.domain.ImgVO;
import com.solrecipe.recipe.recipegram.domain.RecipegramCriteria;
import com.solrecipe.recipe.recipegram.domain.RecipegramVO;
import com.solrecipe.recipe.recipegram.domain.Recipegram_likeVO;
import com.solrecipe.recipe.recipegram.domain.ReplyVO;
import com.solrecipe.recipe.recipegram.domain.RereplyVO;


public interface RecipegramService {
	public int insertRecipegram(RecipegramVO recipegramvo);
	public void insertRecipegram_img(List<String> list, RecipegramVO recipegramvo);
	public void insertRecipegram_hash(String[] hashTag, RecipegramVO recipegramvo);
	public List<RecipegramVO> rgListWithSearch(RecipegramCriteria cri);
	public List<RecipegramVO> getRecipegramLike(RecipegramCriteria cri);
	//public List<RecipegramVO> getMoreNewRecipegram(int startNum);
	public int insertLikecnt(RecipegramVO recipegramvo);
	public int insertLike(Recipegram_likeVO likevo);
	public int deleteLikecnt(RecipegramVO recipegramvo);
	public int deleteLike(Recipegram_likeVO likevo);
	public int findLike(int user_num, int recipegram_num);
	public List<Recipegram_likeVO>  getLike(int user_num);
	public List<RecipegramVO> getLikecnt(int recipegram_num);
	public int insertReply(ReplyVO replyvo);
	public List<ReplyVO> getReplyList(int recipegram_num);
	public int insertRereply(RereplyVO rereplyvo);
	public List<RereplyVO> getRereplyList(int recipegram_reply_num);
	public int deleteReply(int recipegram_reply_num);
	public int deleteRereply(int recipegram_rereply_num);
	public List<RecipegramVO> contList(int recipegram_num);
	public List<ImgVO> imgList(int recipegram_num);
	public List<RecipegramVO>  getRownum(String recipe_search, int startNum);
	public List<RecipegramVO>  getlikeRownum(String recipe_search,int startNum);
	public List<RecipegramVO>  getuserRownum(String user_nickname,int startNum);
	public List<RecipegramVO> rguserList(String user_nickname);
	public int deleteRecipegram(int recipegram_num);
	public List<RecipegramVO> getmodifyRecipegram(int recipegram_num);

	public int updateRecipegram(RecipegramVO recipegramvo);
	public void updateRecipegram_hash(String[] hashTag, RecipegramVO recipegramvo);
	
	public List<RecipegramVO> main_rgList();
	
	public int rguserListcnt(String user_nickname);
}
