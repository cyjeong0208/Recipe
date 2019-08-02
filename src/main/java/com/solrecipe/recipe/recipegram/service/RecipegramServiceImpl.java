package com.solrecipe.recipe.recipegram.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.solrecipe.recipe.recipegram.domain.HashVO;
import com.solrecipe.recipe.recipegram.domain.ImgVO;
import com.solrecipe.recipe.recipegram.domain.RecipegramCriteria;
import com.solrecipe.recipe.recipegram.domain.RecipegramVO;
import com.solrecipe.recipe.recipegram.domain.Recipegram_likeVO;
import com.solrecipe.recipe.recipegram.domain.ReplyVO;
import com.solrecipe.recipe.recipegram.domain.RereplyVO;
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
	public int insertLikecnt(RecipegramVO recipegramvo) {
		// TODO Auto-generated method stub
		
		return recipegramMapper.insertLikecnt(recipegramvo);
	}

	@Override
	public int insertLike(Recipegram_likeVO likevo) {
		// TODO Auto-generated method stub
		return recipegramMapper.insertLike(likevo);
	}

	@Override
	public int deleteLikecnt(RecipegramVO recipegramvo) {
		// TODO Auto-generated method stub
		return recipegramMapper.deleteLikecnt(recipegramvo);
	}

	@Override
	public int deleteLike(Recipegram_likeVO likevo) {
		// TODO Auto-generated method stub
		return recipegramMapper.deleteLike(likevo);
	}

	@Override
	public int findLike(int user_num, int recipegram_num) {
		// TODO Auto-generated method stub
		log.info("service user_num : " + user_num + " recipegram_num : " + recipegram_num);
		Integer user = recipegramMapper.findLike(user_num, recipegram_num);
		
		if(user == null) {
			return -1;
		}
		
		
		return 0;
	}

	@Override
	public List<Recipegram_likeVO>  getLike(int user_num) {
		// TODO Auto-generated method stub
		return recipegramMapper.getLike(user_num);
		
	
	}

	@Override
	public List<RecipegramVO> getLikecnt(int recipegram_num) {
		// TODO Auto-generated method stub
		return recipegramMapper.getLikecnt(recipegram_num);
	}

	@Override
	public int insertReply(ReplyVO replyvo) {
		// TODO Auto-generated method stub
		return recipegramMapper.insertReply(replyvo);
	}

	@Override
	public List<ReplyVO> getReplyList(int recipegram_num) {
		// TODO Auto-generated method stub
		return recipegramMapper.getReplyList(recipegram_num);
	}
	
	@Override
	public int insertRereply(RereplyVO rereplyvo) {
		// TODO Auto-generated method stub
		return recipegramMapper.insertRereply(rereplyvo);
	}
	
	@Override
	public List<RereplyVO> getRereplyList(int recipegram_reply_num) {
		// TODO Auto-generated method stub
		return recipegramMapper.getRereplyList(recipegram_reply_num);
	}

	@Override
	public int deleteReply(int recipegram_reply_num) {
		// TODO Auto-generated method stub
		return recipegramMapper.deleteReply(recipegram_reply_num);
	}

	@Override
	public int deleteRereply(int recipegram_rereply_num) {
		// TODO Auto-generated method stub
		return recipegramMapper.deleteRereply(recipegram_rereply_num);
	}

	@Override
	public List<RecipegramVO> contList(int recipegram_num) {
		
		return recipegramMapper.contList(recipegram_num);
	}

	@Override
	public List<ImgVO> imgList(int recipegram_num) {
		// TODO Auto-generated method stub
		return recipegramMapper.imgList(recipegram_num);
	}
	
	
	
}
