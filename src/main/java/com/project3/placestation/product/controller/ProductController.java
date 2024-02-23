package com.project3.placestation.product.controller;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project3.placestation.biz.handler.exception.CustomRestfulException;
import com.project3.placestation.biz.model.dto.ResProductDto;
import com.project3.placestation.product.dto.ProdReviewDto;
import com.project3.placestation.product.dto.ProductInvalidDateDto;
import com.project3.placestation.product.dto.ProductValidDateTimeDto;
import com.project3.placestation.repository.entity.ProdReview;
import com.project3.placestation.repository.entity.Product;
import com.project3.placestation.repository.interfaces.ProductRepository;
import com.project3.placestation.service.AdminProdHistoryService;
import com.project3.placestation.service.ProdReviewService;
import com.project3.placestation.service.ProductService;

import lombok.extern.slf4j.Slf4j;


@Slf4j
@Controller
@RequestMapping("/product")
public class ProductController {

    private final ProductRepository productRepository;
    private final ProductService productService;
    private final ProdReviewService prodReviewService;

    @Autowired
    public ProductController(ProductRepository productRepository, ProductService productService, ProdReviewService prodReviewService) {
        this.productRepository = productRepository;
        this.productService = productService;
        this.prodReviewService = prodReviewService;
    }
	
	@Autowired
	AdminProdHistoryService adminProdHistoryService;

	
	@GetMapping("/productDetail")
	public String productDetail(@RequestParam("prod_no") Integer prodNo, Model model) {
	    log.debug("상품 상세 페이지 - 상품번호: {}", prodNo);

	    // 상품 번호로 조회
	    ResProductDto product = productService.findById(prodNo);
	    // 상품 번호로 리뷰 조회
	    List<ProdReviewDto> reviewProdNo = prodReviewService.findByRevProdNo(prodNo);
	    List<ProductInvalidDateDto> invalidDate = adminProdHistoryService.findProductInvalidByProdNo(prodNo , "");

	    
	    log.info(invalidDate.toString());
	    model.addAttribute("product", product);
	    model.addAttribute("reviewProdNo", reviewProdNo);
	    model.addAttribute("invalidDate", invalidDate);


	    return "product/productDetail";
	}
	
	// 답글 작성
	@PostMapping("/saveReview")
	public String saveReview(ProdReviewDto dto, @RequestParam("prodNo") Integer prodNo) {
	    dto.setProdNo(prodNo);
		
        prodReviewService.saveReview(dto);
        
	    return "redirect:/product/productDetail?prod_no="+ prodNo;
	}
	// 리뷰 작성
	@PostMapping("/addReview")
	public String addReview(ProdReviewDto dto, @RequestParam("prodNo") Integer prodNo) {
	    dto.setProdNo(prodNo);
		
        prodReviewService.addReview(dto);
        
	    return "redirect:/product/productDetail?prod_no="+ prodNo;
	}
	// 찜(상품 좋아요) 하기
	@PostMapping("/addWishlist")
	public String addWishlist() {
		
		return "";
	}
	
	
	@GetMapping("/main")
	public String mainindex(Model model) {
		log.debug("메인 페이지!");
		// 상품 전체 리스트 조회
		List<ResProductDto> products = productService.findAll();
//		// 전체 상품 조회 4개
		List<ResProductDto> topProducts = products.stream().limit(8).collect(Collectors.toList());
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
