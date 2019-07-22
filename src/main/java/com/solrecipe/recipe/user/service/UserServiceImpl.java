package com.solrecipe.recipe.user.service;


import org.springframework.beans.factory.annotation.Autowired;

import com.solrecipe.recipe.user.domain.AuthVO;
import com.solrecipe.recipe.user.domain.MemberVO;
import com.solrecipe.recipe.user.mapper.UserMapper;

public class UserServiceImpl implements UserService{

	@Autowired
	private UserMapper userMapper;
	
	
	@Override
	public int insertMail(MemberVO memberVO) {
		return userMapper.insertMail(memberVO);
	}

	@Override
	public int insertMember(MemberVO memberVO) {
		// TODO Auto-generated method stub
		return userMapper.insertMember(memberVO);
	}

	@Override
	public int updatePW(MemberVO memberVO) {
		// TODO Auto-generated method stub
		return userMapper.updatePW(memberVO);
	}
	
	@Override
	public int insertAuth(AuthVO authVO){
		return userMapper.insertAuth(authVO);
	}
	
	@Override
	public int confirmUser(String user_username) {
		return userMapper.confirmUser(user_username);
	}
	
	
}
