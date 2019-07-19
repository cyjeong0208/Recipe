package com.solrecipe.recipe.recipe;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
 * Handles requests for the application home page.
 */
@Controller
public class recipe_controller {

	private static final Logger logger = LoggerFactory.getLogger(recipe_controller.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */
		@RequestMapping(value = "/recipe_index.do", method = RequestMethod.GET)
		public ModelAndView recipeindex(ModelAndView model/* ,int num */) {
			System.out.println("recipe_index");
			JSONParser parser = new JSONParser();
	
			try {
	
				// 프로젝트 내부 경로로 변경해줘야합니다. 필수!
				Object default_info = parser
						.parse(new FileReader("/Users/yeonjeongchoi/Documents/workspace-sts-3.9.8.RELEASE/recipe/recipe_json/레시피+기본정보_20190705094835.json"));
				Object material_info = parser
						.parse(new FileReader("/Users/yeonjeongchoi/Documents/workspace-sts-3.9.8.RELEASE/recipe/recipe_json/레시피+재료정보_20190705094823.json"));
	
				JSONObject jsonObject = (JSONObject) default_info;
				JSONObject jsonObject3 = (JSONObject) material_info;
	
				JSONArray data = (JSONArray) jsonObject.get("data");
				JSONArray data3 = (JSONArray) jsonObject3.get("data");
	
				List<JSONObject> json_list = new ArrayList<JSONObject>();
				List<JSONObject> material_json_list = new ArrayList<JSONObject>();
				
				
	
				for (int i = 0; i < data.size(); i++) {
					JSONObject dataObject = (JSONObject) data.get(i);
	
					json_list.add(dataObject);
				}
				
				for (int i = 0; i < data3.size(); i++) {
					JSONObject dataObject = (JSONObject) data3.get(i);
	
					material_json_list.add(dataObject);
				}
	
				model.addObject("material_json_list", material_json_list);
				model.addObject("json_list", json_list);
				/* model.addObject("num", num); */
			} catch (FileNotFoundException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			} catch (ParseException e) {
				e.printStackTrace();
			}
	
			model.setViewName("recipe/recipe_index");
	
			return model;
		}

//		@RequestMapping(value = "/student", method = RequestMethod.POST)
//	    public ModelAndView goStudent(HttpServletRequest httpServletRequest) {
//	        
//	        System.out.println("RequestMethod.POST");
//	        
//	        String id = httpServletRequest.getParameter("id");
//	        System.out.println("id : " + id);
//	        
//	        ModelAndView mav = new ModelAndView();
//	        mav.setViewName("student/student2");
//	        mav.addObject("studentId", id);
//	        
//	        return mav; 
//	    }


		@RequestMapping("/recipe_detail.do")
		public ModelAndView recipedetail(ModelAndView model, HttpServletRequest httpServletRequest) {
			System.out.println("RequestMethod.POST");
			JSONParser parser = new JSONParser();

			String recipe_id = httpServletRequest.getParameter("recipe_id");
	        System.out.println("recipe_id : " + recipe_id);
	        
	       
			try {

				// 프로젝트 내부 경로로 변경해줘야합니다. 필수!
				Object default_info = parser
						.parse(new FileReader("/Users/yeonjeongchoi/Documents/workspace-sts-3.9.8.RELEASE/recipe/recipe_json/레시피+기본정보_20190705094835.json"));
				Object process_info = parser
						.parse(new FileReader("/Users/yeonjeongchoi/Documents/workspace-sts-3.9.8.RELEASE/recipe/recipe_json/레시피+과정정보_20190705094841.json"));
				Object material_info = parser
						.parse(new FileReader("/Users/yeonjeongchoi/Documents/workspace-sts-3.9.8.RELEASE/recipe/recipe_json/레시피+재료정보_20190705094823.json"));

				JSONObject jsonObject = (JSONObject) default_info;
				JSONObject jsonObject2 = (JSONObject) process_info;
				JSONObject jsonObject3 = (JSONObject) material_info;

				JSONArray data = (JSONArray) jsonObject.get("data");
				JSONArray data2 = (JSONArray) jsonObject2.get("data");
				JSONArray data3 = (JSONArray) jsonObject3.get("data");

				List<JSONObject> json_list = new ArrayList<JSONObject>();
				List<JSONObject> process_json_list = new ArrayList<JSONObject>();
				List<JSONObject> material_json_list = new ArrayList<JSONObject>();
				
				for (int i = 0; i < data.size(); i++) {
					JSONObject dataObject = (JSONObject) data.get(i);
					
					json_list.add(dataObject);
				}
				
				for (int i = 0; i < data2.size(); i++) {
					JSONObject dataObject = (JSONObject) data2.get(i);

					process_json_list.add(dataObject);

					//System.out.println(dataObject.toString());
				}

				for (int i = 0; i < data3.size(); i++) {
					JSONObject dataObject = (JSONObject) data3.get(i);

					material_json_list.add(dataObject);
				}
				

				model.addObject("material_json_list", material_json_list);
				model.addObject("process_json_list", process_json_list);
				model.addObject("json_list", json_list);
				model.addObject("recipe_id", recipe_id);
				/* model.addObject("num", num); */
			} catch (FileNotFoundException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			} catch (ParseException e) {
				e.printStackTrace();
			}

			model.setViewName("recipe/recipe_detail");

			return model;
		}



	
	}
