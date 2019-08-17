package com.solrecipe.recipe;

import org.apache.ibatis.annotations.Param;

import com.solrecipe.recipe.user.domain.MemberVO;

public interface CommonMapper {
	MemberVO getMyVO(@Param("id") String id);
}
