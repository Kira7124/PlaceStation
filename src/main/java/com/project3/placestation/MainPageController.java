package com.project3.placestation;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project3.placestation.biz.model.dto.ResProductDto;
import com.project3.placestation.product.dto.MainProductReviewDto;
import com.project3.placestation.product.dto.MainProductStarDto;
import com.project3.placestation.repository.entity.Banner;
import com.project3.placestation.repository.entity.Product;
import com.project3.placestation.repository.interfaces.ProductRepository;
import com.project3.placestation.service.BannerService;
import com.project3.placestation.service.ProductService;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/main")
public class MainPageController {
	
	@Autowired
	ProductService productService;
	@Autowired
	ProductRepository productRepository;
	
	@Autowired
	BannerService bannerService;
	
	//http://localhost:80/main/index
	@GetMapping("/index")
	public String indexGET(Model model, HttpSession session) throws Exception {
		
		
		session.setAttribute("increaseProductViews", true);

		
		
		List<Banner> result = bannerService.BannerListMain(); 
		
		
		model.addAttribute("bannerlist", result);
		
		// placestation 추천 상품
		
		// 상품 전체 리스트 조회
		List<ResProductDto> products = productService.findAll();
		// 전체 상품 조회 4개
		List<ResProductDto> topProducts = products.stream().limit(8).collect(Collectors.toList());
		// 리뷰 많은 상품
		List<MainProductReviewDto> productsRev = productRepository.findAllByRev();
		// 평점 높은 상품
		List<MainProductStarDto> productsStar = productRepository.findAllByStar();
		// 최신 상품
		List<Product> productsStart = productRepository.findAllByStart();

		
		log.info("리뷰 많은 상품 : " + productsRev.toString());
		log.info("평점 높은 상품 : " +productsStar.toString());
		log.info("최신 상품 : " +productsStart.toString());
		model.addAttribute("products", topProducts);
		model.addAttribute("productsRev", productsRev);
		model.addAttribute("productsStar", productsStar);
		model.addAttribute("productsStart", productsStart);

		return "product/main";
	}
	
	
}