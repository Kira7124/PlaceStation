package com.project3.placestation.biz.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project3.placestation.biz.handler.exception.CustomLoginRestfulException;
import com.project3.placestation.biz.handler.exception.CustomRestfulException;
import com.project3.placestation.biz.model.dto.ReqProdMainCategoryDto;
import com.project3.placestation.biz.model.dto.ReqProdSubcategoryDto;
import com.project3.placestation.biz.model.dto.ReqProductDto;
import com.project3.placestation.biz.model.dto.ReqUpdateProductDto;
import com.project3.placestation.biz.model.dto.ResProductDto;
import com.project3.placestation.biz.model.util.BizDefine;
import com.project3.placestation.filedb.service.FiledbService;
import com.project3.placestation.repository.entity.AdditionExplanation;
import com.project3.placestation.repository.entity.Member;
import com.project3.placestation.service.AddtionExplanationService;
import com.project3.placestation.service.ExchangeService;
import com.project3.placestation.service.ProdMajorCategoryService;
import com.project3.placestation.service.ProdSubcategoryService;
import com.project3.placestation.service.ProductService;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/biz")
public class BizProductController {

	@Autowired
	FiledbService filedbService;

	@Autowired
	ProductService bizProductService;

	@Autowired
	ProdMajorCategoryService prodMajorCategoryService;

	@Autowired
	ProdSubcategoryService prodSubcategoryService;
	
	@Autowired
	AddtionExplanationService addtionExplanationService;
	
	
	@Autowired
	HttpSession httpSession;

	// http://localhost/biz/product-management
	@GetMapping("/product-management")
	public String productManagementForm(Model model) {

		// 멤버 받기
		Member member = (Member) httpSession.getAttribute("member"); 
		if(member == null) {
			throw new CustomLoginRestfulException(BizDefine.ACCOUNT_IS_NONE, HttpStatus.INTERNAL_SERVER_ERROR);
		}


		List<ResProductDto> dto = bizProductService.findAll(member.getUserno());
		model.addAttribute("products", dto);
		return "biz/product/biz_product_management";
	}

	// http://localhost/biz/add-product
	@GetMapping("/add-product-form")
	public String addProducttForm(Model model) {

		List<ReqProdMainCategoryDto> mainCategory = prodMajorCategoryService.findAll();
		List<ReqProdSubcategoryDto> subCategory = prodSubcategoryService.findAll();
		log.info(mainCategory.toString());
		log.info(subCategory.toString());
		
		List<AdditionExplanation> additionExplanation = addtionExplanationService.findAll();

		model.addAttribute("mainCategory", mainCategory);
		model.addAttribute("subcategory", subCategory);
		model.addAttribute("additionExplanation", additionExplanation);
		return "biz/product/biz_add_product";
	}

	// http://localhost/biz/update-product-form/{prodNo}
	@GetMapping("/update-product-form/{prodNo}")
	public String updateProductForm(@PathVariable(value = "prodNo") int prodNo, Model model) {
		
		// 멤버 받기
		Member member = (Member) httpSession.getAttribute("member"); 
		if(member == null) {
			throw new CustomLoginRestfulException(BizDefine.ACCOUNT_IS_NONE, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		
		ResProductDto dto = bizProductService.findById(prodNo);
		List<ReqProdMainCategoryDto> mainCategory = prodMajorCategoryService.findAll();
		List<ReqProdSubcategoryDto> subCategory = prodSubcategoryService.findAll();
		List<AdditionExplanation> additionExplanation = addtionExplanationService.findAll();
		log.info(dto.toString());
		log.info(mainCategory.toString());
		log.info(subCategory.toString());

		model.addAttribute("mainCategory", mainCategory);
		model.addAttribute("subcategory", subCategory);
		model.addAttribute("product", dto);
		model.addAttribute("additionExplanation", additionExplanation);
		return "biz/product/biz_update_product";
	}

	/**
	 * 상품 추가하기
	 * 
	 * @param dto
	 * @return
	 */
	@PostMapping("/product/add-product")
	public String addProduct(ReqProductDto dto) {

		// 1. 유효성 검사
		Member member = (Member) httpSession.getAttribute("member"); 
		if(member == null) {
			throw new CustomLoginRestfulException(BizDefine.ACCOUNT_IS_NONE, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		if (dto.getProdTitle() == null || dto.getProdTitle().isEmpty()) {
			throw new CustomRestfulException(BizDefine.PLEASE_WRITE_TITLE, HttpStatus.BAD_REQUEST);
		}
		if (dto.getProdTitle().length() > 20) {
			throw new CustomRestfulException(BizDefine.NO_VALID_TITLE_MORE_THAN_TWENTY, HttpStatus.BAD_REQUEST);
		}
		if (dto.getFiles() == null || dto.getFiles().isEmpty()) {
			throw new CustomRestfulException(BizDefine.NO_VALID_BANNER_IMAGE_OR_LESS_THAN_SIX, HttpStatus.BAD_REQUEST);
		}
		if (dto.getProdStartTime() == null || 0 > dto.getProdStartTime() || dto.getProdStartTime() > 24) {
			throw new CustomRestfulException(BizDefine.NO_VALID_START_TIME, HttpStatus.BAD_REQUEST);
		}
		if (dto.getProdEndTime() == null || 0 > dto.getProdEndTime() || dto.getProdEndTime() > 24) {
			throw new CustomRestfulException(BizDefine.NO_VALID_END_TIME, HttpStatus.BAD_REQUEST);
		}
		if (dto.getProdStartTime() >= dto.getProdEndTime()) {
			throw new CustomRestfulException(BizDefine.NO_VALID_END_TIME_LESS_THAN_START_TIME, HttpStatus.BAD_REQUEST);
		}
		if(dto.getIsFile() == null || dto.getIsFile().equals("N")) {
			throw new CustomRestfulException(BizDefine.NO_VALID_BANNER_IMAGE_OR_LESS_THAN_SIX, HttpStatus.BAD_REQUEST);
		}
		if (dto.getProdMaximumPeople() == null || 0 > dto.getProdMaximumPeople() || dto.getProdMaximumPeople() > 100) {
			throw new CustomRestfulException(BizDefine.NO_VALID_PEOPLE, HttpStatus.BAD_REQUEST);
		}
		if (dto.getProdPrice() == null || 0 > dto.getProdPrice() || dto.getProdPrice() > 1000000) {
			throw new CustomRestfulException(BizDefine.NO_VALID_AMOUNT, HttpStatus.BAD_REQUEST);
		}
		if (dto.getProdSpaceInfo() == null || dto.getProdSpaceInfo().isEmpty()) {
			throw new CustomRestfulException(BizDefine.PLEASE_WRITE_SPACE_INFO, HttpStatus.BAD_REQUEST);
		}
		if (dto.getProdGoodsInfo() == null || dto.getProdGoodsInfo().isEmpty()) {
			throw new CustomRestfulException(BizDefine.PLEASE_WRITE_GOODS_INFO, HttpStatus.BAD_REQUEST);
		}
		if (dto.getProdCautionInfo() == null || dto.getProdCautionInfo().isEmpty()) {
			throw new CustomRestfulException(BizDefine.PLEASE_WRITE_CAUTION_INFO, HttpStatus.BAD_REQUEST);
		}
		if(dto.getProdMajorCategoryId() == null || dto.getProdMajorCategoryId() < 1) {
			throw new CustomRestfulException(BizDefine.PLEASE_WRITE_MAIN_CATEGORY, HttpStatus.BAD_REQUEST);
		}
		if(dto.getProdSubcategoryId() == null || dto.getProdSubcategoryId() < 1) {
			throw new CustomRestfulException(BizDefine.PLEASE_WRITE_SUB_CATEGORY, HttpStatus.BAD_REQUEST);
		}
		if (dto.getProdAddress() == null || dto.getProdAddress().isEmpty()) {
			throw new CustomRestfulException(BizDefine.NO_VALID_ADDRESS, HttpStatus.BAD_REQUEST);
		}
		if (dto.getProdDetailedAddress() == null || dto.getProdDetailedAddress().isEmpty()) {
			throw new CustomRestfulException(BizDefine.NO_VALID_DETAILED_ADDRESS, HttpStatus.BAD_REQUEST);
		}
		if (dto.getProdFullAddress() == null || dto.getProdFullAddress().isEmpty()) {
			throw new CustomRestfulException(BizDefine.NO_VALID_ADDRESS, HttpStatus.BAD_REQUEST);
		}
		if (dto.getProdLocationX() == null || dto.getProdLocationY() == null) {
			throw new CustomRestfulException(BizDefine.NO_VALID_MAP, HttpStatus.BAD_REQUEST);
		}
		if(dto.getDescriptionImage() == null || dto.getDescriptionImage().isEmpty()) {
			throw new CustomRestfulException(BizDefine.NO_VALID_DESCRIPTION_IMAGE, HttpStatus.BAD_REQUEST);
		}

		log.info(dto.toString());

		// 파일 저장
		String filePath = filedbService.saveFiles(dto.getFiles());
		
		
		ExchangeService<Integer> exchangeService = new ExchangeService<>();
		String additionExplanation = exchangeService.exchangeToStringFromList(dto.getDescriptionImage());
		
		
//		 파일 저장 실패시
		if (filePath.isBlank()) {
			// 실패 로직
			throw new CustomRestfulException("이미지 저장시 실패하였습니다.", HttpStatus.INTERNAL_SERVER_ERROR);
		}

		bizProductService.saveProduct(filePath,additionExplanation, member.getUserno() ,  dto);

		return "redirect:/biz/product-management";
	}

	/**
	 * 업데이트
	 * 
	 * @param dto
	 * @param prodNo
	 * @return
	 */
	@PutMapping("/product/update-product")
	public String updateProduct(ReqUpdateProductDto dto, @RequestParam(value = "prodNo") Integer prodNo) {
		log.info(dto.toString());
		// 1. 유효성 검사
		// 1. 유효성 검사
		Member member = (Member) httpSession.getAttribute("member"); 
		if(member == null) {
			throw new CustomLoginRestfulException(BizDefine.ACCOUNT_IS_NONE, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if (dto.getProdTitle() == null || dto.getProdTitle().isEmpty()) {
			throw new CustomRestfulException(BizDefine.PLEASE_WRITE_TITLE, HttpStatus.BAD_REQUEST);
		}
		if (dto.getProdTitle().length() > 20) {
			throw new CustomRestfulException(BizDefine.NO_VALID_TITLE_MORE_THAN_TWENTY, HttpStatus.BAD_REQUEST);
		}
		if (dto.getFiles() == null || dto.getFiles().isEmpty()) {
			throw new CustomRestfulException(BizDefine.NO_VALID_BANNER_IMAGE_OR_LESS_THAN_SIX, HttpStatus.BAD_REQUEST);
		}
		if (dto.getProdStartTime() == null || 0 > dto.getProdStartTime() || dto.getProdStartTime() > 24) {
			throw new CustomRestfulException(BizDefine.NO_VALID_START_TIME, HttpStatus.BAD_REQUEST);
		}
		if (dto.getProdEndTime() == null || 0 > dto.getProdEndTime() || dto.getProdEndTime() > 24) {
			throw new CustomRestfulException(BizDefine.NO_VALID_END_TIME, HttpStatus.BAD_REQUEST);
		}
		if (dto.getProdStartTime() >= dto.getProdEndTime()) {
			throw new CustomRestfulException(BizDefine.NO_VALID_END_TIME_LESS_THAN_START_TIME, HttpStatus.BAD_REQUEST);
		}
		if (dto.getProdMaximumPeople() == null || 0 > dto.getProdMaximumPeople() || dto.getProdMaximumPeople() > 100) {
			throw new CustomRestfulException(BizDefine.NO_VALID_PEOPLE, HttpStatus.BAD_REQUEST);
		}
		if (dto.getProdPrice() == null || 0 > dto.getProdPrice() || dto.getProdPrice() > 1000000) {
			throw new CustomRestfulException(BizDefine.NO_VALID_AMOUNT, HttpStatus.BAD_REQUEST);
		}
		if (dto.getProdSpaceInfo() == null || dto.getProdSpaceInfo().isEmpty()) {
			throw new CustomRestfulException(BizDefine.PLEASE_WRITE_SPACE_INFO, HttpStatus.BAD_REQUEST);
		}
		if (dto.getProdGoodsInfo() == null || dto.getProdGoodsInfo().isEmpty()) {
			throw new CustomRestfulException(BizDefine.PLEASE_WRITE_GOODS_INFO, HttpStatus.BAD_REQUEST);
		}
		if (dto.getProdCautionInfo() == null || dto.getProdCautionInfo().isEmpty()) {
			throw new CustomRestfulException(BizDefine.PLEASE_WRITE_CAUTION_INFO, HttpStatus.BAD_REQUEST);
		}
		if(dto.getProdMajorCategoryId() == null || dto.getProdMajorCategoryId() < 1) {
			throw new CustomRestfulException(BizDefine.PLEASE_WRITE_MAIN_CATEGORY, HttpStatus.BAD_REQUEST);
		}
		if(dto.getProdSubcategoryId() == null || dto.getProdSubcategoryId() < 1) {
			throw new CustomRestfulException(BizDefine.PLEASE_WRITE_SUB_CATEGORY, HttpStatus.BAD_REQUEST);
		}
		if (dto.getProdAddress() == null || dto.getProdAddress().isEmpty()) {
			throw new CustomRestfulException(BizDefine.NO_VALID_ADDRESS, HttpStatus.BAD_REQUEST);
		}
		if (dto.getProdDetailedAddress() == null || dto.getProdDetailedAddress().isEmpty()) {
			throw new CustomRestfulException(BizDefine.NO_VALID_DETAILED_ADDRESS, HttpStatus.BAD_REQUEST);
		}
		if (dto.getProdFullAddress() == null || dto.getProdFullAddress().isEmpty()) {
			throw new CustomRestfulException(BizDefine.NO_VALID_ADDRESS, HttpStatus.BAD_REQUEST);
		}
		if (dto.getProdLocationX() == null || dto.getProdLocationY() == null) {
			throw new CustomRestfulException(BizDefine.NO_VALID_MAP, HttpStatus.BAD_REQUEST);
		}
		if(dto.getDescriptionImage() == null || dto.getDescriptionImage().isEmpty()) {
			throw new CustomRestfulException(BizDefine.NO_VALID_DESCRIPTION_IMAGE, HttpStatus.BAD_REQUEST);
		}

		// 파일 Str 가져오기
		String filePath = "";
		if (dto.getChangeImage().equals("Y")) {
			filePath = filedbService.saveFiles(dto.getFiles());
		}
		
		// 부가 설명 가져오기
		ExchangeService<Integer> exchangeService = new ExchangeService<>();
		String additionExplanation = exchangeService.exchangeToStringFromList(dto.getDescriptionImage());

		bizProductService.updateProduct(filePath,additionExplanation, dto, prodNo, member.getUserno());

		return "redirect:/biz/product-management";
	}

	/**
	 * 상품 삭제하기 (delete_yn = 'Y')
	 * 
	 * @param prodNo
	 * @param prodDeleteReason
	 * @return
	 */
	@DeleteMapping("/product/delete-product/{prodNo}")
	public String deleteProduct(@PathVariable(value = "prodNo") Integer prodNo,
			@RequestParam(value = "prodDeleteReason") String prodDeleteReason) {

		// 1. 유효성 검사
		Member member = (Member) httpSession.getAttribute("member"); 
		if(member == null) {
			throw new CustomLoginRestfulException(BizDefine.ACCOUNT_IS_NONE, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		if(prodDeleteReason == null || prodDeleteReason.isEmpty()) {
			throw new CustomRestfulException(BizDefine.PLEASE_WRITE_REASON, HttpStatus.BAD_REQUEST);
		}
		if(prodDeleteReason.length() > 400 ||prodDeleteReason.length() < 0) {
			throw new CustomRestfulException(BizDefine.PLEASE_WRITE_REASON_LESS_THAN_FOUR_HUNDRED , HttpStatus.BAD_REQUEST);
		}
		
		bizProductService.deleteProduct(prodNo, prodDeleteReason);
		return "redirect:/biz/product-management";
	}
}