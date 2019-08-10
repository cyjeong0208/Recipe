package com.solrecipe.recipe.my.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.solrecipe.recipe.my.mapper.MypageMapper;
import com.solrecipe.recipe.recipegram.domain.HashVO;
import com.solrecipe.recipe.recipegram.domain.ImgVO;
import com.solrecipe.recipe.recipegram.domain.RecipegramCriteria;
import com.solrecipe.recipe.recipegram.domain.RecipegramVO;
import com.solrecipe.recipe.recipegram.domain.Recipegram_likeVO;
import com.solrecipe.recipe.recipegram.domain.ReplyVO;
import com.solrecipe.recipe.recipegram.domain.RereplyVO;

import lombok.extern.log4j.Log4j;

@Log4j
public class MypageServiceImpl implements MypageService{

	
	@Autowired
	private MypageMapper mypageMapper;
	
	@Override
	public List<RecipegramVO> contList(int recipegram_num) {
		
		return mypageMapper.contList(recipegram_num);
	}

	@Override
	public List<ImgVO> imgList(int recipegram_num) {
		// TODO Auto-generated method stub
		return mypageMapper.imgList(recipegram_num);
	}
	
	@Override
	public List<RecipegramVO> rgList(String user_nickname) {
		// TODO Auto-generated method stub
		List<RecipegramVO> more_recipe = new ArrayList<RecipegramVO>();
		
		int startNum = 0;
		//hash로 검색 
		//조건.. 제발 ㅠ
		
		return mypageMapper.rgList(user_nickname);
		
		
//		
//		Integer[] rownum = mypageMapper.getRownum(startNum);
//		for(int i=0; i<rownum.length; i++) {
//			log.info("무 ");
//			more_recipe.add(mypageMapper.getMoreLikeNewRecipegram(rownum[i]));
//			
//			
//		}
//		
//		log.info("for : "+more_recipe);
//		
//		return more_recipe;
	}
	
//	@Override
//	public void insertRecipegram_img(List<String> list, RecipegramVO recipegramvo) {
//		// TODO Auto-generated method stub
//		for(int i=0; i<list.size(); i++) {
//			ImgVO img = new ImgVO();
//			img.setRecipegram_num(recipegramvo.getRecipegram_num());
//			img.setImg_name(list.get(i));
//			mypageMapper.insertRecipegram_img(img);
//		}
//	}
//
//	@Override
//	public void insertRecipegram_hash(String[] hashTag, RecipegramVO recipegramvo) {
//		// TODO Auto-generated method stub
//	
//		for(int i=0; i<hashTag.length; i++) {
//			HashVO hash = new HashVO();
//			hash.setRecipegram_num(recipegramvo.getRecipegram_num());
//			hash.setHash_name(hashTag[i]);
//			mypageMapper.insertRecipegram_hash(hash);
//		}
//	}
	
	@Override
	public int updateRecipegram(RecipegramVO recipegramvo) {
		// TODO Auto-generated method stub
		int result = mypageMapper.updateRecipegram(recipegramvo);
		
		return mypageMapper.updateRecipegram(recipegramvo);
	}

	public void updateRecipegram_hash(String[] hashTag, RecipegramVO recipegramvo) {
		// TODO Auto-generated method stub
	
		int result = mypageMapper.deleteRecipegram_hash(recipegramvo.getRecipegram_num());
		
		if(result !=0 ) {
			
			for(int i=0; i<hashTag.length; i++) {
				HashVO hash = new HashVO();
				hash.setRecipegram_num(recipegramvo.getRecipegram_num());
				hash.setHash_name(hashTag[i]);
				
				mypageMapper.updateRecipegram_hash(hash);
			}
		}
	}
	
	@Override
	public int insertLikecnt(RecipegramVO recipegramvo) {
		// TODO Auto-generated method stub
		
		return mypageMapper.insertLikecnt(recipegramvo);
	}

	@Override
	public int insertLike(Recipegram_likeVO likevo) {
		// TODO Auto-generated method stub
		return mypageMapper.insertLike(likevo);
	}

	@Override
	public int deleteLikecnt(RecipegramVO recipegramvo) {
		// TODO Auto-generated method stub
		return mypageMapper.deleteLikecnt(recipegramvo);
	}

	@Override
	public int deleteLike(Recipegram_likeVO likevo) {
		// TODO Auto-generated method stub
		return mypageMapper.deleteLike(likevo);
	}

	@Override
	public int findLike(int user_num, int recipegram_num) {
		// TODO Auto-generated method stub
		Integer user = mypageMapper.findLike(user_num, recipegram_num);
		
		if(user == null) {
			return -1;
		}
		
		
		return 0;
	}

	@Override
	public List<Recipegram_likeVO>  getLike(int user_num) {
		// TODO Auto-generated method stub
		return mypageMapper.getLike(user_num);
		
	
	}

	@Override
	public List<RecipegramVO> getLikecnt(int recipegram_num) {
		// TODO Auto-generated method stub
		return mypageMapper.getLikecnt(recipegram_num);
	}

	@Override
	public int insertReply(ReplyVO replyvo) {
		// TODO Auto-generated method stub
		return mypageMapper.insertReply(replyvo);
	}

	@Override
	public List<ReplyVO> getReplyList(int recipegram_num) {
		// TODO Auto-generated method stub
		
		List<ReplyVO> a = mypageMapper.getReplyList(recipegram_num);
		for(int i=0; i<a.size(); i++) {
			log.info("rereply : " +a.get(i).getRereplyList());
		}
		
		return mypageMapper.getReplyList(recipegram_num);
	}
	
	@Override
	public int insertRereply(RereplyVO rereplyvo) {
		// TODO Auto-generated method stub
		return mypageMapper.insertRereply(rereplyvo);
	}
	
	@Override
	public List<RereplyVO> getRereplyList(int recipegram_reply_num) {
		// TODO Auto-generated method stub
		
		return mypageMapper.getRereplyList(recipegram_reply_num);
	}

	@Override
	public int deleteReply(int recipegram_reply_num) {
		// TODO Auto-generated method stub
		return mypageMapper.deleteReply(recipegram_reply_num);
	}

	@Override
	public int deleteRereply(int recipegram_rereply_num) {
		// TODO Auto-generated method stub
		return mypageMapper.deleteRereply(recipegram_rereply_num);
	}
	
	@Override
	public List<RecipegramVO>  getRownum(int startNum) {
		// TODO Auto-generated method stub
		List<RecipegramVO> more_recipe = new ArrayList<RecipegramVO>();
	
		
		Integer[] rownum = mypageMapper.getRownum(startNum);
		for(int i=0; i<rownum.length; i++) {
			more_recipe.add(mypageMapper.getMoreNewRecipegram(rownum[i]));
			
		}
		
		log.info("start : " + startNum );
		
		return more_recipe;
	}
	@Override
	public int deleteRecipegram(int recipegram_num) {
		// TODO Auto-generated method stub
		return mypageMapper.deleteRecipegram(recipegram_num);
	}
	

}
