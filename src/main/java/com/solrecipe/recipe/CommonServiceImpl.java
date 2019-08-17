package com.solrecipe.recipe;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.solrecipe.recipe.user.domain.MemberVO;

@Service
public class CommonServiceImpl implements CommonService{
	
	@Autowired
	private CommonMapper cMapper;
	
	@Override
	public MemberVO getMyVO(String id) {
		return cMapper.getMyVO(id);
	}
}
