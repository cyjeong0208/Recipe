package com.solrecipe.recipe.user.mapper;

import com.solrecipe.recipe.user.domain.MemberVO;

public interface MemberMapper {
	public MemberVO read(String user_username);

}
