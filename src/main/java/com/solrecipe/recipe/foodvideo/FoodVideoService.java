package com.solrecipe.recipe.foodvideo;

import java.util.List;

public interface FoodVideoService {

	List<FoodVideoVO> getNewList();
	List<FoodVideoVO> getMoreNewlist(int startNum);
	FoodVideoVO getFVO(int video_num);
	List<FoodVideoVO> getPlayList(String playList);
	List<FoodVideoVO> getMorePlaylist(int startNum, String playList);
	List<FoodVideoVO> getBestList();
	List<FoodVideoVO> search_list(Criteria cri);
	List<FoodVideoVO> getMoreSearchlist(int startNum, Criteria cri);
	int insertVideo(FoodVideoVO fvVO);
	int checkMarked(int user_num, int video_num);
	int marking(int user_num, int video_num);
	int unmarking(int user_num, int video_num);
}
