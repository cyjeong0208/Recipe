package com.solrecipe.recipe.foodvideo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.Setter;

@Service
public class FoodVideoServiceImpl implements FoodVideoService{

//	@Autowired
//	private SqlSession sqlSession; 
	

	@Setter(onMethod_= @Autowired)
	private FoodVideoMapper foodVideoMapper;
	
	@Override
	public List<FoodVideoVO> getNewList() {
		return foodVideoMapper.getNewList();
	}

	@Override
	public List<FoodVideoVO> getMoreNewlist(int startNum) {
		return foodVideoMapper.getMoreNewlist(startNum);
	}
	
	@Override
	public FoodVideoVO getFVO(int video_num) {
		return foodVideoMapper.getFVO(video_num);
	}

	@Override
	public List<FoodVideoVO> getPlayList(String playList) {
		return foodVideoMapper.getPlayList(playList);
	}

	@Override
	public List<FoodVideoVO> getMorePlaylist(int startNum, String playList) {
//		HashMap<String, Object> hm = new HashMap<String, Object>();
//		hm.put("startNum", startNum);
//		hm.put("playList", playList);
//		return foodVideoMapper.getMoreList(hm);
		return foodVideoMapper.getMorePlaylist(startNum, playList);
	}

	@Override
	public List<FoodVideoVO> getBestList() {
		return foodVideoMapper.getBestList();
	}

	@Override
	public List<FoodVideoVO> search_list(Criteria cri) {
		return foodVideoMapper.getListWithSearch(cri);
	}

	@Override
	public List<FoodVideoVO> getMoreSearchlist(int startNum, Criteria cri) {
		String cri_search = cri.getRecipe_search();
		
		return foodVideoMapper.getMoreSearchlist(startNum, cri_search);
	}

	@Override
	public int insertVideo(FoodVideoVO fvVO) {
		return foodVideoMapper.insertVideo(fvVO);
	}

	@Override
	public int checkMarked(int user_num, int video_num) {
		return foodVideoMapper.checkMarked(user_num, video_num);
	}
	
	@Override
	public int marking(int user_num, int video_num) {
		int result =  foodVideoMapper.markingMarkVideo_tb(user_num, video_num) + foodVideoMapper.markingFoodVideo_tb(video_num);
		return result;
	}

	@Override
	public int unmarking(int user_num, int video_num) {
		int result = foodVideoMapper.unmarkingMarkVideo_tb(user_num, video_num) + foodVideoMapper.unmarkingFoodVideo_tb(video_num);
		return result;
	}
}
