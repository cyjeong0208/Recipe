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
	
	//레시피그램 추가
	@Override
	public int insertRecipegram(RecipegramVO recipegramvo) {
		// TODO Auto-generated method stub
		return recipegramMapper.insertRecipegram(recipegramvo);
	}

	//레시피그램 이미지 추가
	@Override
	public void insertRecipegram_img(List<String> list, RecipegramVO recipegramvo) {
		// TODO Auto-generated method stub
		for(int i=0; i<list.size(); i++) {
			ImgVO img = new ImgVO();
			//해당 레시피그램번호
			img.setRecipegram_num(recipegramvo.getRecipegram_num());
			img.setImg_name(list.get(i));
			recipegramMapper.insertRecipegram_img(img);
		}
	}

	//레시피그램 해시태그 추가
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
	
	//레시피그램 수정
	@Override
	public int updateRecipegram(RecipegramVO recipegramvo) {
		// TODO Auto-generated method stub
		//int result = recipegramMapper.updateRecipegram(recipegramvo);
		
		return recipegramMapper.updateRecipegram(recipegramvo);
	}

	//레시피그램 해시태그 수정
	public void updateRecipegram_hash(String[] hashTag, RecipegramVO recipegramvo) {
		// TODO Auto-generated method stub
	
		//먼저 기존 저장되어 있는 해시태그를 삭제
		int result = recipegramMapper.deleteRecipegram_hash(recipegramvo.getRecipegram_num());
		
		//수정된 해시태그로 추가
		if(result !=0 ) {
			
			for(int i=0; i<hashTag.length; i++) {
				HashVO hash = new HashVO();
				hash.setRecipegram_num(recipegramvo.getRecipegram_num());
				hash.setHash_name(hashTag[i]);
				
				recipegramMapper.updateRecipegram_hash(hash);
			}
		}
	}
	
	//레시피그램 최신순 정렬
	@Override
	public List<RecipegramVO> rgListWithSearch(RecipegramCriteria cri) {

		//해당 해시태그가 포함된 레시피그램 개수
		Integer hash_cnt = recipegramMapper.getHashCnt(cri);
		List<RecipegramVO> more_recipe = new ArrayList<RecipegramVO>();
		log.info("hs_cnt : " + hash_cnt);
		
		//무한스크롤 startNum
		int startNum = 0;
		//hash로 검색 
		//조건.. 제발 ㅠ
		//해시태그가 null이 아니고 레시피그램 개수가 0이 아니면... 해시태그를 클릭했을 때
		if(cri.getRecipe_search() != null  &&hash_cnt != 0) {
			log.info("검");
			log.info(cri);
			//무한스크롤 범위만큼의 레시피그램 게시물 번호
				Integer[] rg_num = recipegramMapper.getHashrg(cri.getRecipe_search(), startNum);
			
				for(int i=0; i<rg_num.length; i++) {
					log.info("rg_num : " + rg_num[i]);
					//해당 레시피그램 게시물
					more_recipe.add(recipegramMapper.getHashList(rg_num[i]));
				}
			
			return more_recipe;
		}
		
		//무한스크롤 범위만큼의 레시피그램 게시물 번호   최신순 디폴트 페이지
		Integer[] rownum = recipegramMapper.getRownum(startNum);
		for(int i=0; i<rownum.length; i++) {
			log.info("무 ");
			//해당 레시피그램 게시물
			more_recipe.add(recipegramMapper.getMoreLikeNewRecipegram(rownum[i]));
			
			
		}
		
		log.info("for : "+more_recipe);
		
		return more_recipe;
	}

	//레시피그램 좋아요순 정렬
	@Override
	public List<RecipegramVO> getRecipegramLike(RecipegramCriteria cri) {
		// TODO Auto-generated method stub
		//해당 해시태그가 포함된 레시피그램 개수
		Integer hash_cnt = recipegramMapper.getHashCnt(cri);
	
		List<RecipegramVO> more_recipe = new ArrayList<RecipegramVO>();

		
		int startNum = 0;
		//해시태그가 null이 아니고 레시피그램 개수가 0이 아니면... 해시태그를 클릭했을 때  -> 최신순
		if(cri.getRecipe_search() != null  &&hash_cnt != 0) {
			log.info("검");
			//무한스크롤 범위만큼의 레시피그램 게시물 번호
			Integer[] rg_num = recipegramMapper.getHashrg(cri.getRecipe_search(), startNum);
			
				for(int i=0; i<rg_num.length; i++) {
					more_recipe.add(recipegramMapper.getHashList(rg_num[i]));
				}
			
			return more_recipe;
			
		}
		
		//무한스크롤 범위만큼의 레시피그램 게시물 번호   좋아요순 디폴트 페이지
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

	//레시피그램 좋아요 개수 증가
	@Override
	public int insertLikecnt(RecipegramVO recipegramvo) {
		// TODO Auto-generated method stub
		
		return recipegramMapper.insertLikecnt(recipegramvo);
	}

	//레시피그램 좋아요 추가
	@Override
	public int insertLike(Recipegram_likeVO likevo) {
		// TODO Auto-generated method stub
		return recipegramMapper.insertLike(likevo);
	}

	//레시피그램 좋아요 개수 감소
	@Override
	public int deleteLikecnt(RecipegramVO recipegramvo) {
		// TODO Auto-generated method stub
		return recipegramMapper.deleteLikecnt(recipegramvo);
	}

	//레시피그램 좋아요 삭제
	@Override
	public int deleteLike(Recipegram_likeVO likevo) {
		// TODO Auto-generated method stub
		return recipegramMapper.deleteLike(likevo);
	}

	//레시피그램을 좋아요했는지 체크
	@Override
	public int findLike(int user_num, int recipegram_num) {
		// TODO Auto-generated method stub
		Integer user = recipegramMapper.findLike(user_num, recipegram_num);
		
		if(user == null) {
			return -1;
		}
		
		
		return 0;
	}

	//해당 회원의 좋아요를 한 레시피그램
	@Override
	public List<Recipegram_likeVO>  getLike(int user_num) {
		// TODO Auto-generated method stub
		return recipegramMapper.getLike(user_num);
		
	
	}

	//각 레시피그램의 좋아요 개수
	@Override
	public List<RecipegramVO> getLikecnt(int recipegram_num) {
		// TODO Auto-generated method stub
		return recipegramMapper.getLikecnt(recipegram_num);
	}

	//레시피그램 댓글 추가
	@Override
	public int insertReply(ReplyVO replyvo) {
		// TODO Auto-generated method stub
		return recipegramMapper.insertReply(replyvo);
	}

	//레시피그램 댓글 목록
	@Override
	public List<ReplyVO> getReplyList(int recipegram_num) {
		// TODO Auto-generated method stub
		
		List<ReplyVO> a = recipegramMapper.getReplyList(recipegram_num);
		for(int i=0; i<a.size(); i++) {
			log.info("rereply : " +a.get(i).getRereplyList());
		}
		
		return recipegramMapper.getReplyList(recipegram_num);
	}
	
	//레시피그램 대댓글 추가
	@Override
	public int insertRereply(RereplyVO rereplyvo) {
		// TODO Auto-generated method stub
		return recipegramMapper.insertRereply(rereplyvo);
	}
	
	//레시피그램 대댓글 목록
	@Override
	public List<RereplyVO> getRereplyList(int recipegram_reply_num) {
		// TODO Auto-generated method stub
		
		return recipegramMapper.getRereplyList(recipegram_reply_num);
	}

	//레시피그램 댓글 삭제
	@Override
	public int deleteReply(int recipegram_reply_num) {
		// TODO Auto-generated method stub
		return recipegramMapper.deleteReply(recipegram_reply_num);
	}

	//레시피그램 대댓글 삭제
	@Override
	public int deleteRereply(int recipegram_rereply_num) {
		// TODO Auto-generated method stub
		return recipegramMapper.deleteRereply(recipegram_rereply_num);
	}

	//레시피그램 내용
	@Override
	public List<RecipegramVO> contList(int recipegram_num) {
		
		return recipegramMapper.contList(recipegram_num);
	}

	//레시피그램 이미지
	@Override
	public List<ImgVO> imgList(int recipegram_num) {
		// TODO Auto-generated method stub
		return recipegramMapper.imgList(recipegram_num);
	}

	//레시피그램 무한 스크롤 추가(최신순)
	@Override
	public List<RecipegramVO>  getRownum(String recipe_search, int startNum) {
		// TODO Auto-generated method stub
		
		RecipegramCriteria cri = new RecipegramCriteria();
		//해시태그를 클릭했을 때 
		cri.setRecipe_search(recipe_search);
		//클릭한 해시태그가 포함된 레시피그램 개수
		Integer hash_cnt = recipegramMapper.getHashCnt(cri);
		List<RecipegramVO> more_recipe = new ArrayList<RecipegramVO>();
		//해시태그를 클릭했을 때
		if(recipe_search != null  &&hash_cnt != 0) {
			//디폴트로 띄어준 레시피게시물보다 클릭한 해시태그가 포함된 레시피그램 개수가 많을 경우
			if(hash_cnt/3 >= startNum) {
				Integer[] rg_num = recipegramMapper.getHashrg(recipe_search, startNum);
				
				for(int i=0; i<rg_num.length; i++) {
					more_recipe.add(recipegramMapper.getHashList(rg_num[i]));
				}
			}
			return more_recipe;
		}
		
		//해시태그 클릭하지 않았을 때
		Integer[] rownum = recipegramMapper.getRownum(startNum);
		for(int i=0; i<rownum.length; i++) {
			more_recipe.add(recipegramMapper.getMoreNewRecipegram(rownum[i]));
			
		}
		
		
		return more_recipe;
	}

	//레시피그램 무한 스크롤 추가(좋아요순)
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
	
	//레시피그램 무한스크롤 추가(회원)
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

	//레시피그램 목록(회원)
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

	//레시피그램 삭제
	@Override
	public int deleteRecipegram(int recipegram_num) {
		// TODO Auto-generated method stub
		return recipegramMapper.deleteRecipegram(recipegram_num);
	}

	//레시피그램 수정
	@Override
	public List<RecipegramVO> getmodifyRecipegram(int recipegram_num) {
		// TODO Auto-generated method stub
		return recipegramMapper.getmodifyRecipegram(recipegram_num);
	}
	
	
// 	@Override
// 	   public List<RecipegramVO> main_rgList() {
// 	      // TODO Auto-generated method stub
// 	      return recipegramMapper.main_rgList();
// 	   }
	
	//회원 레시피그램 수
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
