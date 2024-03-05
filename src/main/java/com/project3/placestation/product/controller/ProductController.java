package com.project3.placestation.product.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project3.placestation.biz.handler.exception.CustomLoginRestfulException;
import com.project3.placestation.biz.model.dto.ResProductDto;
import com.project3.placestation.biz.model.util.BizDefine;
import com.project3.placestation.payment.model.dto.PaymentMemberDto;
import com.project3.placestation.product.dto.ProdReviewDto;
import com.project3.placestation.product.dto.ProdWishListDto;
import com.project3.placestation.product.dto.ProductInvalidDateDto;
import com.project3.placestation.product.dto.ResProductViewDto;
import com.project3.placestation.repository.entity.AdditionExplanation;
import com.project3.placestation.repository.entity.Member;
import com.project3.placestation.repository.interfaces.ProductRepository;
import com.project3.placestation.service.AddtionExplanationService;
import com.project3.placestation.service.AdminProdHistoryService;
import com.project3.placestation.service.MemberService;
import com.project3.placestation.service.ProdReviewService;
import com.project3.placestation.service.ProdWishListService;
import com.project3.placestation.service.ProductService;
import com.project3.placestation.service.ProductViewService;

import jakarta.servlet.http.HttpSession;
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
	@Autowired
	MemberService memberService;
	
	@Autowired
	HttpSession httpSession;

	//http://localhost:80/productDetail?prod_no=
	@GetMapping("/productDetail")
	public String productDetail(@RequestParam("prod_no") Integer prodNo,
	        @RequestParam(name = "pageNo", defaultValue = "1") Integer pageNo,
	        Model model, HttpSession session) throws Exception {
	    
	    // 조회수 세션 저장 (새로고침 조회수 증가 x)
	    Boolean increaseProductViews = (Boolean) session.getAttribute("increaseProductViews");
	    if (increaseProductViews == null || increaseProductViews) {
	        productViewService.increaseProductViews(prodNo);
	        session.setAttribute("increaseProductViews", false);
	    }
	    // 상품 조회수 가져오기
	    ResProductViewDto currentViews = productViewService.getProductViews(prodNo);
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
	    // 리뷰 목록의 작성자 정보 설정
	    for (ProdReviewDto review : reviewProdNo) {
	        PaymentMemberDto reviewer = memberService.findMemberById(review.getUserNo());
	        if (reviewer != null) {
	            review.setUserName(reviewer.getUserName());
	        }
	    }
	    // 상품의 사업자명 설정
	    PaymentMemberDto writer = memberService.findMemberById(product.getProdWriterNo());
	    if (writer != null) {
	        product.setUserName(writer.getUserName());
	    }
	    // 부가 설명 이미지
	    List<AdditionExplanation> additionExplanations = addtionExplanationService.findAll();
	    
	    // 현재 로그인한 사용자의 정보 가져오기
	    Member member = (Member) session.getAttribute("member");
	    if (member != null) {
		    // 로그인한 사용자의 찜 목록에 해당 상품이 있는지 확인
	        boolean isProductInWishlist = prodWishListService.isProductInWishlist(prodNo, member.getUserno());
	        model.addAttribute("isProductInWishlist", isProductInWishlist);
	    }
	    

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
	    model.addAttribute("currentViews", currentViews.getProdViews());

	    return "product/productDetail";
	}

	// 답글 작성
	@PostMapping("/saveReview")
	public String saveReview(ProdReviewDto dto, @RequestParam("prodNo") Integer prodNo) {
		dto.setProdNo(prodNo);
		
	    // 유효성 검사
	    if (dto.getUserNo() == null) {
	        throw new CustomLoginRestfulException("로그인 후 작성해주시기 바랍니다.", HttpStatus.INTERNAL_SERVER_ERROR);
	    }
		prodReviewService.saveReview(dto);

		return "redirect:/product/productDetail?prod_no=" + prodNo;
	}

	// 리뷰 작성
	@PostMapping("/addReview")
	public String addReview(ProdReviewDto dto, @RequestParam("prodNo") Integer prodNo, Model model, HttpSession session) {
		dto.setProdNo(prodNo);

		
		// 멤버 받기
		Member member = (Member) session.getAttribute("member"); 
		if(member == null) {
			throw new CustomLoginRestfulException(BizDefine.ACCOUNT_IS_NONE, HttpStatus.INTERNAL_SERVER_ERROR);
		}

	    prodReviewService.addReview(dto);

		PaymentMemberDto memberDto = memberService.findMemberById(member.getUserno());
		
	    model.addAttribute("member", memberDto);
	    
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
		// 멤버 받기
		Member member = (Member) httpSession.getAttribute("member"); 
		if(member == null) {
			throw new CustomLoginRestfulException(BizDefine.ACCOUNT_IS_NONE, HttpStatus.INTERNAL_SERVER_ERROR);
		}
        dto.setProdNo(prodNo);
        dto.setUserNo(member.getUserno());
        prodWishListService.addWishList(dto);
		return "redirect:/product/productDetail?prod_no=" + prodNo;
	}

	// 찜 삭제
    @PostMapping("/deleteWishlist")
    public String deleteWishlist(ProdWishListDto dto, @RequestParam("prodNo") Integer prodNo) {
    	
		// 멤버 받기
		Member member = (Member) httpSession.getAttribute("member"); 
		if(member == null) {
			throw new CustomLoginRestfulException(BizDefine.ACCOUNT_IS_NONE, HttpStatus.INTERNAL_SERVER_ERROR);
		}
        dto.setProdNo(prodNo);
        dto.setUserNo(member.getUserno());
        prodWishListService.deleteWishList(dto);
        return "redirect:/product/productDetail?prod_no=" + prodNo;
    }


}