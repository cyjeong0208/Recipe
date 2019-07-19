package com.solrecipe.recipe.user.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller

public class SampleController {
	
	private static final Logger logger = LoggerFactory.getLogger(SampleController.class);
	
	@RequestMapping(value = "/main")
	public void forGuest() {
		logger.info("for guest");
	}

	@RequestMapping(value = "/sample/admin")
	public void forAdmin() {
		logger.info("for admin");
	}

}