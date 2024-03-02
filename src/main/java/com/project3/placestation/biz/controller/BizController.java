package com.project3.placestation.biz.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project3.placestation.biz.handler.exception.CustomLoginRestfulException;
import com.project3.placestation.biz.model.util.BizDefine;
import com.project3.placestation.repository.entity.Member;
import com.project3.placestation.service.AdminProdHistoryService;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/biz")
public class BizController {
	
	@Autowired
	AdminProdHistoryService adminProdHistoryService;

	@Autowired
	HttpSession httpSession;
	
	// http://localhost/biz/main
	@GetMapping("/main")
	public String mainForm() {
		// 유효성 검사
		Member member = (Member) httpSession.getAttribute("member"); 

		if(member == null || member.getToken() == null || member.getToken().isEmpty()) {
			throw new CustomLoginRestfulException(BizDefine.ACCOUNT_IS_NONE, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return "biz/biz_main";
	}


}