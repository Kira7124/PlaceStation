package com.project3.placestation.cs.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project3.placestation.cs.dto.CsNoticeDTO;
import com.project3.placestation.repository.entity.CsNoticeBoard;
import com.project3.placestation.service.CsService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/cs")
public class CsController {
	
	@Autowired
	private CsService csService;
	
//	매핑
	// http://localhost/cs/notice
	@GetMapping("/notice")
	public String noticeList(Model model) throws Exception {

		List<CsNoticeBoard> noticeList = csService.CsNoticeBoardListAll();
		System.out.println("----------");
		model.addAttribute("noticeList", noticeList);
		System.out.println("----------");
	
		
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
