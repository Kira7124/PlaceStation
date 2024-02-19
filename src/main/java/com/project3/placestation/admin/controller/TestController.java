package com.project3.placestation.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/test")
public class TestController {
	
	
	//http://localhost:80/test/main
	
	@GetMapping("/main")
	public String mainGET() {
		log.debug("메인페이지실행완!");
		return "layout/main";
	}
	
	
	
	
	
	
	
	
}
