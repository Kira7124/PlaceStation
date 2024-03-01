package com.project3.placestation;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/main")
public class MainPageController {
	
	//http://localhost:80/main/index
	@GetMapping("/index")
	public String indexGET() {
		log.debug("index 페이지호출");
		return "main/index";
	}
	
	
	
}
