package com.solrecipe.recipe.recipe;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.databind.ObjectMapper;

@RestController
@RequestMapping("/rest")
public class RecipeRestController {
   
   @Autowired
   private RecipeService service; 
   
   //리스트를 합쳐서 json으로 반환하는게 더 좋을 거 같아서 아래와 같이 했다.
   @GetMapping(value = "/getAllRecipe", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
   public List<Recipe_basicVO> getAllRecipe() {
	   
	  System.out.println("@RestController - getAllRecipe() CALLED");
	  
	  List<Recipe_basicVO> from_general_recipe = service.getAll_RECIPE();
	  List<Recipe_basicVO> from_xml_recipe = service.getAll_RECIPE_EXCEL();
	  ArrayList<Recipe_basicVO> all_recipe = new ArrayList<Recipe_basicVO>();
	  
	  all_recipe.addAll(from_general_recipe);
	  all_recipe.addAll(from_xml_recipe);
	  
	  return all_recipe;
	  
   }
   
   @GetMapping(value = "searchRecipe" , produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
   public List<Recipe_basicVO> searchRecipe(String[] ingredients) {
	   
	   //만약 ajax배열 목록에 아무것도 안 넣고 보내면 null이 들어온다. 그걸 방지하는 것이다.
	   if(ingredients==null) {
		   ingredients= new String[] {};//빈 문자열 배열을 만들어서 넘긴다.
	   }
	   
	   System.out.println("@RestController - searchRecipe() CALLED");
	   
	   List<Recipe_basicVO> from_general_recipe = service.search_RECIPE(ingredients);
	   
	   List<Recipe_basicVO> from_xml_recipe = service.searchEXCEL_RECIPE(ingredients);
	   
	   ArrayList<Recipe_basicVO> all_searched_recipe = new ArrayList<Recipe_basicVO>();
	   
	   all_searched_recipe.addAll(from_general_recipe);
	   all_searched_recipe.addAll(from_xml_recipe);
	   
	   return all_searched_recipe;
   }
   
   
   
   
   
   
   //xml 파일에 있던 내용을 읽어오는 @RestController
   @GetMapping(value= "/getAll_RECIPE_XML", produces = MediaType.APPLICATION_JSON_UTF8_VALUE )
   public List<Recipe_basicVO> getAll_RECIPE_XML() {
      System.out.println("getAll_xml.........Recipe");
      return service.getAll_RECIPE_EXCEL();
   }
   
   
   //관리자나 사용자가 작성한 레시피를 저장하는 테이블의 내용을 읽어오는 @RestController
   @GetMapping(value = "/getAll_RECIPE", produces = MediaType.APPLICATION_JSON_UTF8_VALUE )
   public List<Recipe_basicVO> getAll_RECIPE() {
	      System.out.println("getAll_xml.........Recipe");
	      return service.getAll_RECIPE();
   }
   
   
   //xml 파일로부터 검색해온 내용
   @GetMapping(value = "/searchXML_RECIPE", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
   public List<Recipe_basicVO> searchXML_RECIPE(String[] ingredients) {
	   System.out.println(Arrays.toString(ingredients));
	   return service.searchEXCEL_RECIPE(ingredients);
	   
   }
   
   
   
   //관리자나 사용자가 작성한 것들을 db에서 읽어옴.
   @GetMapping(value = "/search_RECIPE", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
   public List<Recipe_basicVO> search_RECIPE(String[] ingredients) {
	   
	   System.out.println(Arrays.toString(ingredients));
	   return service.search_RECIPE(ingredients);
   }
   
   
   
   
   
   
   
   
   
   
   
   
   @GetMapping(value = "/getjson_recipe_room",produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
   public @ResponseBody Object getjson_basic() {
      Resource resource = new ClassPathResource("/json_recipe_room.json");

      try {
         ObjectMapper mapper = new ObjectMapper();
         
         return mapper.readValue(resource.getInputStream(), Object.class);
         
      } catch (IOException e) {
         e.printStackTrace();
      }
   
      return null;
   }
   
   @GetMapping(value = "/jsonTest", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
   public @ResponseBody Object jsonTest() {
      
      Map<String, Object> map = new HashMap<String, Object>();
      map.put("key1", "value1");
      map.put("key2", "value2");
      map.put("key3", "value3");
      map.put("key4", 50);
      
      try {
         ObjectMapper mapper = new ObjectMapper();
         return mapper.writeValueAsString(map);
         //return mapper.readValue("{\"name\":\"sam\",\"age\":13}");
      
      } catch (Exception e) {
         e.printStackTrace();
      }
      
      return null;
   }
   
   
//   @GetMapping(value = "/getSearch", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
//   public List<Recipe_basicVO> getSearch(String[] ingredients) {
//	      System.out.println("getSearch.........Recipe");
//	      
//	      return service.getSearch(ingredients);
//   }

   //======================================================================================
   
   
}



