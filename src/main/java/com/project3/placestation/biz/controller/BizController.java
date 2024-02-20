package com.project3.placestation.biz.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project3.placestation.biz.model.dto.BizHistoryDto;
import com.project3.placestation.biz.model.dto.ResProductDto;
import com.project3.placestation.biz.model.dto.ScheduleDto;
import com.project3.placestation.biz.model.util.PageReq;
import com.project3.placestation.biz.model.util.PageRes;
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
	public String statisticsForm(Model model, 
			@RequestParam(value="page" , defaultValue = "0") int page,
			@RequestParam(value="size" , defaultValue = "10") int size) {

		int userId = 1;

		PageReq pageReq = new PageReq(page,size);
		PageRes<BizHistoryDto> pageRes = adminProdHistoryService.findByBizId(userId, pageReq);

        model.addAttribute("history",pageRes.getContent()); // 컨텐츠 배열
        model.addAttribute("currentPage",pageRes.getNumber()); // 현재페이지 번호
        model.addAttribute("totalItems",pageRes.getTotalElements()); // 전체테이블 건수
        model.addAttribute("totalPages",pageRes.getTotalPages()); // 전체 페이지개수
        model.addAttribute("startPage",pageRes.getStartPage()); // 현재 시작 페이지 번호
        model.addAttribute("endPage",pageRes.getEndPage()); // 현재 끝 페이지번호

		return "biz/biz_statistics";
	}

	// http://localhost/biz/schedule-management
	@GetMapping("/schedule-management")
	public String scheduleManagementForm() {
		return "biz/biz_schedule_management";
	}



	// http://localhost/biz/product-management
	@GetMapping("/product-management")
	public String productManagementForm(Model model) {

		int userId = 1;

		List<ResProductDto> dto = bizProductService.findAll(userId);
		model.addAttribute("products", dto);
		return "biz/product/biz_product_management";
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
