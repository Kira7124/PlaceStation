package com.project3.placestation.biz.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project3.placestation.biz.model.dto.BizHistoryDto;
import com.project3.placestation.biz.model.dto.ResProductDto;
import com.project3.placestation.service.AdminProdHistoryService;
import com.project3.placestation.service.ProductService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/biz")
public class BizController {

	@Autowired
	ProductService bizProductService;

	@Autowired
	AdminProdHistoryService adminProdHistoryService;

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

	// http://localhost/biz/schedule-management
	@GetMapping("/schedule-management")
	public String scheduleManagementForm() {
		return "biz/biz_schedule_management";
	}

	// http://localhost/biz/reservation-management
	@GetMapping("/reservation-management")
	public String reservationManagementForm(Model model) {

		int userId = 1;

		List<BizHistoryDto> bizHistoryDto = adminProdHistoryService.findByBizId(userId);
		
		model.addAttribute("historys" , bizHistoryDto);
		return "biz/reservation/biz_reservation_management";
	}

	// http://localhost/biz/product-management
	@GetMapping("/product-management")
	public String productManagementForm(Model model) {

		int userId = 1;

		List<ResProductDto> dto = bizProductService.findAll(userId);
		model.addAttribute("products", dto);
		return "biz/product/biz_product_management";
	}

	// http://localhost/biz/account-management
	@GetMapping("/account-management")
	public String accountManagementForm(Model model) {

//		model.addAttribute("biz" , "");
		return "biz/account/biz_account_management";
	}

	// http://localhost/biz/add-product
	@GetMapping("/add-product-form")
	public String addProducttForm() {
		return "biz/product/biz_add_product";
	}

	// http://localhost/biz/update-product-form/{prodNo}
	@GetMapping("/update-product-form/{prodNo}")
	public String updateProductForm(@PathVariable(value = "prodNo") int prodNo, Model model) {
		ResProductDto dto = bizProductService.findById(prodNo);
		log.info(dto.toString());
		model.addAttribute("product", dto);
		return "biz/product/biz_update_product";
	}
}
