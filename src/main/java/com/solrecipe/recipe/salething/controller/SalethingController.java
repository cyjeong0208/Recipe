package com.solrecipe.recipe.salething.controller;

import java.io.IOException;
import java.util.ArrayList;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SalethingController {
//	Document 클래스 : 연결해서 얻어온 HTML전체문서
//	Element 클래스 : Document의 HTML 요소
//	Element 클래스 : Element가 모인 자료형
	
//	select(tag.className) >> 클래스 명을 지정해서 해당하는 데이터를 가져옵니다.
//  select(tag#id) >> id를 지정해서 해당하는 데이터를 가져옵니다.
//  select(tag[attribute]) >> 애트리뷰트를 지정해서 해당하는 데이터를 가져옵니다.
//  select(parent Tag > child Tag) >> 부모 태그의 하위 자식태그를 지정해서 해당하는 데이터를 가져옵니다.

	@RequestMapping(value="/salething_homeplus", method=RequestMethod.GET)
	public ModelAndView homeplus_crawl(ModelAndView model) {
		
		String url = "http://www.homeplus.co.kr/app.exhibition.cheapershop.CheaperShop.ghs?comm=usr.cheapershop&WT.ac=Main_GNB_ssaday";
		Document doc = null;	//Document에는 페이지의 전체 소스가 저장된다
		
		try {
			doc = Jsoup.connect(url).get();	// 해당url을 get이라는 메서드를 이용해서 가져옴
		}catch(IOException e){
			e.printStackTrace();
		}
		
		//select를 이용하여 원하는 태그를 선택한다. select는 원하는 값을 가져오기 위한 중요한 기능이다.
		Elements element1 = doc.select("div.exh-comimg");
		Elements element2 = doc.select("div.exh-comtxt");
		
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
		model.setViewName("salething/salething_homeplus");
		
		return model;
	}
	
	@RequestMapping(value="/salething_lotte", method=RequestMethod.GET)
	public ModelAndView lotte_crawl(ModelAndView model) {
		
		String url = "http://www.lottemart.com/plan/planDetail.do?CategoryID=C20600090001&GroupCd=01";
		Document doc = null;
		
		try {
			doc = Jsoup.connect(url).get();	// 해당url을 get이라는 메서드를 이용해서 가져옴
		}catch(IOException e){
			e.printStackTrace();
		}
		
		Elements element1 = doc.select("div.wrap-thumb");
		Elements element2 = doc.select("div.wrap-info");
		
		ArrayList<String> lt_img = new ArrayList<String>();
		ArrayList<String> lt_title = new ArrayList<String>();
		ArrayList<String> lt_cost = new ArrayList<String>();
		ArrayList<String> lt_buy = new ArrayList<String>();
		
		for(Element el_img : element1.select("img")) {
			String img_text = el_img.attr("src");
			lt_img.add(img_text);
		}
		for(Element el_title : element2.select("strong>a")) {
			String title_text = el_title.text().toString();
			lt_title.add(title_text);
		}
		for(Element el_buy : element2.select(".num-n")) {
			String buy_text = el_buy.text().toString();
			lt_buy.add(buy_text);
		}
		
		model.addObject("lt_img", lt_img);
		model.addObject("lt_title", lt_title);
		model.addObject("lt_buy", lt_buy);
		model.setViewName("salething/salething_lotte");
		
		return model;
	}
	
	@RequestMapping(value="/salething_emart", method=RequestMethod.GET)
	public ModelAndView emart_crawl(ModelAndView model) {
		
		String url = "http://emart.ssg.com/sale/main.ssg?Egnb=sale";
		Document doc = null;
		
		try {
			doc = Jsoup.connect(url).get();	// 해당url을 get이라는 메서드를 이용해서 가져옴
		}catch(IOException e){
			e.printStackTrace();
		}
		
		Elements element1 = doc.select("div.thmb");
		Elements element2 = doc.select("div.cunit_info");
		
		ArrayList<String> em_img = new ArrayList<String>();
		ArrayList<String> em_title = new ArrayList<String>();
		ArrayList<String> em_cost = new ArrayList<String>();
		ArrayList<String> em_buy = new ArrayList<String>();
		
		for(Element el_img : element1.select(".i1")) {
			String img_text = el_img.attr("src");
			em_img.add(img_text);
		}
		for(Element el_title : element2.select("a>.tx_ko")) {
			String title_text = el_title.text().toString();
			em_title.add(title_text);
		}
		for(Element el_cost : element2.select(".org_price>.ssg_price")) {
			String cost_text = el_cost.ownText().toString();
			em_cost.add(cost_text);
		}
		for(Element el_buy : element2.select(".opt_price>.ssg_price")) {
			String buy_text = el_buy.text().toString();
			em_buy.add(buy_text);
		}
		
		model.addObject("em_img", em_img);
		model.addObject("em_title", em_title);
		model.addObject("em_cost", em_cost);
		model.addObject("em_buy", em_buy);
		model.setViewName("salething/salething_emart");
		
		return model;
	}
	
	/*
	 * @RequestMapping(value="/main", method=RequestMethod.GET) public ModelAndView
	 * main_sale(ModelAndView model) {
	 * 
	 * return model; }
	 */
}
