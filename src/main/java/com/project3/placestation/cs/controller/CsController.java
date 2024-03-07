package com.project3.placestation.cs.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project3.placestation.admin.dto.Criteria;
import com.project3.placestation.admin.dto.PageVO;
import com.project3.placestation.biz.handler.exception.CustomLoginRestfulException;
import com.project3.placestation.biz.model.util.BizDefine;
import com.project3.placestation.biz.model.util.PageReq;
import com.project3.placestation.biz.model.util.PageRes;
import com.project3.placestation.cs.dto.CsFaqDTO;
import com.project3.placestation.cs.dto.CsNoticeDTO;
import com.project3.placestation.cs.dto.CsQnaDTO;
import com.project3.placestation.repository.entity.CsFaqBoard;
import com.project3.placestation.repository.entity.CsNoticeBoard;
import com.project3.placestation.repository.entity.CsQnaBoard;
import com.project3.placestation.repository.entity.Member;
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

	@Autowired
	private HttpSession httpSession;


	// http://localhost/cs/notice
	// CS 공지사항 페이지
	@GetMapping("/notice")
	public String noticeList(CsNoticeDTO csndto, Model model, Criteria cri) throws Exception {
	
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
	



	// http://localhost/cs/qna
	// CS 1:1 문의 페이지
	@GetMapping("/qna")
	public String qnaList(CsQnaDTO csqdto, Model model, Criteria cri,
			@RequestParam(value = "search", defaultValue = "") String search) throws Exception {

		// 1. 유효성 검사
		Member member = (Member) httpSession.getAttribute("member");
		if (member == null) {
			throw new CustomLoginRestfulException(BizDefine.ACCOUNT_IS_NONE, HttpStatus.INTERNAL_SERVER_ERROR);
		}

		PageVO pageVO = new PageVO();
		pageVO.setCri(cri);

		pageVO.setTotalCount(csService.countCsQnaBoardListByUserId(search, member.getUserno(), cri));
		model.addAttribute("pageVO", pageVO);
		log.info("pageVO2: " + pageVO);

		// 1:1 문의 리스트 출력
		List<CsQnaBoard> result2 = csService.CsQnaBoardListByUserId(search, member.getUserno(), cri);
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
