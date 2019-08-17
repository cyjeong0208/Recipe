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
import com.solrecipe.recipe.user.mapper.UserMapper;

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
	public int updateRecipegram(RecipegramVO recipegramvo) {
		// TODO Auto-generated method stub
		int result = recipegramMapper.updateRecipegram(recipegramvo);
		
		return recipegramMapper.updateRecipegram(recipegramvo);
	}

	public void updateRecipegram_hash(String[] hashTag, RecipegramVO recipegramvo) {
		// TODO Auto-generated method stub
	
		int result = recipegramMapper.deleteRecipegram_hash(recipegramvo.getRecipegram_num());
		
		if(result !=0 ) {
			
			for(int i=0; i<hashTag.length; i++) {
				HashVO hash = new HashVO();
				hash.setRecipegram_num(recipegramvo.getRecipegram_num());
				hash.setHash_name(hashTag[i]);
				
				recipegramMapper.updateRecipegram_hash(hash);
			}
		}
	}
	
	@Override
	public List<RecipegramVO> rgListWithSearch(RecipegramCriteria cri) {

		Integer hash_cnt = recipegramMapper.getHashCnt(cri);
		List<RecipegramVO> more_recipe = new ArrayList<RecipegramVO>();
		log.info("hs_cnt : " + hash_cnt);
		
		int startNum = 0;
		//hash로 검색 
		//조건.. 제발 ㅠ
		
		if(cri.getRecipe_search() != null  &&hash_cnt != 0) {
			log.info("검");
			log.info(cri);
		
				Integer[] rg_num = recipegramMapper.getHashrg(cri.getRecipe_search(), startNum);
			
				for(int i=0; i<rg_num.length; i++) {
					log.info("rg_num : " + rg_num[i]);
					more_recipe.add(recipegramMapper.getHashList(rg_num[i]));
				}
			
			return more_recipe;
		}
		
		
		Integer[] rownum = recipegramMapper.getRownum(startNum);
		for(int i=0; i<rownum.length; i++) {
			log.info("무 ");
			more_recipe.add(recipegramMapper.getMoreLikeNewRecipegram(rownum[i]));
			
			
		}
		
		log.info("for : "+more_recipe);
		
		return more_recipe;
	}

	@Override
	public List<RecipegramVO> getRecipegramLike(RecipegramCriteria cri) {
		// TODO Auto-generated method stub
		
		Integer hash_cnt = recipegramMapper.getHashCnt(cri);
	
		List<RecipegramVO> more_recipe = new ArrayList<RecipegramVO>();

		//hash로 검색 
		//조건.. 제발 ㅠ
		int startNum = 0;
		if(cri.getRecipe_search() != null  &&hash_cnt != 0) {
			log.info("검");
			
			Integer[] rg_num = recipegramMapper.getHashrg(cri.getRecipe_search(), startNum);
			
				for(int i=0; i<rg_num.length; i++) {
					more_recipe.add(recipegramMapper.getHashList(rg_num[i]));
				}
			
			return more_recipe;
			
		}
		
		
		Integer[] rownum = recipegramMapper.getlikeRownum(startNum);
		for(int i=0; i<rownum.length; i++) {
			log.info("무 ");
			more_recipe.add(recipegramMapper.getMoreLikeNewRecipegram(rownum[i]));
			log.info("please" + i);
			log.info(more_recipe);
			
		}
		
		log.info("for : "+more_recipe);
		
		return more_recipe;
	}

//	@Override
//	public List<RecipegramVO> getMoreNewRecipegram(int startNum) {
//		return recipegramMapper.getMoreNewRecipegram(startNum);
//	}

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
		
		List<ReplyVO> a = recipegramMapper.getReplyList(recipegram_num);
		for(int i=0; i<a.size(); i++) {
			log.info("rereply : " +a.get(i).getRereplyList());
		}
		
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

	@Override
	public List<RecipegramVO>  getRownum(String recipe_search, int startNum) {
		// TODO Auto-generated method stub
		RecipegramCriteria cri = new RecipegramCriteria();
		cri.setRecipe_search(recipe_search);
		Integer hash_cnt = recipegramMapper.getHashCnt(cri);
		List<RecipegramVO> more_recipe = new ArrayList<RecipegramVO>();
		if(recipe_search != null  &&hash_cnt != 0) {
			if(hash_cnt/3 >= startNum) {
				Integer[] rg_num = recipegramMapper.getHashrg(recipe_search, startNum);
				
				for(int i=0; i<rg_num.length; i++) {
					more_recipe.add(recipegramMapper.getHashList(rg_num[i]));
				}
			}
			return more_recipe;
		}
		
		Integer[] rownum = recipegramMapper.getRownum(startNum);
		for(int i=0; i<rownum.length; i++) {
			more_recipe.add(recipegramMapper.getMoreNewRecipegram(rownum[i]));
			
		}
		
		
		return more_recipe;
	}

	@Override
	public List<RecipegramVO> getlikeRownum(String recipe_search, int startNum) {
		// TODO Auto-generated method stub
				RecipegramCriteria cri = new RecipegramCriteria();
				cri.setRecipe_search(recipe_search);
				Integer hash_cnt = recipegramMapper.getHashCnt(cri);
				List<RecipegramVO> more_recipe = new ArrayList<RecipegramVO>();
				if(recipe_search != null  &&hash_cnt != 0) {
					if(hash_cnt/3 >= startNum) {
						Integer[] rg_num = recipegramMapper.getHashrg(recipe_search, startNum);
						
						for(int i=0; i<rg_num.length; i++) {
							more_recipe.add(recipegramMapper.getHashList(rg_num[i]));
						}
					}
					return more_recipe;
				}
				
				Integer[] rownum = recipegramMapper.getlikeRownum(startNum);
				for(int i=0; i<rownum.length; i++) {
					more_recipe.add(recipegramMapper.getMoreLikeNewRecipegram(rownum[i]));
					
				}
				
				
				return more_recipe;
	}
	
	@Override
	public List<RecipegramVO> getuserRownum(String user_nickname, int startNum) {
		// TODO Auto-generated method stub
				
				List<RecipegramVO> more_recipe = new ArrayList<RecipegramVO>();
				
				
				Integer[] rownum = recipegramMapper.getuserRownum(user_nickname, startNum);
				for(int i=0; i<rownum.length; i++) {
					log.info(rownum[i]);
					more_recipe.add(recipegramMapper.getMoreUserNewRecipegram(rownum[i]));
					
				}
				
				log.info("start : " + startNum );
				
				
				return more_recipe;
	}

	@Override
	public List<RecipegramVO> rguserList(String user_nickname) {
		// TODO Auto-generated method stub
		
		int startNum = 0;

		List<RecipegramVO> more_recipe = new ArrayList<RecipegramVO>();
		
		
		Integer[] rownum = recipegramMapper.getuserRownum(user_nickname, startNum);
		for(int i=0; i<rownum.length; i++) {
			more_recipe.add(recipegramMapper.getMoreUserNewRecipegram(rownum[i]));
			
		}
		
		log.info("start : " + startNum );
		
		return more_recipe;
	}

	@Override
	public int deleteRecipegram(int recipegram_num) {
		// TODO Auto-generated method stub
		return recipegramMapper.deleteRecipegram(recipegram_num);
	}

	@Override
	public List<RecipegramVO> getmodifyRecipegram(int recipegram_num) {
		// TODO Auto-generated method stub
		return recipegramMapper.getmodifyRecipegram(recipegram_num);
	}
	
	@Override
	   public List<RecipegramVO> main_rgList() {
	      // TODO Auto-generated method stub
	      return recipegramMapper.main_rgList();
	   }

	@Override
	public int rguserListcnt(String user_nickname) {
		// TODO Auto-generated method stub
		Integer cnt = recipegramMapper.rguserListcnt(user_nickname);
		if(cnt == null) {
			return 0;
		}
		return cnt;
	}
	
	
}
