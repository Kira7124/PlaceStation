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
	
	// http://localhost/cs/notice
	// CS 공지사항 페이지
	@GetMapping("/notice")
	public String noticeList(CsNoticeDTO csndto, Model model) throws Exception {

		List<CsNoticeBoard> result = csService.CsNoticeBoardListAll();
		model.addAttribute("noticeList", result);
	
		return "cs/cs_notice";
	}
	// http://localhost/cs/qna
	// CS 1:1 문의 페이지
	@GetMapping("qna")
	public String qnaList() {
		return "cs/cs_qna";
	}
	
	// http://localhost/cs/faq
	// CS FAQ 페이지
	@GetMapping("faq")
	public String faqList() {
		return "cs/cs_faq";
	}

}
