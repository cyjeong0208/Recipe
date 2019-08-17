package com.solrecipe.recipe.admin;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.solrecipe.recipe.chat.AdminChatRoomVO;
import com.solrecipe.recipe.chat.AdminChatVO;
import com.solrecipe.recipe.foodvideo.FoodVideoVO;
import com.solrecipe.recipe.recipe.Recipe_basicVO;
import com.solrecipe.recipe.user.domain.MemberVO;

public interface AdminMapper {
	int getTotalCnt(@Param("whichPage") String whichPage);

	int getSearchedCnt(@Param("whichPage") String whichPage, @Param("keyword") String keyword);

	List<Recipe_basicVO> getRecipeList(@Param("startNum") int startNum);

	List<Recipe_basicVO> getSearchedRecipeList(@Param("startNum") int startNum, @Param("keyword") String keyword);

	// 차후에 트리거로 둘 다 삭제되게하면 참 좋을듯.
	int deleteRecipeBasic(@Param("excel") int excel, @Param("recipe_num") int recipeNum);

	int deleteRecipeCooking(@Param("excel") int excel, @Param("recipe_num") int recipeNum);

	List<FoodVideoVO> getFoodVideoList(@Param("startNum") int startNum);

	List<FoodVideoVO> getSearchedFoodVideoList(@Param("startNum") int startNum, @Param("keyword") String keyword);

	int deleteFoodVideo(int videoNum);

	// admin_chat 관련 , 마감된 방만 읽어온다 chat_status = 0
	List<AdminChatRoomVO> getChatRoomList(@Param("startNum") int startNum, @Param("keyword") String keyword);

	List<AdminChatVO> getChattingList(@Param("chatroom_num") int chatroom_num);

	int getChatRoomCnt(@Param("keyword") String keyword);

	int deleteChatRoom(@Param("chatroom_num") int chatroom_num, @Param("type") String type);

	// 관리자 회원관리 관련
	List<MemberVO> getUserList(@Param("startNum") int startNum);
	List<MemberVO> getSearchUserList(@Param("startNum") int startNum, @Param("keyword") String keyword);
	int usersUpdate_black(MemberVO memVo);
	int usersUpdate_black_cancel(MemberVO memVo);
	int userUpdate_warning(MemberVO memVo);
	String user_blackOut_trg(@Param(value="user_username")String user_username, @Param(value="user_num")int user_num);
	int user_blackOut(int user_num);
}
