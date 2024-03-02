package com.project3.placestation.main.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project3.placestation.biz.handler.exception.CustomRestfulException;
import com.project3.placestation.biz.model.dto.ReqProdMainCategoryDto;
import com.project3.placestation.biz.model.dto.ReqProdSubcategoryDto;
import com.project3.placestation.biz.model.util.PageReq;
import com.project3.placestation.biz.model.util.PageRes;
import com.project3.placestation.product.dto.ResProdMainFilterDto;
import com.project3.placestation.service.ProdMajorCategoryService;
import com.project3.placestation.service.ProdSubcategoryService;
import com.project3.placestation.service.ProductService;

import jakarta.servlet.http.HttpServletRequest;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/product")
public class MainController {

	@Autowired
	ProdMajorCategoryService majorCategoryService;

	@Autowired
	ProdSubcategoryService prodSubcategoryService;
	
	@Autowired
	ProductService productService;

	@GetMapping("/search-page")
	public String searchPageForm(@RequestParam(value = "page", defaultValue = "0") int page,
			@RequestParam(value = "size", defaultValue = "3") int size,
			@RequestParam(value = "major-category", defaultValue = "0") int majorCategory,
			@RequestParam(value = "subcategory", defaultValue = "0") int subcategory,
			@RequestParam(value = "search", defaultValue = "") String search,
			@RequestParam(value = "max", defaultValue = "999999") int max,
			@RequestParam(value = "min", defaultValue = "0") int min,
			@RequestParam(value = "star", defaultValue = "0") int star, Model model) {
		// 로그

		// 1. 유효성 검사
		if (page < 0 || size < 0) {
			throw new CustomRestfulException("page 또는 size는 0번 아래일 수 없습니다.", HttpStatus.BAD_REQUEST);
		}
		if (majorCategory < 0 || subcategory < 0) {
			throw new CustomRestfulException("잘못된 카테고리입니다.", HttpStatus.BAD_REQUEST);
		}
		if(max < 0 || min < 0) {
			throw new CustomRestfulException("잘못된 숫자 입니다.", HttpStatus.BAD_REQUEST);
		}
		if(star < 0 || star > 5) {
			throw new CustomRestfulException("잘못된 별점 입니다.", HttpStatus.BAD_REQUEST);
		}

		// 페이징 처리 클래스
		PageReq pageReq = new PageReq(page , size);
				
		// 상품 가져오기
		PageRes<ResProdMainFilterDto> pageRes = productService.findMainAllBysearchAndPriceAndstar(search, min, max, star ,majorCategory , subcategory, pageReq);
		
		// 카테고리 가져오기
		List<ReqProdMainCategoryDto> majorCategoryList = majorCategoryService.findAll(); // 메인 카테고리
		List<ReqProdSubcategoryDto> subcategoryList = prodSubcategoryService.findAll(); // 서브 카테고리
			

		log.info(pageRes.toString());
		model.addAttribute("majorCategoryList", majorCategoryList); // 메인 카테고리
		model.addAttribute("subcategoryList", subcategoryList); // 서브 카테고리
        model.addAttribute("products",pageRes.getContent()); // 컨텐츠 배열
        model.addAttribute("currentPage",pageRes.getNumber()); // 컨텐츠 배열
        model.addAttribute("totalPages",pageRes.getTotalElements()); // 컨텐츠 배열
        model.addAttribute("totalItems",pageRes.getSize()); // 컨텐츠 배열
        model.addAttribute("startPage",pageRes.getStartPage()); // 컨텐츠 배열
        model.addAttribute("endPage",pageRes.getEndPage()); // 컨텐츠 배열
        model.addAttribute("majorCategory", majorCategory); // 컨텐츠 배열
        model.addAttribute("subcategory", subcategory); // 컨텐츠 배열
        model.addAttribute("search", search); // 컨텐츠 배열
        model.addAttribute("max", max); // 컨텐츠 배열
        model.addAttribute("min", min); // 컨텐츠 배열
        model.addAttribute("star", star); // 컨텐츠 배열
		return "product/search_page";
	}
	

}
