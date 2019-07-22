package com.solrecipe.recipe.user.domain;

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
	Timestamp firstdate;
	Timestamp updatedate;
	private boolean enabled;
	
	private List<AuthVO> authList;

}
