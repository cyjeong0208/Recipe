package com.solrecipe.recipe.mypage;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.solrecipe.recipe.recipe.Recipe_basicVO;
import com.solrecipe.recipe.recipegram.domain.HashVO;
import com.solrecipe.recipe.recipegram.domain.ImgVO;
import com.solrecipe.recipe.recipegram.domain.RecipegramVO;
import com.solrecipe.recipe.recipegram.domain.Recipegram_likeVO;
import com.solrecipe.recipe.recipegram.domain.ReplyVO;
import com.solrecipe.recipe.recipegram.domain.RereplyVO;
import com.solrecipe.recipe.user.domain.MemberVO;

import lombok.Setter;

@Service
public class MyPageServiceImpl implements MyPageService{

	@Autowired
	private MyPageMapper myPageMapper;

	@Setter(onMethod_ = @Autowired)
	private PasswordEncoder pwencoder;
	
	// 관수
	@Override
	public ArrayList<MyVideoVO> getMarkedVideos(int user_num) {
		return myPageMapper.getMarkedVideos(user_num);
	}
	
	@Override
	public ArrayList<MyVideoVO> getMoreVideos(int user_num, int startNum) {
		return myPageMapper.getMoreVideos(user_num, startNum);
	}

	@Override
	public int updateProfile(MemberVO myVO) {
		int result = 0;
		// 암호입력이 되어있는 경우에만 modify
		if(!(myVO.getUser_pw().equals(""))) {
			result += myPageMapper.modifyPW(myVO.getUser_num(), myVO.getUser_pw());
		}
		result += myPageMapper.updateProfile_tb(myVO.getUser_num(), myVO.getUser_intro(), myVO.getUser_img(), myVO.getIsopen());
		result += myPageMapper.updateDetail_tb(myVO.getUser_num(), myVO.getUser_nickname(), myVO.getUser_name());
		
		return result;
	}

	@Override
	public int checkNickname(String user_nickname) {
		return myPageMapper.checkNickname(user_nickname);
	}

	@Override
	public boolean checkPW(String user_pw, int user_num) {
		String enpw = myPageMapper.getENPW(user_num);
		return pwencoder.matches(user_pw, enpw);
	}

	@Override
	public ArrayList<Recipe_basicVO> getMyRecipe(int user_num) {
		return myPageMapper.getMyRecipe(user_num);
	}

	@Override
	public int getUserNumById(String user_id) {
		return myPageMapper.getUserNumById(user_id);
	}

	//190814 추가.
	@Override
	public ArrayList<Recipe_basicVO> getMarkedRecipes(int user_num) {
		return myPageMapper.getMarkedRecipes(user_num);
	}

	@Override
	public ArrayList<Recipe_basicVO> getMoreRecipes(int user_num, int startNum) {
		return myPageMapper.getMoreRecipes(user_num, startNum);
	}
	
	
	
	
}
