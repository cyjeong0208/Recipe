package com.solrecipe.recipe.user.mapper;

import org.apache.ibatis.annotations.Param;

import com.solrecipe.recipe.user.domain.AuthVO;
import com.solrecipe.recipe.user.domain.MemberVO;

public interface UserMapper {
	public MemberVO read(String user_username);
	int insertMail(MemberVO membervo);
	int insertMember(MemberVO membervo);
	int updatePW(MemberVO membervo);
	int insertAuth(AuthVO authvo);
	int confirmUser(String user_username);
	
	MemberVO getUser(String user_username);
	MemberVO getPublic(String user_nickname);
	int insertProfile(MemberVO membervo);
	Integer chkNickname(String user_nickname);
	Integer chkUsername(String user_username);
	Integer[] chkName(String name);
	Integer chk(@Param(value="user_username") String user_username, @Param(value="user_name") String user_name);
	Integer newPw(@Param(value="user_username") String user_username, @Param(value="user_pw") String user_pw);
	Integer chkKakaouser(String user_username);
	int kakaoMember(MemberVO membervo);
	
	
}