package com.project3.placestation.cs.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project3.placestation.admin.dto.Criteria;
import com.project3.placestation.admin.dto.PageVO;
import com.project3.placestation.cs.dto.CsFaqDTO;
import com.project3.placestation.cs.dto.CsNoticeDTO;
import com.project3.placestation.cs.dto.CsQnaDTO;
import com.project3.placestation.repository.entity.CsFaqBoard;
import com.project3.placestation.repository.entity.CsNoticeBoard;
import com.project3.placestation.repository.entity.CsQnaBoard;
import com.project3.placestation.repository.entity.NoticeBoard;
import com.project3.placestation.service.CsService;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/cs")
public class CsController {
	
	@Autowired
	private CsService csService;
	
	private HttpSession httpSession;
	
	// http://localhost/cs/notice
	// CS 공지사항 페이지
	@GetMapping("/notice")
	public String noticeList(CsNoticeDTO csndto, Model model, Criteria cri) throws Exception {
		
		// 페이징
		PageVO pageVO = new PageVO();
		pageVO.setCri(cri);

		pageVO.setTotalCount(csService.CsNoticeBoardCount());
		model.addAttribute("pageVO", pageVO);
		log.info("pageVO1: " + pageVO);

		// 공지사항 리스트 출력
		List<CsNoticeBoard> result1 = csService.CsNoticeBoardListAll(cri);
		model.addAttribute("noticeList", result1);
	
		return "cs/cs_notice";
	}
	
	@GetMapping("/notice/category")
	public String noticeListByCategory(@RequestParam("categoryid") Integer categoryid, CsNoticeDTO csndto, Model model, Criteria cri) throws Exception {
		log.info("categoryid: " + categoryid);
		log.info("categoryid 출력");
		
		// 페이징
	    PageVO pageVO = new PageVO();
	    pageVO.setCri(cri);
	    
	    // 카테고리에 따른 공지사항 수
	    pageVO.setTotalCount(csService.CsNoticeBoardCountByCategory(categoryid, cri));
	    model.addAttribute("pageVO", pageVO);
		
	    // 카테고리에 따른 공지사항 리스트 출력
	   List<CsNoticeBoard> result1 = csService.CsNoticeBoardListByCategory(categoryid, cri);
	   model.addAttribute("noticeList", result1);

	    return "cs/cs_notice";
	}
	
	// CS 공지사항 검색 페이지 출력
//	@GetMapping("/notice-search")
//	public String searchNotice(HttpServletRequest request, Criteria cri, Model model) throws Exception {
//		String searchOption  = request.getParameter("searchOption");
//		String searchKeyword = request.getParameter("searchKeyword");
//		
//		if (searchOption != null && !searchOption.isEmpty()) {
//	        cri.setSearchOption(searchOption);
//	    }
//		
//		
//	    if (searchKeyword != null && !searchKeyword.isEmpty()) {
//	        cri.setSearchKeyword(searchKeyword);
//	    }
//		
//	    PageVO pageVO = new PageVO();
//	    pageVO.setCri(cri);
//	    pageVO.setTotalCount(CsService.countNoticeSearchlist(cri));
//	    
//	    model.addAttribute("pageVO", pageVO);
//	    
//	    List<NoticeBoard> result = CsService.noticeSearchlist(cri);
//	    model.addAttribute("noticelist", result);
//	    return "cs/notice-search";
//		
//		
//	}
	
	// http://localhost/cs/qna
	// CS 1:1 문의 페이지
	@GetMapping("/qna")
	public String qnaList(CsQnaDTO csqdto, Model model, Criteria cri) throws Exception {

		PageVO pageVO = new PageVO();
		pageVO.setCri(cri);

		pageVO.setTotalCount(csService.CsQnaBoardCount());
		model.addAttribute("pageVO", pageVO);
		log.info("pageVO2: " + pageVO);

		// 1:1 문의 리스트 출력
		List<CsQnaBoard> result2 = csService.CsQnaBoardListAll(cri);
		model.addAttribute("qnaList", result2);
		
		return "cs/cs_qna";
	}
	
	// http://localhost/cs/faq
	// CS FAQ 페이지
	@GetMapping("faq")
	public String faqList(CsFaqDTO csfdto, Model model, Criteria cri) throws Exception {

		PageVO pageVO = new PageVO();
		pageVO.setCri(cri);

		pageVO.setTotalCount(csService.CsFaqBoardCount());
		model.addAttribute("pageVO", pageVO);
		log.info("pageVO3: " + pageVO);
		
		// FAQ 리스트 출력
		List<CsFaqBoard> result3 = csService.CsFaqBoardListAll(cri);
		log.info(result3.toString());
		model.addAttribute("faqList", result3);
		
		return "cs/cs_faq";
	}

}
