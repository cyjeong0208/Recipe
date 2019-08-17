package com.solrecipe.recipe.foodvideo;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface FoodVideoMapper {

	List<FoodVideoVO> getNewList();
	List<FoodVideoVO> getMoreNewlist(int startNum);
	FoodVideoVO getFVO(int video_num);
	List<FoodVideoVO> getPlayList(String playList);
	List<FoodVideoVO> getMorePlaylist(@Param("startNum") int startNum, @Param("playList") String playList);
	List<FoodVideoVO> getBestList();
	List<FoodVideoVO> getListWithSearch(Criteria cri);
	List<FoodVideoVO> getMoreSearchlist(@Param("startNum") int startNum, @Param("cri_search")String cri_search);
	int insertVideo(FoodVideoVO fvVO);
	int checkMarked(@Param("userNum")int user_num, @Param("videoNum")int video_num);
	int markingMarkVideo_tb(@Param("userNum")int user_num, @Param("videoNum")int video_num);
	int markingFoodVideo_tb(@Param("videoNum")int video_num);
	int unmarkingMarkVideo_tb(@Param("userNum")int user_num, @Param("videoNum")int video_num);
	int unmarkingFoodVideo_tb(@Param("videoNum")int video_num);
}
