package com.project3.placestation.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project3.placestation.biz.handler.exception.CustomLoginRestfulException;
import com.project3.placestation.biz.model.util.BizDefine;
import com.project3.placestation.biz.model.util.PageReq;
import com.project3.placestation.biz.model.util.PageRes;
import com.project3.placestation.member.dto.MemberHistoryDto;
import com.project3.placestation.repository.entity.Member;
import com.project3.placestation.service.MemberService;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/user") // /member 로 들어가면 자동 로그아웃이 됨?? 왜지
public class memberHistoryController {
	
	@Autowired
	HttpSession httpSession;
	
	@Autowired
	MemberService memberService;

	// ------------ StarsinLiver --------------
	@GetMapping("/mypage/history")
	public String myPageHistory(
			@RequestParam(value = "page" , defaultValue = "0") Integer page,
			@RequestParam(value = "size" , defaultValue = "16") Integer size,
			Model model
			) {
		log.info("거래내역");
		log.info("page : " + page);
		log.info("size : " + size);
		// 1. 유효성 검사
		Member member = (Member) httpSession.getAttribute("member");
		if (member == null) {
			throw new CustomLoginRestfulException(BizDefine.ACCOUNT_IS_NONE, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		log.info("member : " + member.toString());
		
		PageReq pageReq = new PageReq(page , size);
		PageRes<MemberHistoryDto> pageRes = memberService.memberFineAllByUserNo(member.getUserno(), pageReq);
		
        model.addAttribute("history",pageRes.getContent()); // 컨텐츠 배열
        model.addAttribute("currentPage",pageRes.getNumber()); // 현재페이지 번호
        model.addAttribute("totalItems",pageRes.getTotalElements()); // 전체테이블 건수
        model.addAttribute("totalPages",pageRes.getTotalPages()); // 전체 페이지개수
        model.addAttribute("startPage",pageRes.getStartPage()); // 현재 시작 페이지 번호
        model.addAttribute("endPage",pageRes.getEndPage()); // 현재 끝 페이지번호
		
		return "member/mypage_history";
	}
	// ------------ StarsinLiver --------------
}
