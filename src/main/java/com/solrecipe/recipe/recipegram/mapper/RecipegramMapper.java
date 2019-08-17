package com.solrecipe.recipe.recipegram.mapper;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.solrecipe.recipe.recipegram.domain.HashVO;
import com.solrecipe.recipe.recipegram.domain.ImgVO;
import com.solrecipe.recipe.recipegram.domain.RecipegramCriteria;
import com.solrecipe.recipe.recipegram.domain.RecipegramVO;
import com.solrecipe.recipe.recipegram.domain.Recipegram_likeVO;
import com.solrecipe.recipe.recipegram.domain.ReplyVO;
import com.solrecipe.recipe.recipegram.domain.RereplyVO;

public interface RecipegramMapper {
	int insertRecipegram(RecipegramVO recipegramvo);
	int insertRecipegram_img(ImgVO imgvo);
	void insertRecipegram_hash(HashVO hashvo);
	int updateRecipegram(RecipegramVO recipegramvo);
	int deleteRecipegram_hash(int recipegram_num);
	void updateRecipegram_hash(HashVO hashvo);
	
	List<RecipegramVO> recipegramList();
	List<RecipegramVO> getRecipegramList(RecipegramCriteria cri);
	List<RecipegramVO> getRecipegramLike();
	RecipegramVO getHashList(int recipegram_num);
	Integer getHashCnt(RecipegramCriteria cri);
	Integer[] getHashrg(@Param("recipe_search") String recipe_search, @Param("startNum") int startNum);
	
	RecipegramVO getMoreNewRecipegram(int Num);
	RecipegramVO getMoreLikeNewRecipegram(int Num);
	RecipegramVO getMoreUserNewRecipegram(int Num);
	
	void insetReply(ReplyVO replyvo);
	List<ReplyVO> selectRecipegramReplyByCode(ReplyVO replyvo);
	int insertLikecnt(RecipegramVO recipegramvo);
	int insertLike(Recipegram_likeVO likevo);
	int deleteLikecnt(RecipegramVO recipegramvo);
	int deleteLike(Recipegram_likeVO likevo);
	Integer findLike(@Param("user_num")int user_num, @Param("recipegram_num")int recipegram_num);
	List<Recipegram_likeVO>  getLike(int user_num);
	List<RecipegramVO> getLikecnt(int recipegram_num);
	int insertReply(ReplyVO replyvo);
	List<ReplyVO> getReplyList(int recipegram_num);
	int insertRereply(RereplyVO rereplyvo);
	List<RereplyVO> getRereplyList(int recipegram_reply_num);
	int deleteReply(int recipegram_reply_num);
	int deleteRereply(int recipegram_rereply_num);
	
	List<RecipegramVO> contList(int recipegram_num);
	List<ImgVO> imgList(int recipegram_num);
	
	Integer[] getRownum(int startNum);
	Integer[] getlikeRownum(int startNum);
	Integer[] getuserRownum(@Param("user_nickname")String user_nickname,  @Param("startNum")int Num);
	
	List<RecipegramVO> rguserList(String user_nickname);
	
	int deleteRecipegram(int recipegram_num);
	List<RecipegramVO> getmodifyRecipegram(int recipegram_num);
	
	List<RecipegramVO> main_rgList();
	
	Integer rguserListcnt (String user_nickname);
}

