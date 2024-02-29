package com.project3.placestation.biz.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project3.placestation.biz.model.dto.BizHistoryDto;
import com.project3.placestation.biz.model.dto.MemberToptenDto;
import com.project3.placestation.biz.model.util.PageReq;
import com.project3.placestation.biz.model.util.PageRes;
import com.project3.placestation.service.AdminProdHistoryService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/biz")
public class BizStatisticsController {
	
	@Autowired
	AdminProdHistoryService adminProdHistoryService;

	// http://localhost/biz/statistics
	@GetMapping("/statistics")
	public String statisticsForm(Model model, 
			@RequestParam(value="page" , defaultValue = "0") int page,
			@RequestParam(value="size" , defaultValue = "10") int size , @RequestParam(value = "text" , defaultValue = "") String text) {

		int userId = 1;
		
		PageReq pageReq = new PageReq(page,size);
		PageRes<BizHistoryDto> pageRes = adminProdHistoryService.findByBizId(userId, pageReq , text);

		List<MemberToptenDto> topTen = adminProdHistoryService.findMemberTopFive(userId);
		
        model.addAttribute("history",pageRes.getContent()); // 컨텐츠 배열
        model.addAttribute("currentPage",pageRes.getNumber()); // 현재페이지 번호
        model.addAttribute("totalItems",pageRes.getTotalElements()); // 전체테이블 건수
        model.addAttribute("totalPages",pageRes.getTotalPages()); // 전체 페이지개수
        model.addAttribute("startPage",pageRes.getStartPage()); // 현재 시작 페이지 번호
        model.addAttribute("endPage",pageRes.getEndPage()); // 현재 끝 페이지번호
        model.addAttribute("topTen",topTen); // 사업자 물품중 가장 많이 산 유저 탑 파이브
		
		return "biz/biz_statistics";
	}

	// http://localhost/biz/schedule-management
	@GetMapping("/schedule-management")
	public String scheduleManagementForm() {
		return "biz/biz_schedule_management";
	}
}
