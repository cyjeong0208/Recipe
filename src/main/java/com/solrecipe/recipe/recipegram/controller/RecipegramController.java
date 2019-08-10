package com.solrecipe.recipe.recipegram.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.security.Principal;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.UrlPathHelper;

import com.solrecipe.recipe.CommonService;
import com.solrecipe.recipe.recipegram.domain.HashVO;
import com.solrecipe.recipe.recipegram.domain.ImgVO;
import com.solrecipe.recipe.recipegram.domain.RecipegramCriteria;
import com.solrecipe.recipe.recipegram.domain.RecipegramVO;
import com.solrecipe.recipe.recipegram.domain.Recipegram_likeVO;
import com.solrecipe.recipe.recipegram.domain.ReplyVO;
import com.solrecipe.recipe.recipegram.domain.RereplyVO;
import com.solrecipe.recipe.recipegram.service.RecipegramService;
import com.solrecipe.recipe.user.domain.MemberVO;
import com.solrecipe.recipe.user.service.UserService;

import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;

@Controller
@Log4j
public class RecipegramController {
	
	@Autowired
	RecipegramService recipegramservice;
	@Autowired
	UserService usservice;

	
	@Autowired
	CommonService commonService;
	
	//이미지 indigators
		@RequestMapping(value="/img_list", method=RequestMethod.POST, produces="application/json;charset=UTF-8")
		@ResponseBody
		public List imgList(int recipegram_num) {
			List<ImgVO> imgList = recipegramservice.imgList(recipegram_num);
			
			log.info("imgList");
			
			return imgList;
		}
		
		//recipegramContent
		@RequestMapping(value="/rg_content", method=RequestMethod.POST, produces="application/json;charset=UTF-8")
		@ResponseBody
		public List contentList(int recipegram_num) {
			List<RecipegramVO> contList = recipegramservice.contList(recipegram_num);
			log.info(contList);
		
			return contList;
		}	
		
	
	
	@GetMapping("/recipegram_index")
	public String rgList(@ModelAttribute("cri")RecipegramCriteria cri, Model model) {
		log.info(cri);

		model.addAttribute("list", recipegramservice.rgListWithSearch(cri));
		
		return ("/recipegram/recipegram_index");
	}
	
	/* @GetMapping("/recipegram_index") */
	@GetMapping(value="/getRecipegramLike")
	public String getLikeList(Model model, @ModelAttribute("cri")RecipegramCriteria cri) {
		
		log.info("likeCnt!!!!!!!!");
		
		model.addAttribute("list", recipegramservice.getRecipegramLike(cri));
		
		return ("/recipegram/recipegram_lindex");
	}
	
	@GetMapping(value="/getmodifyRecipegram" )
	public String getmodifyRecipegram(Model model, Integer recipegram_num) {

		List<RecipegramVO> a = recipegramservice.getmodifyRecipegram(recipegram_num);
		
		
		model.addAttribute("rglist", a);
				
		
		return ("/recipegram/recipegram_modify");
		
	}
	
	
	@RequestMapping(value="/insertRecipegram", method=RequestMethod.POST, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public String insertRecipegram(MultipartFile[] uploadFile, MultipartHttpServletRequest request, HttpServletResponse response,
			RecipegramVO recipegramvo, HashVO hashvom) throws IOException {
	 			
      	//이미지... 
		List<String> list = new ArrayList<>();
		
		String uploadPath = request.getSession().getServletContext().getRealPath("/upload/");
		
		int cnt=0;
		// make yyyy/MM/dd folder
 
		for (MultipartFile multipartFile : uploadFile) {
			cnt++;
			ImgVO imgvo = new ImgVO();

			String uploadFileName = multipartFile.getOriginalFilename();

		
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);
			log.info("only file name: " + uploadFileName);
			//imgvo.setImg_name(uploadFileName);

			UUID uuid = UUID.randomUUID();

			uploadFileName = uuid.toString() + "_" + uploadFileName;

			try {
				File saveFile = new File(uploadPath, uploadFileName);
				multipartFile.transferTo(saveFile);
				
				
					// add to List
					
				list.add(uploadFileName);

				
				
			} catch (Exception e) {
				e.printStackTrace();
			}

		} // end for
		recipegramvo.setFirstdate(new Date(System.currentTimeMillis()));		
		recipegramvo.setUpdatedate(new Date(System.currentTimeMillis()));
		System.out.println("imgcnt : " + cnt);
		
		String num = request.getParameter("user_num");
		System.out.println(num);
		recipegramvo.setUser_num(Integer.parseInt(request.getParameter("user_num")));
		//작성내용
		String text = request.getParameter("uploadText");
      	System.out.println("uploadText : " + text);
      	recipegramvo.setRecipegram_content(text);
		
      	//나만보기 
      	String Secret = request.getParameter("uploadSecret");
      	System.out.println("uploadsecret : " + Secret);
      	int secret_num=0; /*공유하기 0 나만보기 1*/
      	
      	if(Secret.equals("true"))
      		secret_num =1;
      		
      	recipegramvo.setRecipegram_secret(secret_num);
      	
      	//해시태그
      	String hash = request.getParameter("hashTag");
      	System.out.println("hashTag : " + hash);
      	String[] hashTag = hash.split(",");
		
		int rg_result = recipegramservice.insertRecipegram(recipegramvo);
		recipegramservice.insertRecipegram_img(list, recipegramvo);
		recipegramservice.insertRecipegram_hash(hashTag, recipegramvo);
		
		
		
		return null;
	}
	
	@RequestMapping(value="/updateRecipegram", method=RequestMethod.POST)
	@ResponseBody
	public String updateRecipegram(MultipartFile[] uploadFile, MultipartHttpServletRequest request, HttpServletResponse response,
			RecipegramVO recipegramvo, HashVO hashvom) throws IOException {
	 			
      	
		recipegramvo.setUpdatedate(new Date(System.currentTimeMillis()));
		
		String num = request.getParameter("user_num");
		System.out.println(num);
		recipegramvo.setUser_num(Integer.parseInt(request.getParameter("user_num")));
		//작성내용
		String text = request.getParameter("uploadText");
      	System.out.println("uploadText : " + text);
      	recipegramvo.setRecipegram_content(text);
		
      	//나만보기 
      	String Secret = request.getParameter("uploadSecret");
      	System.out.println("uploadsecret : " + Secret);
      	int secret_num=0; /*공유하기 0 나만보기 1*/
      	
      	if(Secret.equals("true"))
      		secret_num =1;
      		
      	recipegramvo.setRecipegram_secret(secret_num);
      	
      	//해시태그
      	String hash = request.getParameter("hashTag");
      	System.out.println("hashTag : " + hash);
      	String[] hashTag = hash.split(",");
       
      	log.info("update : " + recipegramvo);
      	log.info(hashTag);
      
		
		int rg_result = recipegramservice.updateRecipegram(recipegramvo);
		recipegramservice.updateRecipegram_hash(hashTag, recipegramvo);
		
		log.info("update : " + rg_result);
		
		return null;
	}
	
	@PostMapping(value="/getMoreNewRecipegram", produces="application/json;charset=UTF-8")
	@ResponseBody
	public ArrayList<RecipegramVO> getMoreNewRecipegram(RecipegramCriteria cri, String startNum){
		// index 무한스크롤
		log.info("ccccccc : " + cri);
		ArrayList<RecipegramVO> moreNewlist = (ArrayList) recipegramservice.getRownum(cri, Integer.parseInt(startNum));
		log.info("getMoerNew");
		return moreNewlist;
	}
	
	@PostMapping(value="/getMoreLikeNewRecipegram", produces="application/json;charset=UTF-8")
	@ResponseBody
	public ArrayList<RecipegramVO> getMoreLikeNewRecipegram(String startNum){
		// index 무한스크롤
		ArrayList<RecipegramVO> moreNewlist = (ArrayList) recipegramservice.getlikeRownum(Integer.parseInt(startNum));
		log.info("getMoerNew");
		return moreNewlist;
	}
	
	@RequestMapping(value="/getLike", produces="application/json; charset=utf8")
    @ResponseBody
    public ArrayList<Recipegram_likeVO>  getLike (Recipegram_likeVO likevo, String user_num) {
		likevo.setUser_num(Integer.parseInt(user_num));
		ArrayList<Recipegram_likeVO>  get = (ArrayList)recipegramservice.getLike(Integer.parseInt(user_num));
		
		return get;
	}
	//좋아요
	@RequestMapping(value="/insertLike", produces="application/json; charset=utf8")
    @ResponseBody
    public ArrayList<RecipegramVO> insertLike (String recipegram_num, String user_num,
    						RecipegramVO recipegramvo, Recipegram_likeVO likevo) {
		//좋아요 카운트...  Recipegram_tb
		//int like = Integer.parseInt(like_cnt);
		
		log.info("recipegram_num : " + recipegram_num);
		
		ArrayList<RecipegramVO> insert = new ArrayList<RecipegramVO>();
		
		recipegramvo.setRecipegram_num(Integer.parseInt(recipegram_num));
		
		
		likevo.setRecipegram_num(Integer.parseInt(recipegram_num));
		likevo.setUser_num(Integer.parseInt(user_num));
		
		int findlike = recipegramservice.findLike(Integer.parseInt(user_num), Integer.parseInt(recipegram_num));
		
		log.info("findlike1 : " + findlike);
		//이미 좋아요를 하지 않은상태면 .. 
		if(findlike == -1) {
			
			//카운트 증가.. 
			insert = (ArrayList)recipegramservice.getLikecnt(Integer.parseInt(recipegram_num));
				
			log.info(insert);
			recipegramservice.insertLikecnt(recipegramvo);
		
		
		//레시피그램 좋아요... Recipegram_like_tb
			
			recipegramservice.insertLike(likevo);
		
		}
		
		return insert; 
	}
	
	
		@RequestMapping(value="/deleteLike", produces="application/json; charset=utf8")
	    @ResponseBody
	    public ArrayList<RecipegramVO> deleteLike (String recipegram_num, String user_num,
	    						RecipegramVO recipegramvo, Recipegram_likeVO likevo) {
			//좋아요 카운트...  Recipegram_tb
			//int like = Integer.parseInt(like_cnt);
		
			log.info("recipegram_num : " + recipegram_num);
			ArrayList<RecipegramVO> delete = new ArrayList<RecipegramVO>();
			
			recipegramvo.setRecipegram_num(Integer.parseInt(recipegram_num));
			
			
			likevo.setRecipegram_num(Integer.parseInt(recipegram_num));
			likevo.setUser_num(Integer.parseInt(user_num));
			log.info("controller user_num : " + user_num + " recipegram_num : " + recipegram_num);
			
			int findlike = recipegramservice.findLike(Integer.parseInt(user_num), Integer.parseInt(recipegram_num));
			
			log.info("findLike : " + findlike);
			
			//이미 좋아요를 한 상태면 .. 
			if(findlike != -1) {
			
				delete = (ArrayList)recipegramservice.getLikecnt(Integer.parseInt(recipegram_num));
				
				log.info(delete);
				recipegramservice.deleteLikecnt(recipegramvo);
				
				//레시피그램 좋아요... Recipegram_like_tb
				recipegramservice.deleteLike(likevo);
				
			}
			
			return delete; 
		}
	
	
	@RequestMapping(value="/insertReply", produces="application/json; charset=utf8")
    @ResponseBody
    public int insertReply(ReplyVO replyvo, String user_num, String user_nickname, 
    					String recipegram_num, String reply) throws Exception{
        
        
		replyvo.setRecipegram_num(Integer.parseInt(recipegram_num));
		replyvo.setUser_num(Integer.parseInt(user_num));
		//replyvo.setUser_nickname(user_nickname);
		replyvo.setRecipegram_reply_content(reply);
		replyvo.setFirstdate(new Date(System.currentTimeMillis()));		
		replyvo.setUpdatedate(new Date(System.currentTimeMillis()));
		
	
		int insert = recipegramservice.insertReply(replyvo);
		
		
        return insert;
    }
    
	@RequestMapping(value="/insertRereply", produces="application/json; charset=utf8")
    @ResponseBody
    public int insertRereply(RereplyVO rereplyvo, String rere_user_num, String rere_user_nickname, 
    					String recipegram_num, String reply, String reply_num) throws Exception{
       
		
		rereplyvo.setRere_user_num(Integer.parseInt(rere_user_num));
		rereplyvo.setRere_user_nickname(rere_user_nickname);
		rereplyvo.setRecipegram_rereply_content(reply);
		rereplyvo.setRecipegram_reply_num(Integer.parseInt(reply_num));
		rereplyvo.setFirstdate(new Date(System.currentTimeMillis()));		
		rereplyvo.setUpdatedate(new Date(System.currentTimeMillis()));
		rereplyvo.setRecipegram_num(Integer.parseInt(recipegram_num));
		
		
		int insert = recipegramservice.insertRereply(rereplyvo);
	
		//log.info(insert);
        return 0;
    }
    
   
	@RequestMapping(value="/replyList", produces="application/json; charset=utf8")
    @ResponseBody
    public ArrayList<ReplyVO> replyList(String recipegram_num, String user_nickname, ReplyVO replyvo, RereplyVO rereplyvo) throws Exception{
        
       
        
        // 해당 게시물 댓글
        ArrayList<ReplyVO> ReplyVO = (ArrayList)recipegramservice.getReplyList(Integer.parseInt(recipegram_num));;
        
        
       
        return ReplyVO;
        
    }
	
	@RequestMapping(value="/rereplyList", produces="application/json; charset=utf8")
    @ResponseBody
    public ArrayList<RereplyVO> rereplyList(String recipegram_reply_num, String user_nickname, RereplyVO rereplyvo) throws Exception{
        
        rereplyvo.setRecipegram_reply_num(Integer.parseInt(recipegram_reply_num));
        
        
        
        rereplyvo.setRere_user_nickname(user_nickname);
        // 해당 게시물 댓글
        ArrayList<RereplyVO> RereplyVO = (ArrayList)recipegramservice.getReplyList(Integer.parseInt(recipegram_reply_num));;
       
        
        return RereplyVO;
        
    }
	
	@RequestMapping(value="/deleteReply", produces="application/json; charset=utf8")
    @ResponseBody
    public int delteReply(String recipegram_reply_num) throws Exception{
		
		log.info(recipegram_reply_num);
		int result = recipegramservice.deleteReply(Integer.parseInt(recipegram_reply_num));
		
		log.info("delete : " + result);
		return 0;
	}
	
	@RequestMapping(value="/deleteRereply", produces="application/json; charset=utf8")
    @ResponseBody
    public int deleteRereply(String recipegram_rereply_num) throws Exception{
		
		log.info(recipegram_rereply_num);
		int result = recipegramservice.deleteRereply(Integer.parseInt(recipegram_rereply_num));
		
		log.info("delete : " + result);
		return 0;
	}
	
	@RequestMapping(value="/deleteRecipegram", produces="application/json; charset=utf8")
    @ResponseBody
    public int deleteRecipegram(String recipegram_num) throws Exception{
		
		log.info(recipegram_num);
		int result = recipegramservice.deleteRecipegram(Integer.parseInt(recipegram_num));
		
		log.info("delete : " + result);
		return 0;
	}
	
	
	@RequestMapping(value="/recipegram_user_index")
	public String rguserList(Model model,HttpServletRequest request) {
		
		log.info(request.getParameter("user_nickname"));
		model.addAttribute("userlist", usservice.getPublic(request.getParameter("user_nickname")));
		model.addAttribute("list", recipegramservice.rguserList(request.getParameter("user_nickname")));
		log.info(model);
		return "/recipegram/recipegram_user_index";
//		if(username != null) {
//
//		    MemberVO myVO = commonservice.getMyVO(username);
//		    
//		    String user_nickname =  myVO.getUser_nickname(); // nickname
//			
//			log.info(user_nickname);
//			model.addAttribute("userlist", usservice.getPublic(user_nickname));
//			model.addAttribute("list", recipegramservice.rguserList(user_nickname));
//			log.info(model);
//		}
//		return "/recipegram/recipegram_user_index";
	}
	
	@RequestMapping(value = "/myPage_recipegram")
	public String rgList(Model model, HttpServletRequest request, Principal principal) {
		
//		log.info(request.getParameter("login_nickname"));
//		model.addAttribute("list", recipegramservice.rguserList(request.getParameter("login_nickname")));
//		log.info(model);
		
		String username = principal.getName();

		log.info(username);
	
		    MemberVO myVO = commonService.getMyVO(username);
		log.info(myVO);    
		    String user_nickname =  myVO.getUser_nickname(); // nickname
		
			log.info(user_nickname);
			model.addAttribute("userlist", usservice.getPublic(user_nickname));
			model.addAttribute("list", recipegramservice.rguserList(user_nickname));
		
		
		return "/my/myPage_recipegram";
	}
}
