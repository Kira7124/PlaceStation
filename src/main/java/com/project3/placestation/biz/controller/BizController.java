package com.project3.placestation.biz.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project3.placestation.service.AdminProdHistoryService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/biz")
public class BizController {
	
	@Autowired
	AdminProdHistoryService adminProdHistoryService;

	// http://localhost/biz/main
	@GetMapping("/main")
	public String mainForm() {
		return "biz/biz_main";
	}


}