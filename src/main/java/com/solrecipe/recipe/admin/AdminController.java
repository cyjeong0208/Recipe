package com.solrecipe.recipe.admin;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.solrecipe.recipe.chat.AdminChatRoomVO;
import com.solrecipe.recipe.chat.AdminChatVO;
import com.solrecipe.recipe.foodvideo.FoodVideoVO;
import com.solrecipe.recipe.recipe.Recipe_CookingVO;
import com.solrecipe.recipe.recipe.Recipe_basicVO;
import com.solrecipe.recipe.user.domain.MemberVO;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class AdminController {

	@Autowired
	AdminServiceImpl adminService;

	@GetMapping("/admin_index")
	public String admin_index() {
		return "/admin/admin_index";
	}

	@GetMapping("/admin_recipe")
	public String admin_recipe(@RequestParam(value = "page", defaultValue = "1") int page, Model model) {

		Paging paging = new Paging(15, 10, page, adminService.getTotalCnt("recipe"));
		ArrayList<Recipe_basicVO> recipeList = (ArrayList<Recipe_basicVO>) adminService.getRecipeList(paging.page);

		model.addAttribute("totalPosts", paging.totalPosts);
		model.addAttribute("recipeList", recipeList);
		model.addAttribute("page", paging.page);
		model.addAttribute("startPage", paging.startPage);
		model.addAttribute("endPage", paging.endPage);
		model.addAttribute("totalPage", paging.totalPage);

		return "/admin/admin_recipe";
	}

	@GetMapping("/admin_searchrecipe")
	public String admin_searchrecipe(@RequestParam(value = "page", defaultValue = "1") int page, String search,
			Model model) {

		// 페이징
		Paging paging = new Paging(15, 10, page, adminService.getSearchedCnt("recipe", search));
		ArrayList<Recipe_basicVO> recipeList = (ArrayList<Recipe_basicVO>) adminService
				.getSearchedRecipeList(paging.page, search);
		model.addAttribute("totalPosts", paging.totalPosts);
		model.addAttribute("recipeList", recipeList);
		model.addAttribute("page", paging.page);
		model.addAttribute("startPage", paging.startPage);
		model.addAttribute("endPage", paging.endPage);
		model.addAttribute("totalPage", paging.totalPage);
		// 검색 내용을 추가.
		model.addAttribute("search", search);

		return "/admin/admin_recipe";
	}

	@GetMapping("/admin_recipe_delete")
	public String admin_recipe_delete(int excel, int recipe_num, int page, String search, RedirectAttributes rttr) {
		int result = adminService.deleteRecipe(excel, recipe_num);
		if (result > 0 && excel == 0) {
			deleteFile(recipe_num);
		} // excel값은 필요없다, 애초에 excel에 있느느 레시피의 이미지 파일은 외부의 링크로 따온 것이기 때문에, 실제 파일이 내 컴퓨터에
			// 없다.

		rttr.addFlashAttribute("isDeleted", result);
		rttr.addAttribute("page", page);
		// 참고 - redirect의 경우 url이 두 번 호출된다. 그러므로 string의 경우에는 ?파라미터로 전달할 수 없다.
		if (!(search.equals(""))) {
			rttr.addAttribute("search", search);
			return "redirect:/admin_searchrecipe";
		}
		return "redirect:/admin_recipe";
	}

	@GetMapping("/admin_recipe_write")
	public String admin_recipe_write() {
		return "/admin/admin_recipe_write";
	}

	@GetMapping("/admin_recipe_modify")
	public String admin_recipe_modify(int excel, Long recipe_num, Model model) {
		Recipe_basicVO basic = adminService.getRecipeDetail(recipe_num, excel);
		List<Recipe_CookingVO> cooking_list = adminService.getCookingDetail(recipe_num, excel);

		// System.out.println(basic);
		// cooking_list.forEach(data -> System.out.println(data));

		model.addAttribute("basic", basic);
		model.addAttribute("cooking_list", cooking_list);

		return "admin/admin_recipe_modify";
	}

	@PostMapping(value = "/admin_modify_recipe")
	@ResponseBody
	public Object recipe_modify_(@ModelAttribute("basic") Recipe_basicVO basic, MultipartHttpServletRequest request) {

		Long recipe_num = basic.getRecipe_num();
		int excel = basic.getExcel();

		System.out.println(basic);
		System.out.println(
				basic.getRecipe_title() + " / " + basic.getRecipe_food_main() + " / " + basic.getRecipe_food_suv());

		adminService.updateRecipeBasic(basic);

		Recipe_CookingVO cooking = null;

		String[] add_txt = request.getParameterValues("add_txt");

		for (int i = 0; i < add_txt.length; i++) {

			System.out.println(add_txt[i]);

			cooking = new Recipe_CookingVO();
			cooking.setRecipe_num(recipe_num);
			cooking.setCooking_num((i + 1L));
			cooking.setCooking_content(add_txt[i]);

			adminService.updateRecipeCooking(cooking, excel);

		}
		return recipe_num.toString();

	}

	@GetMapping("/admin_foodvideo")
	public String admin_foodvideo(@RequestParam(value = "page", defaultValue = "1") int page, Model model) {

		// 페이징
//		int listCnt = 15;
//		int pageCnt = 10;
//		int totalPosts = adminService.getTotalCnt("fv");
//		int totalPage = totalCnt/listCnt+1;
//		
//		if (page > totalPage){
//			page = totalPage;
//		}
//		int startPage = ((page - 1) / pageCnt) * pageCnt + 1;
//		
//		int endPage = startPage + pageCnt - 1;
//		if (endPage > totalPage) {
//			endPage = totalPage;
//		}

		// 하나의 페이지에 게시글 개수 / 총 보여질 페이지 번호 / 현재 페이지 / 총 게시글 개수
		Paging paging = new Paging(15, 10, page, adminService.getTotalCnt("fv"));
		ArrayList<FoodVideoVO> foodvideoList = (ArrayList<FoodVideoVO>) adminService.getFoodVideoList(paging.page);

		model.addAttribute("totalPosts", paging.totalPosts);
		model.addAttribute("foodvideoList", foodvideoList);
		model.addAttribute("page", paging.page);
		model.addAttribute("startPage", paging.startPage);
		model.addAttribute("endPage", paging.endPage);
		model.addAttribute("totalPage", paging.totalPage);

		return "/admin/admin_foodvideo";
	}

	@GetMapping("/admin_searchfoodvideo")
	public String admin_searchFoodVideo(@RequestParam(value = "page", defaultValue = "1") int page, String search,
			Model model) {

		// 페이징
		Paging paging = new Paging(15, 10, page, adminService.getSearchedCnt("fv", search));
		ArrayList<FoodVideoVO> foodvideoList = (ArrayList<FoodVideoVO>) adminService
				.getSearchedFoodVideoList(paging.page, search);
		model.addAttribute("totalPosts", paging.totalPosts);
		model.addAttribute("foodvideoList", foodvideoList);
		model.addAttribute("page", paging.page);
		model.addAttribute("startPage", paging.startPage);
		model.addAttribute("endPage", paging.endPage);
		model.addAttribute("totalPage", paging.totalPage);
		// 검색 내용을 추가.
		model.addAttribute("search", search);

		return "/admin/admin_foodvideo";
	}

	@GetMapping("/admin_foodvideo_delete")
	public String admin_foodvideo_delete(int video_num, int page, String search, RedirectAttributes rttr) {
		int result = adminService.deleteFoodVideo(video_num);
		rttr.addFlashAttribute("isDeleted", result);
		rttr.addAttribute("page", page);
		// 참고 - redirect의 경우 url이 두 번 호출된다. 그러므로 string의 경우에는 ?파라미터로 전달할 수 없다.
		if (!(search.equals(""))) {
			rttr.addAttribute("search", search);
			return "redirect:/admin_searchfoodvideo";
		}
		return "redirect:/admin_foodvideo";
	}

	@GetMapping("/admin_chat")
	public String admin_chat(@RequestParam(value = "page", defaultValue = "1") int page,
			@RequestParam(value = "search", defaultValue = "") String search, Model model) {

		Paging paging = new Paging(15, 10, page, adminService.getChatRoomCnt(search));
		List<AdminChatRoomVO> chatroomList = adminService.getChatRoomList(paging.page, search);

		/*
		 * chatroomList.forEach(s->System.out.println(s));
		 * System.out.println(paging.page); System.out.println(paging.startPage);
		 * System.out.println(paging.endPage); System.out.println(paging.totalPage);
		 */

		model.addAttribute("totalPosts", paging.totalPosts);
		model.addAttribute("chatroomList", chatroomList);
		model.addAttribute("page", paging.page);
		model.addAttribute("startPage", paging.startPage);
		model.addAttribute("endPage", paging.endPage);
		model.addAttribute("totalPage", paging.totalPage);
		model.addAttribute("search", search);

		return "/admin/admin_chat";

	}

	@GetMapping("/admin_chat_delete")
	public String admin_chat_delete(int chatroom_num, int page,
			@RequestParam(value = "search", defaultValue = "") String search, @RequestParam("type") String type,
			RedirectAttributes rttr) {
		System.out.println("채팅방 삭제하기~");

		System.out.println("chatroom_num: " + chatroom_num);
		System.out.println("search: " + search);
		System.out.println("type: " + type);

		int result = adminService.deleteChatRoom(chatroom_num, type);
		rttr.addFlashAttribute("isDeleted", result);
		rttr.addAttribute("page", page);

		if (!(search.equals(""))) {
			rttr.addAttribute("search", search);
			return "redirect:/admin_chat";
		}

		return "redirect:/admin_chat";
	}

	@PostMapping(value = "/getChatting", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public Object getChatting(@RequestParam(value = "chatroom_num") int chatroom_num) {

		List<AdminChatVO> vo = adminService.getChattingList(chatroom_num);
		return vo;

	}

	/*
	 * @GetMapping("/admin_chatting") public String admin_chatting(){ return
	 * "/admin/admin_chatting"; }
	 */

	@GetMapping("/admin_message")
	public String admin_message() {
		return "/admin/admin_message";
	}

	@GetMapping("/admin_msg")
	public String admin_msg() {
		return "/admin/admin_msg";
	}

	@RequestMapping(value = "/admin_users", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	// @ResponseBody
	// @GetMapping("/admin_users")
	public String admin_users(@RequestParam(value = "page", defaultValue = "1") int page, Model model) {
		// 하나의 페이지에 게시글 개수, 총 보여질 페이지 번호, 현재 페이지, 총 게시글 개수
		Paging paging = new Paging(15, 10, page, adminService.getTotalCnt("users"));
		ArrayList<MemberVO> userList = (ArrayList) adminService.getUserList(paging.page);

		log.info(userList);

		model.addAttribute("totalPosts", paging.totalPosts);
		model.addAttribute("userlist", userList);
		model.addAttribute("page", paging.page);
		model.addAttribute("startPage", paging.startPage);
		model.addAttribute("endPage", paging.endPage);
		model.addAttribute("totalPage", paging.totalPage);

		return ("/admin/admin_users");
	}

	@GetMapping("/admin_searchuserlist")
	public String admin_searchUsers(@RequestParam(value = "page", defaultValue = "1") int page, String search,
			Model model) {

		// 페이징
		Paging paging = new Paging(15, 10, page, adminService.getSearchedCnt("users", search));
		ArrayList<MemberVO> userList = (ArrayList<MemberVO>) adminService.getSearchUserList(paging.page, search);

		model.addAttribute("totalPosts", paging.totalPosts);
		model.addAttribute("userlist", userList);
		model.addAttribute("page", paging.page);
		model.addAttribute("startPage", paging.startPage);
		model.addAttribute("endPage", paging.endPage);
		model.addAttribute("totalPage", paging.totalPage);

		// 검색내용을 추가
		model.addAttribute("search", search);

		return "/admin/admin_users";
	}

//	//@PostMapping("/admin_black")
	@RequestMapping(value = "/admin_black", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String admin_black(int user_num, int user_black, MemberVO memvo, Model model) {

		/* ArrayList<MemberVO> black_list = new ArrayList<MemberVO>(); */

		System.out.println("user_black: " + user_black);

//		if (user_black == 0) {
//			System.out.println("black_zero: " + user_black);
//			model.addAttribute("black", adminService.usersUpdate_black(memvo));
//
//		} else 
		if(user_black == 1){
			System.out.println("black_cancel: " + user_black);
			model.addAttribute("black_cancel", adminService.usersUpdate_black_cancel(memvo));
		}

		return "/admin/admin_users";
	}

	@RequestMapping(value = "/admin_warning", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String admin_warning(int user_num, int user_warning, int user_black, String user_username, MemberVO memvo, Model model) {
		
		if(user_warning != 3) {
			user_warning++;
			memvo.setUser_warning(user_warning);
			model.addAttribute("warning", adminService.usersUpdate_warning(memvo));
		}
		
		if(user_warning == 3){
			memvo.setUser_warning(user_warning);
			model.addAttribute("warning", adminService.usersUpdate_warning(memvo));
			model.addAttribute("black", adminService.usersUpdate_black(memvo));
			System.out.println("컨트롤러" + user_username);
			
			model.addAttribute("blackName", adminService.user_blackOut(user_num));
			
		}

		return "/admin/admin_users";
	}

	// excel = 0 일 때만 이 메서드가 호출된다.
	public boolean deleteFile(int recipe_num) {

		boolean result = false;
		File file = null;
		File file2 = null;
		File[] list = null;
		String recipeNum = Integer.toString(recipe_num);

		try {
			file = new File("c:\\Project\\Recipe_IMG\\Main_IMG");
			file2 = new File("c:\\Project\\Recipe_IMG\\Cooking_IMG");

			if (file.isDirectory() && file2.isDirectory()) {

				list = file.listFiles((dir, name) -> {
					String[] imgNames = name.split("\\.");
					return imgNames[0].equals(recipeNum);
				});

				for (File _file : list) {
					_file.delete();
				}

				list = file2.listFiles((dir, name) -> {
					String[] imgNames = name.split("_");
					return imgNames[0].equals(recipeNum);
				});

				for (File _file : list) {
					_file.delete();
				}

			}

			result = true;
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

}
