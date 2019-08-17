package com.solrecipe.recipe.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import com.solrecipe.recipe.chat.AdminChatRoomVO;
import com.solrecipe.recipe.chat.AdminChatVO;
import com.solrecipe.recipe.foodvideo.FoodVideoVO;
import com.solrecipe.recipe.recipe.RecipeMapper;
import com.solrecipe.recipe.recipe.Recipe_CookingVO;
import com.solrecipe.recipe.recipe.Recipe_MarkVO;
import com.solrecipe.recipe.recipe.Recipe_basicVO;
import com.solrecipe.recipe.user.domain.MemberVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class AdminServiceImpl implements AdminService {

	@Setter(onMethod_ = @Autowired)
	private AdminMapper adminMapper;

	@Setter(onMethod_ = @Autowired)
	private RecipeMapper mapper;

	@Autowired
	private PlatformTransactionManager manager;

	@Override
	public int getTotalCnt(String whichPage) {
		return adminMapper.getTotalCnt(whichPage);
	}

	@Override
	public int getSearchedCnt(String whichPage, String keyword) {
		return adminMapper.getSearchedCnt(whichPage, keyword);
	}

	@Override
	public List<Recipe_basicVO> getRecipeList(int page) {
		int startNum = (page - 1) * 15;
		return adminMapper.getRecipeList(startNum);
	}

	@Override
	public List<Recipe_basicVO> getSearchedRecipeList(int page, String keyword) {
		int startNum = (page - 1) * 15;
		return adminMapper.getSearchedRecipeList(startNum, keyword);
	}

	@Override
	public Recipe_basicVO getRecipeDetail(Long recipe_num, int excel) {
		Recipe_basicVO vo = mapper.getRecipeDetail(recipe_num, excel);

		String recipe_food_main = vo.getRecipe_food_main();
		String[] main_Array = recipe_food_main.split(",");
		recipe_food_main = "";
		for (String string : main_Array) {
			recipe_food_main += string + ", ";
		}
		vo.setRecipe_food_main(recipe_food_main.substring(0, recipe_food_main.length() - 2));

		if (!(vo.getRecipe_food_suv() == null || vo.getRecipe_food_suv().length() == 0)) {

			String recipe_food_suv = vo.getRecipe_food_suv();
			String[] suv_Array = recipe_food_suv.split(",");
			recipe_food_suv = "";
			for (String string : suv_Array) {
				recipe_food_suv += string + ", ";
			}
			vo.setRecipe_food_suv(recipe_food_suv.substring(0, recipe_food_suv.length() - 2));

		} else {
			vo.setRecipe_food_suv("없음");
		}

		return vo;
	}

	@Override
	public List<Recipe_CookingVO> getCookingDetail(Long recipe_num, int excel) {
		return mapper.getCookingDetail(recipe_num, excel);
	}

	@Override
	public int deleteRecipe(int excel, int recipe_num) {
		int result1 = adminMapper.deleteRecipeBasic(excel, recipe_num);
		int result2 = adminMapper.deleteRecipeCooking(excel, recipe_num);
		return result1 + result2;
	}

	// 레시피 수정 관련

	@Override
	public int updateRecipeBasic(Recipe_basicVO basic) {
		return mapper.updateRecipeBasic(basic);
	}

	@Override
	public int updateRecipeCooking(Recipe_CookingVO cooking, int excel) {
		return mapper.updateRecipeCooking(cooking, excel);
	}

	// 레시피 찜하기 관련

	@Override
	public int insertMarkRecipe(Recipe_MarkVO mark) {
		int result;
		TransactionStatus status = manager.getTransaction(new DefaultTransactionDefinition());
		try {
			result = mapper.insertMarkRecipe(mark);
			manager.commit(status);
		} catch (Exception e) {
			e.printStackTrace();
			manager.rollback(status);
			result = -1;
		}

		return result;
	}

	@Override
	public int deleteMarkRecipe(Recipe_MarkVO mark) {
		return mapper.deleteMarkRecipe(mark);
	}

	@Override
	public List<Recipe_MarkVO> selectUserMarkRecipe(int user_num) {
		return mapper.selectUserMarkRecipe(user_num);
	}

	@Override
	public Integer getUserNumById(String user_id) {
		return mapper.getUserNumById(user_id);
	}

	@Override
	public List<FoodVideoVO> getFoodVideoList(int page) {
		int startNum = (page - 1) * 15;
		return adminMapper.getFoodVideoList(startNum);
	}

	@Override
	public List<FoodVideoVO> getSearchedFoodVideoList(int page, String keyword) {
		int startNum = (page - 1) * 15;
		return adminMapper.getSearchedFoodVideoList(startNum, keyword);
	}

	@Override
	public int deleteFoodVideo(int videoNum) {
		return adminMapper.deleteFoodVideo(videoNum);
	}

	@Override
	public List<AdminChatRoomVO> getChatRoomList(int page, String keyword) {
		int startNum = (page - 1) * 15;
		return adminMapper.getChatRoomList(startNum, keyword);
	}

	@Override
	public int getChatRoomCnt(String keyword) {
		return adminMapper.getChatRoomCnt(keyword);
	}

	@Override
	public List<AdminChatVO> getChattingList(int chatroom_num) {
		return adminMapper.getChattingList(chatroom_num);
	}

	@Override
	public int deleteChatRoom(int chatroom_num, String type) {
		return adminMapper.deleteChatRoom(chatroom_num, type);
	}

	// admin 회원관리
	@Override
	public List<MemberVO> getUserList(int page) {
		int startNum = (page - 1) * 15;
		return adminMapper.getUserList(startNum);
	}

	@Override
	public List<MemberVO> getSearchUserList(int page, String keyword) {
		int startNum = (page - 1) * 15;
		return adminMapper.getSearchUserList(startNum, keyword);
	}

	@Override
	public boolean usersUpdate_black(MemberVO memVo) {

		log.info("update_black: " + memVo);

		return adminMapper.usersUpdate_black(memVo) == 1; // 수정이 이루어지면 1이라는 값이 반환됨
	}

	@Override
	public boolean usersUpdate_black_cancel(MemberVO memVo) {
		// TODO Auto-generated method stub
		log.info("user black_cancel");
		return adminMapper.usersUpdate_black_cancel(memVo) == 1; // 수정이 이루어지면 1이라는 값이 반환됨
	}

	@Override
	public int user_blackOut(int user_num) {
	
		return adminMapper.user_blackOut(user_num);
	}

	@Override
	public boolean usersUpdate_warning(MemberVO memVo) {
		// TODO Auto-generated method stub
		return adminMapper.userUpdate_warning(memVo)==1;
	}

//	@Override
//	public String user_blackOut_trg(String user_username, int user_num) {
//		System.out.println("트리거서비스: " + user_username);
//		return adminMapper.user_blackOut_trg(user_username);
//	}

}
