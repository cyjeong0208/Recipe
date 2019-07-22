package com.solrecipe.recipe.user.service;

import com.solrecipe.recipe.user.domain.AuthVO;
import com.solrecipe.recipe.user.domain.MemberVO;


public interface UserService{
	
	public int insertMember(MemberVO memberVO);
	public int insertMail(MemberVO memberVO);
	public int updatePW(MemberVO memberVO);
	public int insertAuth(AuthVO authVO);
	public int confirmUser(String user_username);
	
}
