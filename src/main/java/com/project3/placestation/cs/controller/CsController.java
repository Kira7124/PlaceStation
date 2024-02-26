package com.project3.placestation.cs.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project3.placestation.cs.dto.CsFaqDTO;
import com.project3.placestation.cs.dto.CsNoticeDTO;
import com.project3.placestation.cs.dto.CsQnaDTO;
import com.project3.placestation.repository.entity.CsFaqBoard;
import com.project3.placestation.repository.entity.CsNoticeBoard;
import com.project3.placestation.repository.entity.CsQnaBoard;
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
	
		// 공지사항 리스트 출력
		List<CsNoticeBoard> result1 = csService.CsNoticeBoardListAll();
		model.addAttribute("noticeList", result1);
	
		return "cs/cs_notice";
	}
	
	// http://localhost/cs/qna
	// CS 1:1 문의 페이지
	@GetMapping("/qna")
	public String qnaList(CsQnaDTO csqdto, Model model) throws Exception {

		// 1:1 문의 리스트 출력
		List<CsQnaBoard> result2 = csService.CsQnaBoardListAll();
		model.addAttribute("qnaList", result2);
		
		return "cs/cs_qna";
	}
	
	// http://localhost/cs/faq
	// CS FAQ 페이지
	@GetMapping("faq")
	public String faqList(CsFaqDTO csfdto, Model model) throws Exception {
		
		// FAQ 리스트 출력
		List<CsFaqBoard> result3 = csService.CsFaqBoardListAll();
		log.info(result3.toString());
		model.addAttribute("faqList", result3);
		
		return "cs/cs_faq";
	}

}
