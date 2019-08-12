package com.solrecipe.recipe.user.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.solrecipe.recipe.user.domain.AuthVO;
import com.solrecipe.recipe.user.domain.MemberVO;
import com.solrecipe.recipe.user.mapper.UserMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
public class UserServiceImpl implements UserService{

	@Autowired
	private UserMapper userMapper;
	@Setter(onMethod_ = @Autowired)
	private PasswordEncoder pwencoder;

	
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
	
	@Override
	public MemberVO getUser(String user_username) {
		
		MemberVO user = new MemberVO();
		
		user = userMapper.getUser(user_username);
		
		return user;
	}

	@Override
	public MemberVO getPublic(String user_nickname) {
		// TODO Auto-generated method stub
		MemberVO user = new MemberVO();
		
		user = userMapper.getPublic(user_nickname);
		
		System.out.println(user);
		
		return user;
	}

	@Override
	public int insertProfile(MemberVO membervo) {
		// TODO Auto-generated method stub
		return userMapper.insertProfile(membervo);
	}

	@Override
	public int chkNickname(String user_nickname) {
		// TODO Auto-generated method stub
		Integer chk = userMapper.chkNickname(user_nickname);
		
		if(chk == null) {
			return 0;
		}
		return chk;
	}

	@Override
	public int chkName(String user_username, String user_name) {
		// TODO Auto-generated method stub
		Integer user_chk = userMapper.chkUsername(user_username);
		Integer name_chk = userMapper.chkName(user_name);
		log.info("user : " + user_chk + " name : " + name_chk);
		//이메일이 없엉... 
		if(user_chk == null) {
			return 1;
		}else if(name_chk == null) {
			return -1;
		}
		return 0;
	}
	
	@Override
	public int newPw(String user_username, String user_pw) {
		// TODO Auto-generated method stub
		String enpw = pwencoder.encode(user_pw);
		Integer user_chk = userMapper.newPw(user_username, enpw);
		log.info("user : " + user_chk );
		
		//실패
		if(user_chk == null) {
			return 1;
		}
		return 0;
	}

	@Override
	public int chkKakaouser(String kakao_user) {
		// TODO Auto-generated method stub
		Integer chkKakao = userMapper.chkKakaouser(kakao_user);
		
		//없어엉  
		if(chkKakao == null) {
			return 0;
		}
		
		return chkKakao;
	}

	@Override
	public int kakaoMember(MemberVO memberVO) {
		// TODO Auto-generated method stub
		log.info("imply kakaousername : " + memberVO.getUser_username());
		return userMapper.kakaoMember(memberVO);
	}

	
	
}
