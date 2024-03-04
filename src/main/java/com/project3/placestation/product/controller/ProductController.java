package com.project3.placestation.product.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project3.placestation.biz.model.dto.ResProductDto;
import com.project3.placestation.product.dto.ProdReviewDto;
import com.project3.placestation.product.dto.ProdWishListDto;
import com.project3.placestation.product.dto.ProductInvalidDateDto;
import com.project3.placestation.repository.entity.AdditionExplanation;
import com.project3.placestation.repository.entity.ProdReview;
import com.project3.placestation.repository.entity.Product;
import com.project3.placestation.repository.interfaces.ProductRepository;
import com.project3.placestation.service.AddtionExplanationService;
import com.project3.placestation.service.AdminProdHistoryService;
import com.project3.placestation.service.ProdReviewService;
import com.project3.placestation.service.ProductService;
import com.project3.placestation.service.ProductViewService;

import jakarta.servlet.http.HttpServletRequest;

import com.project3.placestation.service.ProdWishListService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/product")
public class ProductController {
	
	@Autowired
	ProductRepository productRepository;
	@Autowired
	ProductService productService;
	@Autowired
	ProdReviewService prodReviewService;
	@Autowired
	ProdWishListService prodWishListService;
	@Autowired
	AddtionExplanationService addtionExplanationService;
	@Autowired
	AdminProdHistoryService adminProdHistoryService;
	@Autowired
	ProductViewService productViewService;

	//http://localhost:80/productDetail?prod_no=
	@GetMapping("/productDetail")
	public String productDetail(@RequestParam("prod_no") Integer prodNo,
            @RequestParam(name = "pageNo", defaultValue = "1") Integer pageNo,
            Model model) {
		log.debug("상품 상세 페이지 - 상품번호: {}", prodNo);
		
	    // 상품 상세 페이지 접속 시 조회수 증가
	    productViewService.increaseProductViews(prodNo);
	    // 상품 조회수 가져오기
	    int currentViews = productViewService.getProductViews(prodNo);
		// 상품 번호로 조회
		ResProductDto product = productService.findById(prodNo);
		// 상품의 리뷰 개수 조회
        Integer reviewCount = prodReviewService.getCountReview(prodNo);
        
	    // 페이지당 리뷰 수 설정
	    int reviewsPerPage = 5;
	    // 총 페이지 수 계산
	    int totalPage = (int) Math.ceil((double) reviewCount / reviewsPerPage);

		// 상품 번호로 리뷰 조회
		List<ProductInvalidDateDto> invalidDate = adminProdHistoryService.findProductInvalidByProdNo(prodNo, "");
		
	    // 리뷰 목록을 페이징하여 조회
	    List<ProdReviewDto> reviewProdNo = prodReviewService.findByRevProdNoPaged(prodNo, pageNo * (reviewsPerPage - 4), reviewsPerPage);
	    log.debug("페이지번호 : " + pageNo );
	    // 부가 설명 이미지
	    List<AdditionExplanation> additionExplanations = addtionExplanationService.findAll();
	    
        // 상품의 찜 개수 조회
		Integer wishlistCount = prodWishListService.getCountWishlist(prodNo);
        Double avgStar = prodReviewService.getAvgStar(prodNo);
        
        // 부가 설명 이미지 뽑기
        List<AdditionExplanation> list = new ArrayList<>();
        for(String i : product.getAdditionExplanation()) {
        	list.add(additionExplanations.get(Integer.valueOf(i) - 1));
        }
        
        log.info(list.toString());

		log.info(invalidDate.toString());
		model.addAttribute("product", product);
		model.addAttribute("reviewProdNo", reviewProdNo);
		model.addAttribute("invalidDate", invalidDate);
		model.addAttribute("wishlistCount", wishlistCount);
		model.addAttribute("additionExplanations", list);
		model.addAttribute("reviewCount", reviewCount);
		model.addAttribute("avgStar", avgStar);
	    model.addAttribute("pageNo", pageNo); // 현재 페이지 번호 추가
	    model.addAttribute("totalPage", totalPage); // 총 페이지 수 추가
	    model.addAttribute("currentViews", currentViews);

		return "product/productDetail";
	}

	// 답글 작성
	@PostMapping("/saveReview")
	public String saveReview(ProdReviewDto dto, @RequestParam("prodNo") Integer prodNo) {
		dto.setProdNo(prodNo);

		prodReviewService.saveReview(dto);

		return "redirect:/product/productDetail?prod_no=" + prodNo;
	}

	// 리뷰 작성
	@PostMapping("/addReview")
	public String addReview(ProdReviewDto dto, @RequestParam("prodNo") Integer prodNo) {
		dto.setProdNo(prodNo);

		prodReviewService.addReview(dto);

		return "redirect:/product/productDetail?prod_no=" + prodNo;
	}


	// 리뷰 삭제
	@PostMapping("/deleteReview/{prodRevNo}")
	public String deleteReview(@PathVariable("prodRevNo") Integer prodRevNo, @RequestParam("prodNo") Integer prodNo) {
	    prodReviewService.deleteReview(prodRevNo);
	    return "redirect:/product/productDetail?prod_no=" + prodNo;
	}
	
	// 찜(상품 좋아요) 하기
	@PostMapping("/addWishlist")
	public String addWishlist(ProdWishListDto dto, @RequestParam("prodNo") Integer prodNo) {
        dto.setProdNo(prodNo);
        prodWishListService.addWishList(dto);
		return "redirect:/product/productDetail?prod_no=" + prodNo;
	}
	
	// 찜 삭제
    @PostMapping("/deleteWishlist")
    public String deleteWishlist(ProdWishListDto dto, @RequestParam("prodNo") Integer prodNo) {
        dto.setProdNo(prodNo);
        prodWishListService.deleteWishList(dto);
        return "redirect:/product/productDetail?prod_no=" + prodNo;
    }

}