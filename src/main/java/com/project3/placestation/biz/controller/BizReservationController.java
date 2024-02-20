package com.project3.placestation.biz.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project3.placestation.biz.model.dto.BizHistoryDto;
import com.project3.placestation.biz.model.util.PageReq;
import com.project3.placestation.biz.model.util.PageRes;
import com.project3.placestation.service.AdminProdHistoryService;
import com.project3.placestation.service.ProductService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/biz")
public class BizReservationController {
	
	@Autowired
	ProductService bizProductService;

	@Autowired
	AdminProdHistoryService adminProdHistoryService;
	
	// http://localhost/biz/reservation-management
	@GetMapping("/reservation-management")
	public String reservationManagementForm(Model model, 
			@RequestParam(value="page" , defaultValue = "0") int page,
			@RequestParam(value="size" , defaultValue = "20") int size) {

		int userId = 1;

		PageReq pageReq = new PageReq(page,size);
		PageRes<BizHistoryDto> pageRes = adminProdHistoryService.findByBizId(userId, pageReq);

        model.addAttribute("history",pageRes.getContent()); // 컨텐츠 배열

		return "biz/reservation/biz_reservation_management";
	}
	
}
