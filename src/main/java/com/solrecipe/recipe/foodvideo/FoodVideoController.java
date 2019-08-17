package com.solrecipe.recipe.foodvideo;

import java.security.Principal;
import java.sql.Date;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.solrecipe.recipe.CommonServiceImpl;
import com.solrecipe.recipe.user.domain.MemberVO;


@Controller
public class FoodVideoController {

	@Autowired
	FoodVideoService foodVideoServiceImpl;
	
	@Autowired
	CommonServiceImpl commonService;
	@GetMapping("/foodvideo_index")
	public String foodvideo_index(Model model) {
		// 인기영상
		ArrayList<FoodVideoVO> bestList = (ArrayList)foodVideoServiceImpl.getBestList();
		
		// 최신영상(최초 9개)
		ArrayList<FoodVideoVO> newList = (ArrayList)foodVideoServiceImpl.getNewList();
		
		model.addAttribute("bestList", bestList);
		model.addAttribute("newList", newList);
		return ("/foodvideo/foodvideo_index");
	}
	
	@PostMapping(value="/getMoreNewlist", produces="application/json;charset=UTF-8")
	@ResponseBody
	public ArrayList<FoodVideoVO> getMoreNewlist(String startNum){
		// index 무한스크롤
		ArrayList<FoodVideoVO> moreNewlist = (ArrayList) foodVideoServiceImpl.getMoreNewlist(Integer.parseInt(startNum));
		return moreNewlist;
	}
	
	@GetMapping("/foodvideo_detail")
	public String foodvideo_detail(int video_num, Model model, Principal principal) {
		
		//user_num을 가져옴 -> 로그인 하지 않은 경우에는 -1.
		int user_num = -1;
		int isMarked = -1;
		if(principal != null) {
			String username = principal.getName();
			MemberVO myVO = commonService.getMyVO(username);//myVO는 user_num이랑 user_nickname 을 들고 있다.
			user_num = myVO.getUser_num();
			isMarked = foodVideoServiceImpl.checkMarked(myVO.getUser_num(),video_num);
		}
		
		FoodVideoVO fvVO = foodVideoServiceImpl.getFVO(video_num);
		ArrayList<FoodVideoVO> playList = (ArrayList) foodVideoServiceImpl.getPlayList(fvVO.getVideo_playlist());
		model.addAttribute("fvVO", fvVO);
		model.addAttribute("playList", playList);
		model.addAttribute("isMarked", isMarked);
		// 찜하기 누를 때 user_num 필요하기 때문에 model에 추가.
		model.addAttribute("user_num",user_num);
		return ("/foodvideo/foodvideo_detail");
	}
	
	@GetMapping("/foodvideo_test")
	public String foodvideo_test(Model model) {
		FoodVideoVO fvVO = new FoodVideoVO();
		fvVO.setVideo_id("HMeJTkf9Jo4");
		fvVO.setVideo_content("SNS https://www.instagram.com/life.kimiforest/\\nE-MAIL ymgs1888@naver.com");
		fvVO.setVideo_playlist("PLv3Ue3wDYx4NRU7_PDekbW0ZfMcGdxv9V");
		fvVO.setVideo_title("[Cooking ASMR] 강식당 탕수육 라면 Kang's Kitchen Korean ramyun recipe 키미 Kimi");
		ArrayList<FoodVideoVO> playList = (ArrayList) foodVideoServiceImpl.getPlayList(fvVO.getVideo_playlist());
		model.addAttribute("fvVO", fvVO);
		model.addAttribute("playList", playList);
		return ("/foodvideo/foodvideo_detail");
	}
	
	// detail-관련영상 무한스크롤
	@RequestMapping(method=RequestMethod.POST, value="/getMorePlaylist", produces ="application/json;charset=UTF-8")
	@ResponseBody
	public ArrayList<FoodVideoVO> getMorePlaylist(String startNum, String playList) {
		ArrayList<FoodVideoVO> morePlaylist = (ArrayList) foodVideoServiceImpl.getMorePlaylist(Integer.parseInt(startNum), playList);
//		ArrayList maps = new ArrayList();
//		for(int i=0; i<morePlaylist.size(); i++) {
//			HashMap hm = new HashMap();
//			hm.put("video_num",morePlaylist.get(i).getVideo_num());
//			hm.put("video_title",morePlaylist.get(i).getVideo_title());
//			hm.put("video_thumbnail",morePlaylist.get(i).getVideo_thumbnail());
//			maps.add(hm);
//		}
		return morePlaylist;
	}
	
	
	@GetMapping("/foodvideo_search")
	public String fv_search_list(@ModelAttribute("cri") Criteria cri, Model model) {
		model.addAttribute("list", foodVideoServiceImpl.search_list(cri));
		model.addAttribute("cri_Recipe_search", cri.getRecipe_search());
		return "/foodvideo/foodvideo_search";
	}
	
	@PostMapping(value="/getMoreSearchlist", produces="application/json;charset=UTF-8")
	@ResponseBody
	public ArrayList<FoodVideoVO> getMoreSearchlist(String startNum, Criteria cri){
		// index 무한스크롤
		ArrayList<FoodVideoVO> moreSearchlist = (ArrayList) foodVideoServiceImpl.getMoreSearchlist(Integer.parseInt(startNum), cri);
		return moreSearchlist;
	}
	
	@GetMapping("/insertvideo")
	public String insertvideo() {	
		return "/foodvideo/insertvideo";
	}
	
	// 동영상 추가
	@RequestMapping(method=RequestMethod.GET, value="/insertVideos", produces ="application/text;charset=UTF-8")
	@ResponseBody
	public Object insertVideos(	String video_id, String video_playlist, String video_title, String video_content, String video_thumbnail, String firstdate) {
		FoodVideoVO fvVO = new FoodVideoVO();
		fvVO.setVideo_id(video_id);
		fvVO.setVideo_playlist(video_playlist);
		fvVO.setVideo_title(video_title);
		fvVO.setVideo_content(video_content);
		fvVO.setVideo_thumbnail(video_thumbnail);
		String dateformat = firstdate.substring(0, 10);
		Date date = Date.valueOf(dateformat);
		fvVO.setFirstdate(date);
		
		int result = foodVideoServiceImpl.insertVideo(fvVO);
		if(result == 1) {
			return "good";
		}
		else {
			return "bad";
		}
	}
	
	// 찜 ajax 반응
	@RequestMapping(method=RequestMethod.GET, value="/markVideo", produces ="application/text;charset=UTF-8")
	@ResponseBody
	public Object markVideo(int video_num, int user_num) {
		int result = foodVideoServiceImpl.marking(user_num, video_num);
		if(result == 2) {
			return "good";
		}
		else {
			return "bad";
		}
	}
	@RequestMapping(method=RequestMethod.GET, value="/unmarkVideo", produces ="application/text;charset=UTF-8")
	@ResponseBody
	public Object unmarkVideo(int video_num, int user_num) {
		int result = foodVideoServiceImpl.unmarking(user_num, video_num);
		if(result == 2) {
			return "good";
		}
		else {
			return "bad";
		}
	}
	
	
}
