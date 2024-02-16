package com.project3.placestation.biz.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/biz")
public class bizController {

	// http://localhost/biz/main
	@GetMapping("/main")
	public String mainForm() {
		return "biz/biz_main";
	}
	
	// http://localhost/biz/statistics
	@GetMapping("/statistics")
	public String statisticsForm() {
		return "biz/biz_statistics";
	}
	
	// http://localhost/biz/statistics
	@GetMapping("/schedule-management")
	public String scheduleManagementForm() {
		return "biz/biz_schedule_management";
	}
	
	// http://localhost/biz/reservation-management
	@GetMapping("/reservation-management")
	public String reservationManagementForm() {
		return "biz/biz_reservation_management";
	}
	
	// http://localhost/biz/product-management
	@GetMapping("/product-management")
	public String productManagementForm() {
		return "biz/biz_product_management";
	}
	
	// http://localhost/biz/account-management
	@GetMapping("/account-management")
	public String accountManagementForm() {
		return "biz/biz_account_management";
	}
}
