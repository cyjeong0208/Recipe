package com.solrecipe.recipe.main.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.solrecipe.recipe.foodvideo.FoodVideoService;
import com.solrecipe.recipe.foodvideo.FoodVideoVO;
import com.solrecipe.recipe.recipegram.domain.RecipegramVO;
import com.solrecipe.recipe.recipegram.service.RecipegramService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class MainController {

	@Autowired
	RecipegramService recipegramServiceImpl;

	@Autowired
	FoodVideoService foodVideoServiceImpl;

	@RequestMapping(value = {"/main_fvList"}, method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String main_video() {
		List<FoodVideoVO> bestList = foodVideoServiceImpl.getBestList();
		// model.addAttribute("Main_bestList", bestList);
		String fvList = "";

		ObjectMapper mapper = new ObjectMapper();

		try {
			fvList = mapper.writeValueAsString(bestList); // json형식의 문자로 변형해서 저장함
		} catch (Exception e) {
			System.out.println("first() mapper : " + e.getMessage());
		}
		return fvList;
	}

	@RequestMapping(value = "/main_rgList", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String main_rgList() {
		List<RecipegramVO> rgList3 = recipegramServiceImpl.main_rgList();
		// model.addAttribute("Main_rgList", recipegramServiceImpl.main_rgList());

		String rgList = "";

		ObjectMapper mapper = new ObjectMapper();

		try {
			rgList = mapper.writeValueAsString(rgList3); // json형식의 문자로 변형해서 저장함
		} catch (Exception e) {
			System.out.println("second() mapper : " + e.getMessage());
		}
		return rgList;
	}
	
	@RequestMapping(value="/main", method=RequestMethod.GET)
	public ModelAndView main_crawl(ModelAndView model) {
		
		String url_hp = "http://www.homeplus.co.kr/app.exhibition.cheapershop.CheaperShop.ghs?comm=usr.cheapershop&WT.ac=Main_GNB_ssaday";
		String url_lt = "http://www.lottemart.com/plan/planDetail.do?CategoryID=C20600090001&GroupCd=01";
		String url_em = "http://emart.ssg.com/sale/main.ssg?Egnb=sale"; 
		
		Document doc_hp = null;
		Document doc_lt = null;
		Document doc_em = null;
		
		try {
			doc_hp = Jsoup.connect(url_hp).get();	// 해당url을 get이라는 메서드를 이용해서 가져옴
			doc_lt = Jsoup.connect(url_lt).get();
			doc_em = Jsoup.connect(url_em).get();
		}catch(IOException e){
			e.printStackTrace();
		}
		
		Elements element1 = doc_hp.select("div.exh-comimg");
		Elements element2 = doc_hp.select("div.exh-comtxt");
		
		ArrayList<String> hp_img = new ArrayList<String>();
		ArrayList<String> hp_title = new ArrayList<String>();
		ArrayList<String> hp_cost = new ArrayList<String>();
		ArrayList<String> hp_buy = new ArrayList<String>();

		for(Element el_img : element1.select(".blank204")) {
			String img_text = el_img.attr("src");
			hp_img.add(img_text);
		}
		for(Element el_title : element2.select(".name")) {
			String title_text = el_title.text().toString();
			hp_title.add(title_text);
		}
		for(Element el_cost : element2.select(".cost")) {
			String cost_text = el_cost.ownText().toString();
			hp_cost.add(cost_text);
		}
		for(Element el_buy : element2.select(".buy")) {
			String buy_text = el_buy.text().toString();
			hp_buy.add(buy_text);
		}
		
		model.addObject("hp_img", hp_img);
		model.addObject("hp_title", hp_title);
		model.addObject("hp_cost", hp_cost);
		model.addObject("hp_buy", hp_buy);
		
		Elements element3 = doc_lt.select("div.wrap-thumb");
		Elements element4 = doc_lt.select("div.wrap-info");
		
		ArrayList<String> lt_img = new ArrayList<String>();
		ArrayList<String> lt_title = new ArrayList<String>();
		ArrayList<String> lt_cost = new ArrayList<String>();
		ArrayList<String> lt_buy = new ArrayList<String>();
		
		for(Element el_img : element3.select("img")) {
			String img_text = el_img.attr("src");
			lt_img.add(img_text);
		}
		for(Element el_title : element4.select("strong>a")) {
			String title_text = el_title.text().toString();
			lt_title.add(title_text);
		}
		for(Element el_buy : element4.select(".num-n")) {
			String buy_text = el_buy.text().toString();
			lt_buy.add(buy_text);
		}
		
		model.addObject("lt_img", lt_img);
		model.addObject("lt_title", lt_title);
		model.addObject("lt_buy", lt_buy);
		
		Elements element5 = doc_em.select("div.thmb");
		Elements element6 = doc_em.select("div.cunit_info");
		
		ArrayList<String> em_img = new ArrayList<String>();
		ArrayList<String> em_title = new ArrayList<String>();
		ArrayList<String> em_cost = new ArrayList<String>();
		ArrayList<String> em_buy = new ArrayList<String>();
		
		for(Element el_img : element5.select(".i1")) {
			String img_text = el_img.attr("src");
			em_img.add(img_text);
		}
		for(Element el_title : element6.select("a>.tx_ko")) {
			String title_text = el_title.text().toString();
			em_title.add(title_text);
		}
		for(Element el_cost : element6.select(".org_price>.ssg_price")) {
			String cost_text = el_cost.ownText().toString();
			em_cost.add(cost_text);
		}
		for(Element el_buy : element6.select(".opt_price>.ssg_price")) {
			String buy_text = el_buy.text().toString();
			em_buy.add(buy_text);
		}
		
		model.addObject("em_img", em_img);
		model.addObject("em_title", em_title);
		model.addObject("em_cost", em_cost);
		model.addObject("em_buy", em_buy);
		
		model.setViewName("main");
		
		return model;
	}
	
}
