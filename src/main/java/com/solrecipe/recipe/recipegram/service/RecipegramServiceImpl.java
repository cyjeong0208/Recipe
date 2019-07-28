package com.solrecipe.recipe.recipegram.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.solrecipe.recipe.recipegram.domain.HashVO;
import com.solrecipe.recipe.recipegram.domain.ImgVO;
import com.solrecipe.recipe.recipegram.domain.RecipegramCriteria;
import com.solrecipe.recipe.recipegram.domain.RecipegramVO;
import com.solrecipe.recipe.recipegram.domain.ReplyVO;
import com.solrecipe.recipe.recipegram.mapper.RecipegramMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j

public class RecipegramServiceImpl implements RecipegramService{

	@Autowired
	private RecipegramMapper recipegramMapper;
	
	
	@Override
	public int insertRecipegram(RecipegramVO recipegramvo) {
		// TODO Auto-generated method stub
		return recipegramMapper.insertRecipegram(recipegramvo);
	}

	@Override
	public void insertRecipegram_img(List<String> list, RecipegramVO recipegramvo) {
		// TODO Auto-generated method stub
		for(int i=0; i<list.size(); i++) {
			ImgVO img = new ImgVO();
			img.setRecipegram_num(recipegramvo.getRecipegram_num());
			img.setImg_name(list.get(i));
			recipegramMapper.insertRecipegram_img(img);
		}
	}

	@Override
	public void insertRecipegram_hash(String[] hashTag, RecipegramVO recipegramvo) {
		// TODO Auto-generated method stub
	
		for(int i=0; i<hashTag.length; i++) {
			HashVO hash = new HashVO();
			hash.setRecipegram_num(recipegramvo.getRecipegram_num());
			hash.setHash_name(hashTag[i]);
			recipegramMapper.insertRecipegram_hash(hash);
		}
	}
	@Override
	public List<RecipegramVO> rgListWithSearch(RecipegramCriteria cri) {

		log.info("recipegramList with criteria: " + cri);

		return recipegramMapper.getRecipegramList(cri);
	}

	@Override
	public List<RecipegramVO> getRecipegramLike() {
		// TODO Auto-generated method stub
		return recipegramMapper.getRecipegramLike();
	}

	@Override
	public List<RecipegramVO> getMoreNewRecipegram(int startNum) {
		return recipegramMapper.getMoreNewRecipegram(startNum);
	}

	@Override
	public void insetReply(ReplyVO replyvo) {
		// TODO Auto-generated method stub
		recipegramMapper.insetReply(replyvo);
	}

	@Override
	public List<ReplyVO> selectRecipegramReplyByCode(ReplyVO replyvo) {
		// TODO Auto-generated method stub
		return recipegramMapper.selectRecipegramReplyByCode(replyvo);
	}
	
}
