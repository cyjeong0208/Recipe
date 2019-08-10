package com.solrecipe.recipe;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class tempController {

	
   @RequestMapping("/change_index")
   public String change_index() {
      return "change_index";
   }
   @RequestMapping("/with_index")
   public String with_index() {
      return "with_index";
   }
   @RequestMapping("/foodvideo_detail")
   public String foodvideo_detail() {
      return "foodvideo/foodvideo_detail";
   }
   @RequestMapping("/foodvideo_index")
   public String foodvideo_index() {
      return "foodvideo/foodvideo_index";
   }
   @RequestMapping("/foodvideo_search")
   public String foodvideo_search() {
      return "foodvideo_search";
   }
   @RequestMapping("/myPage_index")
   public String myPage_index() {
      return "my/myPage_index";
   }
   @RequestMapping("/myPage_mark")
   public String myPage_att() {
      return "my/myPage_mark";
   }
   @RequestMapping("/myPage_recipe")
   public String myPage_recipe() {
      return "my/myPage_recipe";
   }
//   @RequestMapping("/myPage_recipegram")
//   public String myPage_recipegram() {
//      return "my/myPage_recipegram";
//   }
   @RequestMapping("/salething_emart")
   public String salething_emart() {
      return "salething_emart";
   }
   @RequestMapping("/salething_homeplus")
   public String salething_homeplus() {
      return "salething_homeplus";
   }
   @RequestMapping("/salething_lotte")
   public String salething_lotte() {
      return "salething_lotte";
   }
   @RequestMapping("/recipe_index")
   public String recipe_index() {
      return "recipe/recipe_index";
   }
   @RequestMapping("/recipe_write")
   public String recipe_write() {
      return "recipe/recipe_write";
   }
   @RequestMapping("/recipegram_index")
   public String recipegram_index() {
      return "recipegram/recipegram_index";
   }
   @RequestMapping("/recipegram_write")
   public String recipegram_write() {
      return "recipegram/recipegram_write";
   }
  
   @RequestMapping("/fail_Login")
   public String fail_Login() {
      return "fail_Login";
   }
   @RequestMapping("/admin_index")
   public String admin_index() {
      return "admin/admin_index";
   }
   
   
   
   @RequestMapping("/modify")
   public String multifile() {
      return "recipegram/modify";
   }
   @RequestMapping("/ajaxUpload")
   public String ajaxUpload() {
      return "recipegram/ajaxUpload";
   }
}