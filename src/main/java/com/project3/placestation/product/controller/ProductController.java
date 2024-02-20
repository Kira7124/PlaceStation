package com.project3.placestation.product.controller;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project3.placestation.biz.model.dto.ResProductDto;
import com.project3.placestation.repository.entity.ProdReview;
import com.project3.placestation.repository.entity.Product;
import com.project3.placestation.repository.interfaces.ProductRepository;
import com.project3.placestation.service.ProductService;

import lombok.extern.slf4j.Slf4j;


@Slf4j
@Controller
@RequestMapping("/product")
public class ProductController {

	private final ProductRepository productRepository;
	
	@Autowired
	ProductService productService;

	public ProductController(ProductRepository productRepository) {
		this.productRepository = productRepository;
	}

	@GetMapping("/productDetail")
	public String productDetail(@RequestParam("prod_no") Integer prodNo, Model model) {
	    log.debug("상품 상세 페이지 - 상품번호: {}", prodNo);
	    
	    // 상품 번호로 조회
	    ResProductDto product = productService.findById(prodNo);
	    
	    model.addAttribute("product", product);
	    
	    return "product/productDetail";
	}

	@GetMapping("/main")
	public String mainindex(Model model) {
		log.debug("메인 페이지!");
		// 상품 전체 리스트 조회
		List<Product> products = productRepository.findAll();
		// 전체 상품 조회 4개
		List<Product> topProducts = products.stream().limit(4).collect(Collectors.toList());
		// 리뷰 많은 상품
		List<ProdReview> productsRev = productRepository.findAllByRev();
		// 평점 높은 상품
		List<Product> productsStar = productRepository.findAllByStar();
		// 최신 상품
		List<Product> productsStart = productRepository.findAllByStart();

		model.addAttribute("products", topProducts);
		model.addAttribute("productsRev", productsRev);
		model.addAttribute("productsStar", productsStar);
		model.addAttribute("productsStart", productsStart);

		return "product/main";
	}

	@GetMapping("/productCate")
	public String producttitle() {
		log.debug("카페고리별 상품 확인");
		return "product/productCate";
	}

}
