package product.controller;

import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;
import product.entity.ProductEntity;
import product.repository.ProductRepository;

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
	
	@GetMapping("/main")
	public String productindex(Model model) {
		log.debug("메인 페이지!");
		// 상품 전체 리스트 조회
		List<ProductEntity> products = productRepository.productListAll();
		// 전체 상품 조회 4개
		List<ProductEntity> topProducts = products.stream().limit(4).collect(Collectors.toList());
	    // prod_hit 높은 순서
	    List<ProductEntity> productsHit = products.stream()
                .sorted(Comparator.comparingInt(ProductEntity::getProdHit).reversed())
                .limit(4)
                .collect(Collectors.toList());
	    // prod_rating 높은 순서
	    List<ProductEntity> productsRate = products.stream()
	            .sorted(Comparator.comparingDouble(ProductEntity::getProdRating).reversed())
	    		.limit(4)
	    		.collect(Collectors.toList());
	    // prod_review 높은 순서
	    List<ProductEntity> productsReview = products.stream()
	            .sorted(Comparator.comparingDouble(ProductEntity::getProdReview).reversed())
	    		.limit(4)
	    		.collect(Collectors.toList());
		
	    // 모델에 상품 목록 추가
		model.addAttribute("products", topProducts);
		model.addAttribute("productsHit", productsHit);
		model.addAttribute("productsRate", productsRate);
		model.addAttribute("productsReview", productsReview);
		
		return "product/main";
	}
	
	@GetMapping("/productCate")
	public String producttitle() {
		log.debug("카페고리별 상품 확인");
		return "product/productCate";
	}
	
}
