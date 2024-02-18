package com.project3.placestation.biz.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.project3.placestation.biz.model.dto.ReqProductDto;
import com.project3.placestation.biz.model.dto.ReqUpdateProductDto;
import com.project3.placestation.biz.model.entity.Product;
import com.project3.placestation.biz.service.BizProductService;
import com.project3.placestation.filedb.service.FiledbService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/biz/product")
public class BizProductController {

	@Autowired
	FiledbService filedbService;

	@Autowired
	BizProductService bizProductService;

	

	
	
	/**
	 * 상품 추가하기
	 * 
	 * @param prodTitle
	 * @param files
	 * @param prodStartTime
	 * @param prodEndTime
	 * @param prodMaximumPeople
	 * @param prodPrice
	 * @param prodSpaceInfo
	 * @param prodGoodsInfo
	 * @param prodCautionInfo
	 * @param prodMajorCategoryId
	 * @param prodSubcategoryId
	 * @param prodAddress
	 * @param prodDetailedAddress
	 * @param prodFullAddress
	 * @param prodLocationX
	 * @param prodLocationY
	 * @return
	 */
	@PostMapping("/add-product")
	public String addProduct(@RequestParam(value = "prodTitle") String prodTitle,
			@RequestParam(value = "files") List<MultipartFile> files,
			@RequestParam(value = "prodStartTime") Integer prodStartTime,
			@RequestParam(value = "prodEndTime") Integer prodEndTime,
			@RequestParam(value = "prodMaximumPeople") Integer prodMaximumPeople,
			@RequestParam(value = "prodPrice") Integer prodPrice,
			@RequestParam(value = "prodSpaceInfo") String prodSpaceInfo,
			@RequestParam(value = "prodGoodsInfo") String prodGoodsInfo,
			@RequestParam(value = "prodCautionInfo") String prodCautionInfo,
			@RequestParam(value = "prodMajorCategoryId") Integer prodMajorCategoryId,
			@RequestParam(value = "prodSubcategoryId") Integer prodSubcategoryId,
			@RequestParam(value = "prodAddress") String prodAddress,
			@RequestParam(value = "prodDetailedAddress") String prodDetailedAddress,
			@RequestParam(value = "prodFullAddress") String prodFullAddress,
			@RequestParam(value = "prodLocationX") Double prodLocationX,
			@RequestParam(value = "prodLocationY") Double prodLocationY) {
		ReqProductDto dto = ReqProductDto.builder().prodTitle(prodTitle).files(files).prodStartTime(prodStartTime)
				.prodEndTime(prodEndTime).prodMaximumPeople(prodMaximumPeople).prodPrice(prodPrice)
				.prodSpaceInfo(prodSpaceInfo).prodGoodsInfo(prodGoodsInfo).prodCautionInfo(prodCautionInfo)
				.prodMajorCategoryId(prodMajorCategoryId).prodSubcategoryId(prodSubcategoryId).prodAddress(prodAddress)
				.prodDetailedAddress(prodDetailedAddress).prodFullAddress(prodFullAddress).prodLocationX(prodLocationX)
				.prodLocationY(prodLocationY).build();
		log.info(dto.toString());

		String filePath = filedbService.saveFiles(files);

//		 파일 저장 실패시
		if (filePath.isBlank()) {
			// 실패 로직
		}

		bizProductService.saveProduct(filePath, dto);

		return "redirect:/biz/product-management";
	}

	@PutMapping("/update-product/{prodNo}")
	public String updateProduct(
			@PathVariable(value = "prodNo") Integer prodNo,
			@RequestParam(value = "prodTitle") String prodTitle,
			@RequestParam(value = "files") List<MultipartFile> files,
			@RequestParam(value = "changeImage") String changeImage,
			@RequestParam(value = "prodStartTime") Integer prodStartTime,
			@RequestParam(value = "prodEndTime") Integer prodEndTime,
			@RequestParam(value = "prodMaximumPeople") Integer prodMaximumPeople,
			@RequestParam(value = "prodPrice") Integer prodPrice,
			@RequestParam(value = "prodSpaceInfo") String prodSpaceInfo,
			@RequestParam(value = "prodGoodsInfo") String prodGoodsInfo,
			@RequestParam(value = "prodCautionInfo") String prodCautionInfo,
			@RequestParam(value = "prodMajorCategoryId") Integer prodMajorCategoryId,
			@RequestParam(value = "prodSubcategoryId") Integer prodSubcategoryId,
			@RequestParam(value = "prodAddress") String prodAddress,
			@RequestParam(value = "prodDetailedAddress") String prodDetailedAddress,
			@RequestParam(value = "prodFullAddress") String prodFullAddress,
			@RequestParam(value = "prodLocationX") Double prodLocationX,
			@RequestParam(value = "prodLocationY") Double prodLocationY) {
		
		ReqUpdateProductDto dto = ReqUpdateProductDto.builder()
				.prodNo(prodNo)
				.prodWriterNo(1) // 변경 해야 할 부분
				.prodTitle(prodTitle).files(files)
				.changeImage(changeImage).prodStartTime(prodStartTime).prodEndTime(prodEndTime)
				.prodMaximumPeople(prodMaximumPeople).prodPrice(prodPrice).prodSpaceInfo(prodSpaceInfo)
				.prodGoodsInfo(prodGoodsInfo).prodCautionInfo(prodCautionInfo).prodMajorCategoryId(prodMajorCategoryId)
				.prodSubcategoryId(prodSubcategoryId).prodAddress(prodAddress).prodDetailedAddress(prodDetailedAddress)
				.prodFullAddress(prodFullAddress).prodLocationX(prodLocationX).prodLocationY(prodLocationY).build();
		log.info(dto.toString());
		
		// 인증 검사를 실시

		String filePath = "";
		if (changeImage.equals("Y")) {
			log.info("이미지를 바꿨습니다.");
			filePath = filedbService.saveFiles(files);
		}
		
		bizProductService.updateProduct(filePath, dto);
		

		return "redirect:/biz/product-management";
	}
	
	@DeleteMapping("/delete-product/{prodNo}")
	public String deleteProduct(@PathVariable(value = "prodNo") Integer prodNo, @RequestParam(value = "prodDeleteReason") String prodDeleteReason) {

		log.info("확인 : " + prodDeleteReason);
		bizProductService.deleteProduct(prodNo , prodDeleteReason);
		return "redirect:/biz/product-management";
	}
}
