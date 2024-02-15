package com.project3.placestation.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project3.placestation.repository.entity.Product;
import com.project3.placestation.repository.interfaces.ProductRepository;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/product")
public class ProductController {
	
	private final ProductRepository productRepository;
	
	public ProductController(ProductRepository productRepository) {
		this.productRepository = productRepository;
	}

	@GetMapping("/productPlace")
	public String productTest() {
		log.debug("상품상세 페이지 !!");
		
		return "product/productPlace";
	}
	
	@GetMapping("/index")
	public String productindex(Model model) {
		log.debug("상품 메인");
		
		// 상품 전체 리스트 조회
		List<Product> products = productRepository.productListAll();
		// 모델에 상품 목록 추가
		model.addAttribute("products", products);
		
		return "product/index_shop";
	}
	
	@GetMapping("/productcol")
	public String producttitle() {
		log.debug("카페고리별 확인");
		return "product/shop_product_col_4";
	}
	
}
