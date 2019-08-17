package com.solrecipe.recipe.mypage;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.solrecipe.recipe.recipe.Recipe_basicVO;

public interface MyPageMapper {
	ArrayList<MyVideoVO>getMarkedVideos(@Param("userNum")int user_num);
	ArrayList<MyVideoVO>getMoreVideos(@Param("userNum")int user_num, @Param("startNum")int startNum);
	int modifyPW(@Param("userNum")int userNum, @Param("userPW")String userPW);
	int updateProfile_tb(@Param("userNum")int userNum, @Param("userIntro")String userIntro, @Param("userImg")String userImg, @Param("isOpen")int isOpen);
	int updateDetail_tb(@Param("userNum")int userNum, @Param("userNickname")String userNickname, @Param("userName")String userName);
	int checkNickname(@Param("userNickname")String userNickname);
	String getENPW(@Param("userNum")int userNum);
	
	// 190813 myPage_recipe에 쓰일 것들.
	ArrayList<Recipe_basicVO> getMyRecipe(@Param("user_num")int user_num);
	int getUserNumById(@Param("user_id")String user_id);
	
	//190814 myPage_mark 에서 recipe 찜한 것들 불러 모으기 위한 쿼리와 메서드
	ArrayList<Recipe_basicVO> getMarkedRecipes(@Param("userNum")int user_num);
	ArrayList<Recipe_basicVO> getMoreRecipes(@Param("userNum")int user_num, @Param("startNum")int startNum);
}
