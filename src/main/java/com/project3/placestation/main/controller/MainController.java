package com.project3.placestation.main.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project3.placestation.biz.model.dto.ReqProdMainCategoryDto;
import com.project3.placestation.biz.model.dto.ReqProdSubcategoryDto;
import com.project3.placestation.service.ProdMajorCategoryService;
import com.project3.placestation.service.ProdSubcategoryService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/product")
public class MainController {

	@Autowired
	ProdMajorCategoryService majorCategoryService;

	@Autowired
	ProdSubcategoryService prodSubcategoryService;

	@GetMapping("/search-page")
	public String searchPageForm(@RequestParam(value = "page", defaultValue = "0") int page,
			@RequestParam(value = "size", defaultValue = "16") int size,
			@RequestParam(value = "major-category", defaultValue = "1") int majorCategory,
			@RequestParam(value = "subcategory", defaultValue = "1") int subcategory ,
			@RequestParam(value = "search", defaultValue = "") String search,
			@RequestParam(value = "max", defaultValue = "99999999") String max,
			@RequestParam(value = "min", defaultValue = "0") String min,
			@RequestParam(value = "star", defaultValue = "1") String star,
			Model model) {
		// 카테고리 가져오기
		List<ReqProdMainCategoryDto> majorCategoryList = majorCategoryService.findAll(); // 메인 카테고리
		List<ReqProdSubcategoryDto> subcategoryList = prodSubcategoryService.findAll(); // 서브 카테고리

		log.info("page : " + page);
		log.info("size : " + size);
		log.info("majorCategory : " + majorCategory);
		log.info("majorCategory : " + majorCategory);
		log.info("subcategory : " + subcategory);
		log.info("search : " + search);
		log.info("star : " + star);
		model.addAttribute("majorCategoryList", majorCategoryList);
		model.addAttribute("subcategoryList", subcategoryList);
		return "product/search_page";
	}
}
