package com.solrecipe.recipe.user.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

import com.solrecipe.recipe.user.domain.MemberVO;
import com.solrecipe.recipe.user.mapper.UserMapper;
import com.solrecipe.recipe.user.security.domain.CustomUser;


@Log4j
public class CustomUserDetailsService implements UserDetailsService{

	@Setter(onMethod_ = {@Autowired})
	private UserMapper memberMapper;
	
	@Override
	public UserDetails loadUserByUsername(String username)throws UsernameNotFoundException{
		log.warn("Load User By UserName : " + username);
		
		MemberVO vo = memberMapper.read(username);
		
		log.warn("queried by member mapper : " + vo);
		
		return vo == null ?  null : new CustomUser(vo);
		
	}
}
