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
import com.project3.placestation.biz.model.util.PageReq;
import com.project3.placestation.biz.model.util.PageRes;
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


	// CS 공지사항 검색 페이지
	@GetMapping("/notice/search")
	public String noticeSearchlist(@RequestParam(value = "searchKeyword", defaultValue = "") String searchKeyword,
			@RequestParam(value = "categoryId", defaultValue = "0") Integer categoryId,
			@RequestParam(value = "page", defaultValue = "0") Integer page,
			@RequestParam(value = "size", defaultValue = "4") Integer size,

			Model model) throws Exception {

		// 검색 결과에 따른 공지사항 수
		int count = csService.countNoticeSearchlist(searchKeyword, categoryId);

		PageReq pageReq = new PageReq(page, size);
		// 검색 결과에 따른 공지사항 리스트 출력
		List<CsNoticeBoard> result = csService.noticeSearchlist(searchKeyword, categoryId, pageReq);
		
		
		PageRes<CsNoticeBoard> pageRes = new PageRes<>(result, page , count , size);
		log.info("categoryId : "  + categoryId);
		log.info("count : "  + count);
		log.info(pageRes.toString());
		
		model.addAttribute("noticeList", result);
		model.addAttribute("categoryId", categoryId);
		model.addAttribute("searchKeyword", searchKeyword);
        model.addAttribute("currentPage",pageRes.getNumber()); // 컨텐츠 배열
        model.addAttribute("totalPages",pageRes.getTotalPages()); // 컨텐츠 배열
        model.addAttribute("totalItems",pageRes.getTotalElements()); // 컨텐츠 배열
        model.addAttribute("startPage",pageRes.getStartPage()); // 컨텐츠 배열
        model.addAttribute("endPage",pageRes.getEndPage()); // 컨텐츠 배열

		return "cs/cs_notice";
	}



	// http://localhost/cs/qna
	// CS 1:1 문의 페이지
	@GetMapping("/qna")
	public String qnaList(CsQnaDTO csqdto, Model model, Criteria cri,
			@RequestParam(value = "search", defaultValue = "") String search) throws Exception {

		// 유저 -- 세션
		int userId = 1;

		PageVO pageVO = new PageVO();
		pageVO.setCri(cri);

		pageVO.setTotalCount(csService.countCsQnaBoardListByUserId(search, userId, cri));
		model.addAttribute("pageVO", pageVO);
		log.info("pageVO2: " + pageVO);

		// 1:1 문의 리스트 출력
		List<CsQnaBoard> result2 = csService.CsQnaBoardListByUserId(search, userId, cri);
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
