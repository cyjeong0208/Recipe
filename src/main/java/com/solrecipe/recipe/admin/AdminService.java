package com.solrecipe.recipe.admin;

import java.util.List;

import com.solrecipe.recipe.chat.AdminChatRoomVO;
import com.solrecipe.recipe.chat.AdminChatVO;
import com.solrecipe.recipe.foodvideo.FoodVideoVO;
import com.solrecipe.recipe.recipe.Recipe_CookingVO;
import com.solrecipe.recipe.recipe.Recipe_MarkVO;
import com.solrecipe.recipe.recipe.Recipe_basicVO;
import com.solrecipe.recipe.user.domain.MemberVO;

public interface AdminService {
	int getTotalCnt(String whichPage);

	int getSearchedCnt(String whichPage, String keyword);

	List<Recipe_basicVO> getRecipeList(int page);

	List<Recipe_basicVO> getSearchedRecipeList(int page, String keyword);

	Recipe_basicVO getRecipeDetail(Long recipe_num, int excel);

	List<Recipe_CookingVO> getCookingDetail(Long recipe_num, int excel);

	int deleteRecipe(int excel, int recipe_num);

	// 190810 추가. Recipe_basicVO에 excel도 있으므로 excel을 따로 추가 X
	// 레시피 수정하기 관련
	public int updateRecipeBasic(Recipe_basicVO basic);

	public int updateRecipeCooking(Recipe_CookingVO vo, int excel);

	// 190811 찜하기 관련
	public int insertMarkRecipe(Recipe_MarkVO vo);

	public int deleteMarkRecipe(Recipe_MarkVO vo);

	public List<Recipe_MarkVO> selectUserMarkRecipe(int user_num);

	public Integer getUserNumById(String user_id);

	List<FoodVideoVO> getFoodVideoList(int page);

	List<FoodVideoVO> getSearchedFoodVideoList(int page, String keyword);

	int deleteFoodVideo(int videoNum);

	// admin_chat 관련 , 마감된 방만 읽어온다( => chat_status = 0 인 row들! )
	List<AdminChatRoomVO> getChatRoomList(int startNum, String keyword);

	List<AdminChatVO> getChattingList(int chatroom_num);

	int getChatRoomCnt(String keyword);

	int deleteChatRoom(int chatroom_num, String type);

	// 관리자 회원과리
	List<MemberVO> getUserList(int page);
	List<MemberVO> getSearchUserList(int page, String keyword);
	boolean usersUpdate_black(MemberVO memVo);
	boolean usersUpdate_black_cancel(MemberVO memVo);
	boolean usersUpdate_warning(MemberVO memVo);
	//String user_blackOut_trg(String user_username, int user_num);
	int user_blackOut(int user_num);
}
