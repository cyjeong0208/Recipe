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
	//레시피그램 작성
	int insertRecipegram(RecipegramVO recipegramvo);
	//레시피그램 이미지추가
	int insertRecipegram_img(ImgVO imgvo);
	//레시피그램 해시태그 추가
	void insertRecipegram_hash(HashVO hashvo);
	//레시피그램 수정
	int updateRecipegram(RecipegramVO recipegramvo);
	//레시피그램 삭제
	int deleteRecipegram_hash(int recipegram_num);
	//레시피그램 해시태그 수정
	void updateRecipegram_hash(HashVO hashvo);
	//레시피그램 목록(최신순)
	List<RecipegramVO> recipegramList();
	//레시피그램 무한스크롤 목록(최신순)
	List<RecipegramVO> getRecipegramList(RecipegramCriteria cri);
	//레시피그램 무한스크롤 목록(좋아요순)
	List<RecipegramVO> getRecipegramLike();
	//레시피그램 해시태그 목록
	RecipegramVO getHashList(int recipegram_num);
	//레시피그램 해시태그 개수 (검색에 사용)
	Integer getHashCnt(RecipegramCriteria cri);
	//해시태그로 검색된 레시피그램 목록
	Integer[] getHashrg(@Param("recipe_search") String recipe_search, @Param("startNum") int startNum);
	//레시피그램 무한스크롤 목록(최신순)
	RecipegramVO getMoreNewRecipegram(int Num);
	//레시피그램 무한스크롤 목록(좋아요순)
	RecipegramVO getMoreLikeNewRecipegram(int Num);
	//레시피그램 무한스크롤 목록(회원)
	RecipegramVO getMoreUserNewRecipegram(int Num);
	//레시피그램 댓글 작성
	//void insetReply(ReplyVO replyvo);
	
	List<ReplyVO> selectRecipegramReplyByCode(ReplyVO replyvo);
	//레시피그램 좋아요 개수 추가
	int insertLikecnt(RecipegramVO recipegramvo);
	//레시피그램 좋아요 추가
	int insertLike(Recipegram_likeVO likevo);
	//레시피그램 좋아요 개수 삭제
	int deleteLikecnt(RecipegramVO recipegramvo);
	//레시피그램 좋아요 삭제
	int deleteLike(Recipegram_likeVO likevo);
	//각 회원의 좋아요 레시피그램
	Integer findLike(@Param("user_num")int user_num, @Param("recipegram_num")int recipegram_num);
	//레시피그램 좋아요 목록
	List<Recipegram_likeVO>  getLike(int user_num);
	//레시피그램 좋아요 개수
	List<RecipegramVO> getLikecnt(int recipegram_num);
	//레시피그램 댓글 작성
	int insertReply(ReplyVO replyvo);
	//레시피그램 댓글 목록
	List<ReplyVO> getReplyList(int recipegram_num);
	//레시피그램 대댓글 작성
	int insertRereply(RereplyVO rereplyvo);
	//레시피그램 대댓글 목록
	List<RereplyVO> getRereplyList(int recipegram_reply_num);
	//레시피그램 댓글 삭제
	int deleteReply(int recipegram_reply_num);
	//레시피그램 대댓글 삭제
	int deleteRereply(int recipegram_rereply_num);
	//레시피그램 내용 목록
	List<RecipegramVO> contList(int recipegram_num);
	//레시피그램 이미지 목록
	List<ImgVO> imgList(int recipegram_num);
	//레시피그램 무한스크롤 목록 개수(최신순)
	Integer[] getRownum(int startNum);
	//레시피그램 무한스크롤 목록 개수(좋아요순)
	Integer[] getlikeRownum(int startNum);
	//레시피그램 무한스크롤 목록 개수(회원)
	Integer[] getuserRownum(@Param("user_nickname")String user_nickname,  @Param("startNum")int Num);
	//레시피그램 무한스크롤 목록(회원)
	List<RecipegramVO> rguserList(String user_nickname);
	//레시피그램 삭제
	int deleteRecipegram(int recipegram_num);
	//레시피그램 수정
	List<RecipegramVO> getmodifyRecipegram(int recipegram_num);
	
	List<RecipegramVO> main_rgList();
	//레시피그램 회원 게시물수
	Integer rguserListcnt (String user_nickname);
}

