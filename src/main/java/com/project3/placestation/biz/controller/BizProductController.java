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

import com.project3.placestation.biz.handler.exception.CustomRestfulException;
import com.project3.placestation.biz.model.dto.ReqProdMainCategoryDto;
import com.project3.placestation.biz.model.dto.ReqProdSubcategoryDto;
import com.project3.placestation.biz.model.dto.ReqProductDto;
import com.project3.placestation.biz.model.dto.ReqUpdateProductDto;
import com.project3.placestation.biz.model.dto.ResProductDto;
import com.project3.placestation.filedb.service.FiledbService;
import com.project3.placestation.service.ProdMajorCategoryService;
import com.project3.placestation.service.ProdSubcategoryService;
import com.project3.placestation.service.ProductService;

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

	// http://localhost/biz/product-management
	@GetMapping("/product-management")
	public String productManagementForm(Model model) {

		int userId = 1;

		List<ResProductDto> dto = bizProductService.findAll(userId);
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

		model.addAttribute("mainCategory", mainCategory);
		model.addAttribute("subcategory", subCategory);
		return "biz/product/biz_add_product";
	}

	// http://localhost/biz/update-product-form/{prodNo}
	@GetMapping("/update-product-form/{prodNo}")
	public String updateProductForm(@PathVariable(value = "prodNo") int prodNo, Model model) {
		ResProductDto dto = bizProductService.findById(prodNo);
		List<ReqProdMainCategoryDto> mainCategory = prodMajorCategoryService.findAll();
		List<ReqProdSubcategoryDto> subCategory = prodSubcategoryService.findAll();

		log.info(dto.toString());
		log.info(mainCategory.toString());
		log.info(subCategory.toString());

		model.addAttribute("mainCategory", mainCategory);
		model.addAttribute("subcategory", subCategory);
		model.addAttribute("product", dto);

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
		if (dto.getProdTitle() == null || dto.getProdTitle().isEmpty()) {
			throw new CustomRestfulException("제목을 적어주세요", HttpStatus.BAD_REQUEST);
		}
		if (dto.getProdTitle().length() > 20) {
			throw new CustomRestfulException("제목은 20자 이상을 허용할 수 없습니다.", HttpStatus.BAD_REQUEST);
		}
		if (dto.getFiles() == null || dto.getFiles().isEmpty()) {
			throw new CustomRestfulException("배너 이미지가 없거나 6개 이상을 허용할 수 없습니다.", HttpStatus.BAD_REQUEST);
		}
		if (dto.getProdStartTime() == null || 0 > dto.getProdStartTime() || dto.getProdStartTime() > 24) {
			throw new CustomRestfulException("시작 시간은 0 ~ 23시 안으로 적어주세요.", HttpStatus.BAD_REQUEST);
		}
		if (dto.getProdEndTime() == null || 0 > dto.getProdEndTime() || dto.getProdEndTime() > 24) {
			throw new CustomRestfulException("종료 시간은 0 ~ 23시 안으로 적어주세요.", HttpStatus.BAD_REQUEST);
		}
		if (dto.getProdStartTime() >= dto.getProdEndTime()) {
			throw new CustomRestfulException("종료 시간은 시작시간보다 낮아야 합니다.", HttpStatus.BAD_REQUEST);
		}

		if (dto.getProdMaximumPeople() == null || 0 > dto.getProdMaximumPeople() || dto.getProdMaximumPeople() > 100) {
			throw new CustomRestfulException("인원 수가 너무 작거나 큽니다.", HttpStatus.BAD_REQUEST);
		}
		if (dto.getProdPrice() == null || 0 > dto.getProdPrice() || dto.getProdPrice() > 1000000) {
			throw new CustomRestfulException("가격이 너무 작거나 큽니다.", HttpStatus.BAD_REQUEST);
		}
		if (dto.getProdSpaceInfo() == null || dto.getProdSpaceInfo().isEmpty()) {
			throw new CustomRestfulException("공간 소개를 입력해 주세요.", HttpStatus.BAD_REQUEST);
		}
		if (dto.getProdGoodsInfo() == null || dto.getProdGoodsInfo().isEmpty()) {
			throw new CustomRestfulException("대여 물품을 입력해 주세요.", HttpStatus.BAD_REQUEST);
		}
		if (dto.getProdCautionInfo() == null || dto.getProdCautionInfo().isEmpty()) {
			throw new CustomRestfulException("예약 시 주의 사항를 입력해 주세요.", HttpStatus.BAD_REQUEST);
		}
		if(dto.getProdMajorCategoryId() == null || dto.getProdMajorCategoryId() < 1) {
			throw new CustomRestfulException("메인 카테고리를 지정해 주세요", HttpStatus.BAD_REQUEST);
		}
		if(dto.getProdSubcategoryId() == null || dto.getProdSubcategoryId() < 1) {
			throw new CustomRestfulException("서브 카테고리를 지정해 주세요", HttpStatus.BAD_REQUEST);
		}
		if (dto.getProdAddress() == null || dto.getProdAddress().isEmpty()) {
			throw new CustomRestfulException("주소를 입력해 주세요.", HttpStatus.BAD_REQUEST);
		}
		if (dto.getProdDetailedAddress() == null || dto.getProdDetailedAddress().isEmpty()) {
			throw new CustomRestfulException("상세 주소를 입력해 주세요.", HttpStatus.BAD_REQUEST);
		}
		if (dto.getProdFullAddress() == null || dto.getProdFullAddress().isEmpty()) {
			throw new CustomRestfulException("주소를 입력해 주세요.", HttpStatus.BAD_REQUEST);
		}
		if (dto.getProdLocationX() == null || dto.getProdLocationY() == null) {
			throw new CustomRestfulException("지도 상세 위치를 입력해 주세요.", HttpStatus.BAD_REQUEST);
		}

		log.info(dto.toString());

		// 파일 저장
		String filePath = filedbService.saveFiles(dto.getFiles());

//		 파일 저장 실패시
		if (filePath.isBlank()) {
			// 실패 로직
			throw new CustomRestfulException("이미지 저장시 실패하였습니다.", HttpStatus.INTERNAL_SERVER_ERROR);
		}

		bizProductService.saveProduct(filePath, dto);

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
		if (dto.getProdTitle() == null || dto.getProdTitle().isEmpty()) {
			throw new CustomRestfulException("제목을 적어주세요", HttpStatus.BAD_REQUEST);
		}
		if (dto.getProdTitle().length() > 20) {
			throw new CustomRestfulException("제목은 20자 이상을 허용할 수 없습니다.", HttpStatus.BAD_REQUEST);
		}
		if (dto.getFiles() == null || dto.getFiles().isEmpty()) {
			throw new CustomRestfulException("배너 이미지가 없거나 6개 이상을 허용할 수 없습니다.", HttpStatus.BAD_REQUEST);
		}
		if (dto.getProdStartTime() == null || 0 > dto.getProdStartTime() || dto.getProdStartTime() > 24) {
			throw new CustomRestfulException("시작 시간은 0 ~ 23시 안으로 적어주세요.", HttpStatus.BAD_REQUEST);
		}
		if (dto.getProdEndTime() == null || 0 > dto.getProdEndTime() || dto.getProdEndTime() > 24) {
			throw new CustomRestfulException("종료 시간은 0 ~ 23시 안으로 적어주세요.", HttpStatus.BAD_REQUEST);
		}
		if (dto.getProdStartTime() >= dto.getProdEndTime()) {
			throw new CustomRestfulException("종료 시간은 시작시간보다 낮아야 합니다.", HttpStatus.BAD_REQUEST);
		}
		if (dto.getProdMaximumPeople() == null || 0 > dto.getProdMaximumPeople() || dto.getProdMaximumPeople() > 100) {
			throw new CustomRestfulException("인원 수가 너무 작거나 큽니다.", HttpStatus.BAD_REQUEST);
		}
		if (dto.getProdPrice() == null || 0 > dto.getProdPrice() || dto.getProdPrice() > 1000000) {
			throw new CustomRestfulException("가격이 너무 작거나 큽니다.", HttpStatus.BAD_REQUEST);
		}
		if (dto.getProdSpaceInfo() == null || dto.getProdSpaceInfo().isEmpty()) {
			throw new CustomRestfulException("공간 소개를 입력해 주세요.", HttpStatus.BAD_REQUEST);
		}
		if (dto.getProdGoodsInfo() == null || dto.getProdGoodsInfo().isEmpty()) {
			throw new CustomRestfulException("대여 물품을 입력해 주세요.", HttpStatus.BAD_REQUEST);
		}
		if (dto.getProdCautionInfo() == null || dto.getProdCautionInfo().isEmpty()) {
			throw new CustomRestfulException("예약 시 주의 사항를 입력해 주세요.", HttpStatus.BAD_REQUEST);
		}
		if(dto.getProdMajorCategoryId() == null || dto.getProdMajorCategoryId() < 1) {
			throw new CustomRestfulException("메인 카테고리를 지정해 주세요", HttpStatus.BAD_REQUEST);
		}
		if(dto.getProdSubcategoryId() == null || dto.getProdSubcategoryId() < 1) {
			throw new CustomRestfulException("서브 카테고리를 지정해 주세요", HttpStatus.BAD_REQUEST);
		}
		if (dto.getProdAddress() == null || dto.getProdAddress().isEmpty()) {
			throw new CustomRestfulException("주소를 입력해 주세요.", HttpStatus.BAD_REQUEST);
		}
		if (dto.getProdDetailedAddress() == null || dto.getProdDetailedAddress().isEmpty()) {
			throw new CustomRestfulException("상세 주소를 입력해 주세요.", HttpStatus.BAD_REQUEST);
		}
		if (dto.getProdFullAddress() == null || dto.getProdFullAddress().isEmpty()) {
			throw new CustomRestfulException("주소를 입력해 주세요.", HttpStatus.BAD_REQUEST);
		}
		if (dto.getProdLocationX() == null || dto.getProdLocationY() == null) {
			throw new CustomRestfulException("지도 상세 위치를 입력해 주세요.", HttpStatus.BAD_REQUEST);
		}

		// 인증 검사가 끝났다면 유저의 아이디값을 가져와야 합니다.
		int writerNo = 1;

		String filePath = "";
		if (dto.getChangeImage().equals("Y")) {
			log.info("이미지를 바꿨습니다.");
			filePath = filedbService.saveFiles(dto.getFiles());
		}

		bizProductService.updateProduct(filePath, dto, prodNo, writerNo);

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

		log.info("확인 : " + prodDeleteReason);
		if(prodDeleteReason == null || prodDeleteReason.isEmpty()) {
			throw new CustomRestfulException("상세 이유를 적어주세요.", HttpStatus.BAD_REQUEST);
		}
		if(prodDeleteReason.length() > 400 ||prodDeleteReason.length() < 0) {
			throw new CustomRestfulException("상세 이유 길이는 400자 이하입니다.", HttpStatus.BAD_REQUEST);
		}
		
		bizProductService.deleteProduct(prodNo, prodDeleteReason);
		return "redirect:/biz/product-management";
	}
}
