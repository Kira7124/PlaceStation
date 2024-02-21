package com.project3.placestation.cs.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project3.placestation.service.CsService;


@Controller
@RequestMapping("/cs")
public class CsController {
	
	@Autowired
	private CsService csService;
	
//	매핑
	// http://localhost/cs/notice
	@GetMapping("/notice")
	public String noticeList() {
		return "cs/cs_notice";
	}
	
	// http://localhost/cs/qna
	@GetMapping("qna")
	public String qnaList() {
		return "cs/cs_qna";
	}
	
	// http://localhost/cs/faq
	@GetMapping("faq")
	public String faqList() {
		return "cs/cs_faq";
	}
	
	// http://localhost/cs/write
	@GetMapping("/write")
	public String csWrite() {
		return "cs/cs_write";
	}
	

}
