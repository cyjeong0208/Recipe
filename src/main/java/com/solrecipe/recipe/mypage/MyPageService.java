package com.solrecipe.recipe.mypage;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.solrecipe.recipe.recipe.Recipe_basicVO;
import com.solrecipe.recipe.recipegram.domain.ImgVO;
import com.solrecipe.recipe.recipegram.domain.RecipegramVO;
import com.solrecipe.recipe.recipegram.domain.Recipegram_likeVO;
import com.solrecipe.recipe.recipegram.domain.ReplyVO;
import com.solrecipe.recipe.recipegram.domain.RereplyVO;
import com.solrecipe.recipe.user.domain.MemberVO;

public interface MyPageService {
	//관수
	ArrayList<MyVideoVO>getMarkedVideos(int user_num);
	ArrayList<MyVideoVO>getMoreVideos(int user_num, int startNum);
	int updateProfile(MemberVO myVO);

	int checkNickname(String user_nickname);

	boolean checkPW(String user_pw, int user_num);
	
	ArrayList<Recipe_basicVO> getMyRecipe(int user_num);
	int getUserNumById(String user_id);
	
	//상언 - 190814 추가 - "/myPage_mark" 관련 
	ArrayList<Recipe_basicVO> getMarkedRecipes(int user_num);
	ArrayList<Recipe_basicVO> getMoreRecipes(int user_num, int startNum);
	
}
