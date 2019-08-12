package com.solrecipe.recipe.user.domain;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;

import lombok.Data;

@Data
public class MemberVO {
	int user_num;
	String user_username; //아이디 
	String user_pw;
	String user_name;
	
	String user_nickname;
	
	String user_intro;
	String user_img;
	Date firstdate;
	Date updatedate;
	int isopen;
	
	int kakao_login;

	private boolean enabled;
	
	private List<AuthVO> authList;
	
}
