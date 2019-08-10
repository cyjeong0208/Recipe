package com.solrecipe.recipe.my.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.solrecipe.recipe.recipegram.domain.HashVO;
import com.solrecipe.recipe.recipegram.domain.ImgVO;
import com.solrecipe.recipe.recipegram.domain.RecipegramVO;
import com.solrecipe.recipe.recipegram.domain.Recipegram_likeVO;
import com.solrecipe.recipe.recipegram.domain.ReplyVO;
import com.solrecipe.recipe.recipegram.domain.RereplyVO;

public interface MypageMapper {

	Integer[] getRownum(int startNum);
	RecipegramVO getMoreNewRecipegram(int Num);
	
	int updateRecipegram(RecipegramVO recipegramvo);
	int deleteRecipegram_hash(int recipegram_num);
	void updateRecipegram_hash(HashVO hashvo);
	
	List<RecipegramVO> contList(int recipegram_num);
	List<ImgVO> imgList(int recipegram_num);
	
	List<RecipegramVO> rgList(String user_nickname);
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
	
	int deleteRecipegram(int recipegram_num);
	
}
