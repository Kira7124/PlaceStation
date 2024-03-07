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
import com.project3.placestation.biz.handler.exception.CustomRestfulException;
import com.project3.placestation.biz.model.dto.ReqProdMainCategoryDto;
import com.project3.placestation.biz.model.dto.ReqProdSubcategoryDto;
import com.project3.placestation.biz.model.dto.ResProductDto;
import com.project3.placestation.biz.model.util.BizDefine;
import com.project3.placestation.biz.model.util.PageReq;
import com.project3.placestation.biz.model.util.PageRes;
import com.project3.placestation.payment.model.dto.PaymentMemberDto;
import com.project3.placestation.product.dto.ProdReviewDto;
import com.project3.placestation.product.dto.ProdWishListDto;
import com.project3.placestation.product.dto.ProductInvalidDateDto;
import com.project3.placestation.product.dto.ResProdMainFilterDto;
import com.project3.placestation.product.dto.ResProductViewDto;
import com.project3.placestation.repository.entity.AdditionExplanation;
import com.project3.placestation.repository.entity.Member;
import com.project3.placestation.repository.interfaces.ProductRepository;
import com.project3.placestation.service.AddtionExplanationService;
import com.project3.placestation.service.AdminProdHistoryService;
import com.project3.placestation.service.MemberService;
import com.project3.placestation.service.ProdMajorCategoryService;
import com.project3.placestation.service.ProdReviewService;
import com.project3.placestation.service.ProdSubcategoryService;
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
	ProdMajorCategoryService majorCategoryService;

	@Autowired
	ProdSubcategoryService prodSubcategoryService;

	@Autowired
	HttpSession httpSession;

	// http://localhost:80/productDetail?prod_no=
	@GetMapping("/productDetail")
	public String productDetail(@RequestParam("prod_no") Integer prodNo,
			@RequestParam(name = "pageNo", defaultValue = "0") Integer pageNo, Model model, HttpSession session)
			throws Exception {

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

		
		// --------------------- 리뷰 ----------------------
		// 상품의 리뷰 개수 조회
		// 부모인 경우만 뽑기 (ok)
		Integer reviewCount = prodReviewService.getCountReview(prodNo);

		// 리뷰 목록을 가져오는 서비스 호출
		// 부모인 경우만 뽑기
		int reviewsPerPage = 3;
		List<ProdReviewDto> reviewList = prodReviewService.findReviews(prodNo, reviewsPerPage * pageNo, reviewsPerPage);
		log.info("reviewsPerPage : " + reviewsPerPage);
		log.info("pageNo : " + pageNo);
		log.info("reviewList : " + reviewList.toString());

		// 리뷰에 대한 답글 목록을 가져오는 서비스 호출
		// 자식인 경우에만 뽑기
		List<ProdReviewDto> replyList = prodReviewService.findReplies(prodNo);

		// 총 페이지 수 계산
		int totalReviewPages = (int) Math.ceil((double) reviewCount / reviewsPerPage);
		// --------------------- 리뷰 ----------------------

		
		// 상품 번호로 리뷰 조회 ????
		List<ProductInvalidDateDto> invalidDate = adminProdHistoryService.findProductInvalidByProdNo(prodNo, "");

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
		for (String i : product.getAdditionExplanation()) {
			list.add(additionExplanations.get(Integer.valueOf(i) - 1));
		}

		log.info(list.toString());

		log.info(invalidDate.toString());
		model.addAttribute("product", product);
//	    model.addAttribute("invalidDate", invalidDate);
		model.addAttribute("wishlistCount", wishlistCount);
		model.addAttribute("additionExplanations", list);
		model.addAttribute("avgStar", avgStar);
		model.addAttribute("pageNo", pageNo);
		model.addAttribute("currentViews", currentViews.getProdViews());
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("replyList", replyList);
		model.addAttribute("reviewCount", reviewCount);
		model.addAttribute("totalReviewPages", totalReviewPages);

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
	public String addReview(ProdReviewDto dto, @RequestParam("prodNo") Integer prodNo, Model model,
			HttpSession session) {
		dto.setProdNo(prodNo);

		// 멤버 받기
		Member member = (Member) session.getAttribute("member");
		if (member == null) {
			throw new CustomLoginRestfulException(BizDefine.ACCOUNT_IS_NONE, HttpStatus.INTERNAL_SERVER_ERROR);
		}

		if(dto.getProdRevStar() < 1 || dto.getProdRevStar() > 5) {
			throw new CustomRestfulException(BizDefine.PLEASE_WRITE_STAR, HttpStatus.BAD_REQUEST);
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
		if (member == null) {
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
		if (member == null) {
			throw new CustomLoginRestfulException(BizDefine.ACCOUNT_IS_NONE, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		dto.setProdNo(prodNo);
		dto.setUserNo(member.getUserno());
		prodWishListService.deleteWishList(dto);
		return "redirect:/product/productDetail?prod_no=" + prodNo;
	}

	/**
	 * 상품 조회 페이지
	 * 
	 * @param page
	 * @param size
	 * @param majorCategory
	 * @param subcategory
	 * @param search
	 * @param max
	 * @param min
	 * @param star
	 * @param model
	 * @return
	 */
	@GetMapping("/search-page")
	public String searchPageForm(@RequestParam(value = "page", defaultValue = "0") int page,
			@RequestParam(value = "size", defaultValue = "16") int size,
			@RequestParam(value = "major-category", defaultValue = "0") int majorCategory,
			@RequestParam(value = "subcategory", defaultValue = "0") int subcategory,
			@RequestParam(value = "search", defaultValue = "") String search,
			@RequestParam(value = "address", defaultValue = "") String address,
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
		if (max < 0 || min < 0) {
			throw new CustomRestfulException("잘못된 숫자 입니다.", HttpStatus.BAD_REQUEST);
		}
		if (star < 0 || star > 5) {
			throw new CustomRestfulException("잘못된 별점 입니다.", HttpStatus.BAD_REQUEST);
		}

		// 페이징 처리 클래스
		PageReq pageReq = new PageReq(page, size);

		// 상품 가져오기
		PageRes<ResProdMainFilterDto> pageRes = productService.findMainAllBysearchAndPriceAndstar(search, address, min,
				max, star, majorCategory, subcategory, pageReq);

		log.info("pageRes : " + pageRes);
		// 카테고리 가져오기
		List<ReqProdMainCategoryDto> majorCategoryList = majorCategoryService.findAll(); // 메인 카테고리
		List<ReqProdSubcategoryDto> subcategoryList = prodSubcategoryService.findAll(); // 서브 카테고리

		log.info(pageRes.toString());
		model.addAttribute("majorCategoryList", majorCategoryList); // 메인 카테고리
		model.addAttribute("subcategoryList", subcategoryList); // 서브 카테고리
		model.addAttribute("products", pageRes.getContent()); // 컨텐츠 배열
		model.addAttribute("currentPage", pageRes.getNumber()); // 컨텐츠 배열
		model.addAttribute("totalPages", pageRes.getTotalPages()); // 컨텐츠 배열
		model.addAttribute("totalItems", pageRes.getTotalElements()); // 컨텐츠 배열
		model.addAttribute("startPage", pageRes.getStartPage()); // 컨텐츠 배열
		model.addAttribute("endPage", pageRes.getEndPage()); // 컨텐츠 배열
		model.addAttribute("majorCategory", majorCategory); // 컨텐츠 배열
		model.addAttribute("subcategory", subcategory); // 컨텐츠 배열
		model.addAttribute("search", search); // 컨텐츠 배열
		model.addAttribute("address", address); // 컨텐츠 배열
		model.addAttribute("max", max); // 컨텐츠 배열
		model.addAttribute("min", min); // 컨텐츠 배열
		model.addAttribute("star", star); // 컨텐츠 배열
		return "product/search_page";
	}

}