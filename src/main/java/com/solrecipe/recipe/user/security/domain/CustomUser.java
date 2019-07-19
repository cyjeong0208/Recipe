package com.solrecipe.recipe.user.security.domain;

import java.util.Collection;
import java.util.stream.Collectors;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import com.solrecipe.recipe.user.domain.MemberVO;

import lombok.Getter;

@Getter
public class CustomUser extends User{
//UserDetailsService�� loadUserByUsername()��� �ϳ��� �߻�޼��常 ������ ������ ����Ÿ���� org.springframework.security.core.userdetails.UserDetails
//MemberVO�� �ν��Ͻ��� ������ ��ť��Ƽ�� UserDetailsŸ������ ��ȯ�ϴ� �۾� �ʿ�
	private static final long serialVersionUID = 1L;
	private MemberVO member;
	
	public CustomUser(String username, String password, Collection<? extends GrantedAuthority> authorities) {
		super(username, password, authorities);
	}
	
	public CustomUser(MemberVO vo) {
		//AuthVO�ν��Ͻ��� GrantedAuthority��ü�� ��ȯ�ؾ��ϹǷ� stream()�� mpa()�̿��Ͽ� ó��
		super(vo.getUser_username(), vo.getUser_pw(), vo.getAuthList().stream()
				.map(auth -> new SimpleGrantedAuthority(auth.getUser_auth())).collect(Collectors.toList()));
		this.member = vo;
		
	}
}
