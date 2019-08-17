package com.solrecipe.recipe.recipe;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.security.Principal;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockMultipartFile;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import com.solrecipe.recipe.admin.AdminController;


@Controller
public class RecipeController {
	
	@Autowired
	private RecipeService service; 
	
	@RequestMapping(value = "/recipe_index", method = RequestMethod.GET)
	public String goToIndex_get() {
		return "recipe/recipe_index";
	}
	
	@RequestMapping(value = "/recipe_index", method = RequestMethod.POST)
	public String goToIndex_post(@RequestParam(value = "recipe_search",required = false) String recipe_search, RedirectAttributes rttr) {
		rttr.addFlashAttribute("MainSearch",recipe_search);
		return "redirect:/recipe_index";
	}
	
	@RequestMapping("/recipe_write")
	public String recipe_write() {
		return "recipe/recipe_write";
	}
	
//	@Transactional(rollbackFor={Exception.class})
	@PostMapping(value = "/insert_recipe")
	@ResponseBody
	public Object recipe_write_(@ModelAttribute("basic") Recipe_basicVO basic, MultipartHttpServletRequest request) {
		
		
		/*
		 
		  $.ajax({
				url : "/insert_recipe",
				data : s1,
				dataType : 'text',
				processData : false,
				contentType : false,
				type : 'POST',
				success : function(response) {
					console.log('success');
					console.log(response);
				},						
				error : function(jqXHR) {
							console.log('error');
				},				
			});
		  
		 */

		System.out.println(basic);
		
		MultipartFile mainImg = request.getFile("mainimg");
		String[] add_txt = request.getParameterValues("add_txt");
		List<MultipartFile> cooking_img = request.getFiles("img");
		
		
		
		System.out.println(basic.getRecipe_title()+" / "+basic.getRecipe_food_main()+" / "+basic.getRecipe_food_suv());
		cooking_img.forEach(s->System.out.println("파일 이름: "+s.getOriginalFilename()));
		
		
		//현재의 ContextPath를 String으로 구한다.
		String currentUriContext = ServletUriComponentsBuilder.fromCurrentContextPath().scheme("http").build().toUriString();//// 결과: http://localhost:8090 
		String uploadPath_main = "C:\\Project\\Recipe_Img\\Main_IMG\\";//메인이미지가 저장될 실제 위치		
		String uploadPath_cooking = "C:\\Project\\Recipe_IMG\\Cooking_IMG\\";//요리과정 사진을 저장할 실제 위치
		
		try {
			
			service.insertRecipe(basic);
			Long recipe_num = basic.getRecipe_num();
			String originalFileExtension_main = mainImg.getOriginalFilename().substring(mainImg.getOriginalFilename().lastIndexOf("."));
			String loadedName_main = recipe_num+originalFileExtension_main;
			mainImg.transferTo(new File(uploadPath_main+loadedName_main));
			
			for(int i = 0 ; i < cooking_img.size() ; i++) {
				MultipartFile loadedFile = cooking_img.get(i);
				
				Recipe_CookingVO cooking = new Recipe_CookingVO();
				cooking.setRecipe_num(recipe_num);
				cooking.setCooking_num(i+1L);
				cooking.setCooking_content(add_txt[i]);
				
				
				if(loadedFile.getOriginalFilename().equals("")||loadedFile.getSize()==0) {
					cooking.setCooking_img("");//null을 주면 에러가 나서 ""를 준다. --> DB에서는 null값이 들어가져있다.
					service.insertCooking(cooking);//setFile 안했으므로 cooking_img는 null을 보낸다.
				} else {
					String originalFileExtension_cooking = loadedFile.getOriginalFilename().substring(loadedFile.getOriginalFilename().lastIndexOf("."));
					String loadedName_cook = recipe_num+"_"+(i+1)+originalFileExtension_cooking;
					cooking.setCooking_img(currentUriContext+"/Recipe_IMG/Cooking_IMG/"+loadedName_cook);
					service.insertCooking(cooking);
					loadedFile.transferTo(new File(uploadPath_cooking+loadedName_cook));
				}
				
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
			return "bad";
		}
		
		return "good"; // 문자열 good 이 날라간다.
	}
	
	
	
	@GetMapping("/recipe_detail/{excel}/{recipe_num}")
	public String recipe_detail(@PathVariable("excel") Integer excel, @PathVariable("recipe_num") Long recipe_num,Model model,Principal principal) {
		
		//System.out.println("excel: "+excel);
		//System.out.println("recipe_num: "+recipe_num);
		
		
		Recipe_basicVO basic = service.getRecipeDetail(recipe_num, excel);
		
		//로그인이 된 상태면
		if(principal != null) { 
			String currentUserNickName = service.getUserNickName(principal.getName());
			model.addAttribute("isLogin","yes");
			String dib_result="not_dib";
			int user_num = service.getUserNumById(principal.getName());
			List<Recipe_MarkVO> mark_list = service.selectUserMarkRecipe(user_num);
			
			for(Recipe_MarkVO vo : mark_list) {
				if(vo.getRecipe_num() == recipe_num.intValue()) {
					dib_result="dib";
					break;
				}
			}
			
			model.addAttribute("isDib",dib_result);
			
			//해당 글을 쓴 유저면
			if(currentUserNickName!=null && currentUserNickName.equals(basic.getUser_nickname())) {
				model.addAttribute("isWriter","yes");
			}
			
		} /*
			 * else { model.addAttribute("isLogin","no"); }
			 */
		
		
		System.out.println(principal.toString());
		List<Recipe_CookingVO> cooking_list = service.getCookingDetail(recipe_num, excel);
		
		//System.out.println(basic);
		//cooking_list.forEach(data -> System.out.println(data));
		
		model.addAttribute("basic",basic);
		model.addAttribute("cooking_list",cooking_list);
		model.addAttribute("excel",excel);
		model.addAttribute("recipe_num",recipe_num);
		
		return "recipe/recipe_detail";
	}
	
	@GetMapping("/recipe_delete/{excel}/{recipe_num}")
	public String recipe_detail(@PathVariable("excel") Integer excel, @PathVariable("recipe_num") Long recipe_num,RedirectAttributes rttr, Principal principal) {
		
		int result = service.deleteRecipe(excel, recipe_num.intValue());
		if(result>0 && excel == 0) {new AdminController().deleteFile(recipe_num.intValue()); }
		
		rttr.addFlashAttribute("isDeleted",excel==0? recipe_num+" 번 ":"관리자가 올린 ");
		
		return "redirect:/recipe_index";
	}
	
	
	
	@GetMapping("/recipe_modify/{excel}/{recipe_num}")
	public String recipe_update(@PathVariable("excel") Integer excel, @PathVariable("recipe_num") Long recipe_num, Model model
								,@RequestParam(value = "from", required = false) String from
								,RedirectAttributes rttr, Principal principal) {
		
		System.out.println(from);
		
		Recipe_basicVO basic = service.getRecipeDetail(recipe_num, excel);
		List<Recipe_CookingVO> cooking_list = service.getCookingDetail(recipe_num, excel);
		//System.out.println(basic);
		//cooking_list.forEach(x->System.out.println(x));
		
		model.addAttribute("basic",basic);
		model.addAttribute("cooking_list",cooking_list);
		
		
		if(from != null && from.equals("myPage_recipe")) {
			return "my/myRecipe_modify";
		} else {
			return "recipe/recipe_modify";
		}
		
	}
	
	
	@PostMapping(value = "/modify_recipe")
	@ResponseBody
	public Object recipe_modify_(@ModelAttribute("basic") Recipe_basicVO basic, MultipartHttpServletRequest request) {
		
		Long recipe_num = basic.getRecipe_num();
		int excel= basic.getExcel();
		
		System.out.println(basic);
		System.out.println(basic.getRecipe_title()+" / "+basic.getRecipe_food_main()+" / "+basic.getRecipe_food_suv());
		
		
		service.updateRecipeBasic(basic);
		
		Recipe_CookingVO cooking = null;
		
		String[] add_txt = request.getParameterValues("add_txt");
		
		
		for(int i = 0 ; i < add_txt.length ; i++) {
			
			System.out.println(add_txt[i]);

			cooking = new Recipe_CookingVO();
			cooking.setRecipe_num(recipe_num);
			cooking.setCooking_num((i+1L));
			cooking.setCooking_content(add_txt[i]);
			
			service.updateRecipeCooking(cooking,excel);
			
		}
		
	
		
		return recipe_num.toString();
		
	}
	
	
	@GetMapping("/recipe_dib")
	@ResponseBody
	public Object recipe_dib(Recipe_MarkVO mark) {
		
		int result = service.insertMarkRecipe(mark);
		
		return result+"";
	
	}
	
	@GetMapping("/recipe_dib_delete")
	@ResponseBody
	public Object recipe_dib_delete(Recipe_MarkVO mark) {
		
		int result = service.deleteMarkRecipe(mark);
		return result+"";
	}
	
}












