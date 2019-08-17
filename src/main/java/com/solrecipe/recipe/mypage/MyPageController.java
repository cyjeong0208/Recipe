package com.solrecipe.recipe.mypage;

import java.io.File;
import java.io.IOException;
import java.security.Principal;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
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

import com.solrecipe.recipe.CommonServiceImpl;
import com.solrecipe.recipe.admin.AdminController;
import com.solrecipe.recipe.foodvideo.FoodVideoServiceImpl;
import com.solrecipe.recipe.recipe.RecipeService;
import com.solrecipe.recipe.recipe.Recipe_CookingVO;
import com.solrecipe.recipe.recipe.Recipe_MarkVO;
import com.solrecipe.recipe.recipe.Recipe_basicVO;
import com.solrecipe.recipe.user.domain.MemberVO;

import lombok.Setter;

@Controller
public class MyPageController {

	@Autowired
	CommonServiceImpl commonService;
	@Autowired
	MyPageServiceImpl myPageService;
	@Autowired
	FoodVideoServiceImpl foodVideoService;
	
	//190814 추가
	@Autowired
	RecipeService recipeService;
	
	@Setter(onMethod_ = @Autowired)
	private PasswordEncoder pwencoder;
	
	@GetMapping("/myPage_index")
	public String myPage_index(Principal principal, Model model) {
		String username = principal.getName();
		MemberVO myVO = commonService.getMyVO(username);
		myVO.setUser_username(username);
		model.addAttribute("myVO", myVO);
		return ("my/myPage_index");
	}
	
	@RequestMapping(method=RequestMethod.POST, value="/updateProfile", produces ="application/text;charset=UTF-8")
	@ResponseBody
	public String updateProfile(MemberVO myVO, MultipartFile uploadFile, MultipartHttpServletRequest request) throws IllegalStateException, IOException {
		// 비밀번호 입력란이 비어있지 않으면 -> 암호화 후 필드 셋팅
		if(!(myVO.getUser_pw().equals(""))) {
			String enpw = pwencoder.encode(myVO.getUser_pw());
			myVO.setUser_pw(enpw);
		}
		// 아래로 이미지 파일 저장
		// 이미지 업로드 될 실제위치 = C:\KSworkspace_Spring\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\SolRecipe\\user-upload
		// 스프링 내부에서는 webapp폴더\\user-upload 위치에 생성된다. (실제 생성되지 않더라도 해당 위치로 호출하면 자동으로 실제 위치 찾음)
		String uploadPath = request.getSession().getServletContext().getRealPath("/user-upload/");

		// 업로드한 파일이 있는 경우에만 수정 진행.
		if (uploadFile != null) {
			System.out.println("파일 업로드 시작");
			// 업로드한 파일 이름을 가져온다.
			String uploadFileName = uploadFile.getOriginalFilename();
			// 확장자 명을 따와서
			String originalFileExtension = uploadFileName.substring(uploadFileName.lastIndexOf("."));
			// 중복되지 않도록 저장이름을 새로 생성한 뒤 확장자를 붙여준다.
			String storedFileName = UUID.randomUUID().toString().replace("-", "") + originalFileExtension;
			// 넘겨받은 파일데이터를 저장위치에 저장
			uploadFile.transferTo(new File(uploadPath +"\\" + storedFileName));
			
			// DB저장하기 위해 vo필드 초기화(위치+저장된 파일명)
			myVO.setUser_img("user-upload/"+storedFileName);
		};
		int result = myPageService.updateProfile(myVO);
		if(result > 0) {
			return "good";
		}else {
			return "bad";
		}
	}
	
	// 닉네임 중복 체크(ajax)
	@RequestMapping(method=RequestMethod.POST, value="/checkNickname", produces ="application/text;charset=UTF-8")
	@ResponseBody
	public String checkNickname(String user_nickname) {
		int result = myPageService.checkNickname(user_nickname);
		if(result == 1) {
			return("bad");
		}
		else {
			return("good");
		}
	}
	
	// 패스워드 확인 절차(ajax)
	@RequestMapping(method=RequestMethod.POST, value="/checkPW", produces ="application/text;charset=UTF-8")
	@ResponseBody
	public String checkPW(String user_pw, int user_num) {
		boolean result = myPageService.checkPW(user_pw, user_num);
		
		if(result) {
			return("good");
		}
		else {
			return("bad");
		}
	}
	
	@GetMapping("/myPage_mark")
	public String myPage_mark(Principal principal, Model model) {
		
		//user_num을 가져옴
		String username = principal.getName();
		MemberVO myVO = commonService.getMyVO(username);
		System.out.println("myVO: "+myVO);
		
		ArrayList<MyVideoVO> getMarkedVideos = myPageService.getMarkedVideos(myVO.getUser_num());
		model.addAttribute("myVideoVO", getMarkedVideos);
		
		
		// 190814 추가 - 레시피를 처음 불러올 때는 위의 비디오와 마찬가지로 6개를 가져온다, 
		//추가적인 레시피 찜은 AJAX를 통해서 가져오고 비디오 찜과 마찬가지로 4개씩 추가로 불러온다.
		ArrayList<Recipe_basicVO> getMarkedRecipes = myPageService.getMarkedRecipes(myVO.getUser_num());
		model.addAttribute("myRecipeVO", getMarkedRecipes);
		
		return ("/my/myPage_mark");
	}
		
	
	@GetMapping("/deleteMarkedVideo")
	public String deleteMarkedVideo(Principal principal, int video_num) {
		
		//user_num을 가져옴
		String username = principal.getName();
		MemberVO myVO = commonService.getMyVO(username);//myVO는 user_num이랑 user_nickname 을 들고 있다.
		
		int result = foodVideoService.unmarking(myVO.getUser_num(), video_num);
		return "redirect:/myPage_mark";
	}
	
	
	// 190814 추가 
	@GetMapping("/deleteMarkRecipe")
	public String deleteMarkRecipe(Recipe_MarkVO markedRecipe,Principal principal) {
//		String username = principal.getName();
//		MemberVO myVO = commonService.getMyVO(username);//myVO는 user_num이랑 user_nickname 을 들고 있다.
//		markedRecipe.setUser_num(myVO.getUser_num());
		recipeService.deleteMarkRecipe(markedRecipe);
		
		return "redirect:/myPage_mark";
	}
	
	
	// 무한스크롤
	@RequestMapping(method=RequestMethod.GET, value="/getMoreVideos", produces ="application/json;charset=UTF-8")
	@ResponseBody
	public ArrayList<MyVideoVO> getMorePlaylist(Principal principal, int startNum) {
		//user_num을 가져옴
		String username = principal.getName();
		MemberVO myVO = commonService.getMyVO(username);//myVO는 user_num이랑 user_nickname 을 들고 있다.
		
		ArrayList<MyVideoVO> moreVideos =myPageService.getMoreVideos(myVO.getUser_num(), startNum);
		return moreVideos;
	}
	
	
	// 190814 추가 , 무한스크롤
	@RequestMapping(method=RequestMethod.GET, value="/getMoreRecipes", produces ="application/json;charset=UTF-8")
	@ResponseBody
	public ArrayList<Recipe_basicVO> getMoreRecipes(Principal principal, int startNum) {
		//user_num을 가져옴
		String username = principal.getName();
		MemberVO myVO = commonService.getMyVO(username);//myVO는 user_num이랑 user_nickname 을 들고 있다.
		
		ArrayList<Recipe_basicVO> moreRecipe = myPageService.getMoreRecipes(myVO.getUser_num(), startNum);
		return moreRecipe;
		
	}
	
	
	
	//190813 수정 	
	@GetMapping("/myPage_recipe")
	public String myPage_recipe(Principal principal,Model model) {
		
		int user_num = myPageService.getUserNumById(principal.getName());
		ArrayList<Recipe_basicVO> recipeList = myPageService.getMyRecipe(user_num); 
		recipeList.forEach(s->{
			System.out.println(s);
			String main = s.getRecipe_food_main();
			s.setRecipe_food_main(main.substring(0, main.lastIndexOf(",")));
			String suv = s.getRecipe_food_suv();
			s.setRecipe_food_suv(suv.substring(0,suv.lastIndexOf(",")));
			
		});//디버깅용
		
		System.out.println("user_num:"+user_num);
		
		model.addAttribute("recipeList",recipeList);
		
		
		return "my/myPage_recipe";
	}
	
	
	
}
