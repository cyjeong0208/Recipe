package com.solrecipe.recipe.user.service;



import com.solrecipe.recipe.user.domain.AuthVO;
import com.solrecipe.recipe.user.domain.MemberVO;


public interface UserService{
	
	public int insertMember(MemberVO memberVO);
	public int insertMail(MemberVO memberVO);
	public int updatePW(MemberVO memberVO);
	public int insertAuth(AuthVO authVO);
	public int confirmUser(String user_username);
	public MemberVO getUser(String usuer_username);
	public MemberVO getPublic(String user_nickname);
	public int insertProfile(MemberVO membervo);
	public int chkNickname(String user_nickname);
	public int chkName(String user_username, String user_name);
	public int newPw(String user_username, String user_pw);
	public int chkKakaouser(String kakao_user);
	public int kakaoMember(MemberVO memberVO);
	
}
