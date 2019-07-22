package com.solrecipe.recipe.user.mapper;

import com.solrecipe.recipe.user.domain.AuthVO;
import com.solrecipe.recipe.user.domain.MemberVO;

public interface UserMapper {
	public MemberVO read(String user_username);
	int insertMail(MemberVO membervo);
	int insertMember(MemberVO membervo);
	int updatePW(MemberVO membervo);
	int insertAuth(AuthVO authvo);
	int confirmUser(String user_username);
	

}