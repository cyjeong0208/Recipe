package com.solrecipe.recipe.recipegram.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Files;
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


import com.solrecipe.recipe.recipegram.domain.HashVO;
import com.solrecipe.recipe.recipegram.domain.ImgVO;
import com.solrecipe.recipe.recipegram.domain.RecipegramCriteria;
import com.solrecipe.recipe.recipegram.domain.RecipegramVO;
import com.solrecipe.recipe.recipegram.domain.ReplyVO;
import com.solrecipe.recipe.recipegram.service.RecipegramService;
import com.solrecipe.recipe.user.domain.MemberVO;

import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;

@Controller
@Log4j
public class RecipegramController {
	
	@Autowired
	RecipegramService recipegramservice;
	
	@GetMapping("/recipegram_index")
	public String rgList(@ModelAttribute("cri")RecipegramCriteria cri, Model model) {
		log.info("list");

		model.addAttribute("list", recipegramservice.rgListWithSearch(cri));
		
		return ("/recipegram/recipegram_index");
	}
	
	/* @GetMapping("/recipegram_index") */
	@PostMapping(value="/getRecipegramLike", produces="application/json;charset=UTF-8")
	@ResponseBody
	public String getLikeList(Model model) {
		
		model.addAttribute("likeList", recipegramservice.getRecipegramLike());
		return "/recipegram/recipegram_index";
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
	
	@PostMapping(value="/getMoreNewRecipegram", produces="application/json;charset=UTF-8")
	@ResponseBody
	public ArrayList<RecipegramVO> getMoreNewRecipegram(String startNum){
		// index 무한스크롤
		ArrayList<RecipegramVO> moreNewlist = (ArrayList) recipegramservice.getMoreNewRecipegram(Integer.parseInt(startNum));
		return moreNewlist;
	}
	
	
	@RequestMapping(value="/insertReply")
    @ResponseBody
    public String insertReply(@ModelAttribute("replyvo") ReplyVO replyvo, HttpServletRequest request) throws Exception{
        
        HttpSession session = request.getSession();
        MemberVO membervo = (MemberVO)session.getAttribute("loginVO");
        
        try{
        
        	replyvo.setUser_nickname(membervo.getUser_nickname());        
        	recipegramservice.insetReply(replyvo);
            
        } catch (Exception e){
            e.printStackTrace();
        }
        
        return "success";
    }
    
    /**
     * 게시물 댓글 불러오기(Ajax)
     * @param boardVO
     * @param request
     * @return
     * @throws Exception
     */
	@RequestMapping(value="/replyList", produces="application/json; charset=utf8")
    @ResponseBody
    public ResponseEntity replyList(@ModelAttribute("replyvo") ReplyVO replyvo, HttpServletRequest request) throws Exception{
        
        HttpHeaders responseHeaders = new HttpHeaders();
        ArrayList<HashMap> hmlist = new ArrayList<HashMap>();
        
        // 해당 게시물 댓글
        List<ReplyVO> ReplyVO = recipegramservice.selectRecipegramReplyByCode(replyvo);
        
        if(ReplyVO.size() > 0){
            for(int i=0; i<ReplyVO.size(); i++){
                HashMap hm = new HashMap();
                //hm.put("c_code", ReplyVO.get(i).get .getC_code());
                hm.put("comment", ReplyVO.get(i).getRecipegram_reply_content());
                hm.put("writer", ReplyVO.get(i).getUser_nickname());
                
                hmlist.add(hm);
            }
            
        }
        
        JSONArray json = new JSONArray();  
        json.add(hmlist);
        return new ResponseEntity(json.toString(), responseHeaders, HttpStatus.CREATED);
        
    }
}
