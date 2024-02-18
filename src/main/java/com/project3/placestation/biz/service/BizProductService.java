package com.project3.placestation.biz.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project3.placestation.biz.model.dto.ReqProductDto;
import com.project3.placestation.biz.model.dto.ReqUpdateProductDto;
import com.project3.placestation.biz.model.dto.ResProductDto;
import com.project3.placestation.biz.model.entity.Product;
import com.project3.placestation.biz.repository.ProductRepository;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class BizProductService {
	
	@Autowired
	ProductRepository productRepository;
	
	public void saveProduct(String filePath , ReqProductDto dto) {
		
		Product product = Product.builder()
				.prodWriterNo(1)
				.prodTitle(dto.getProdTitle())
				.prodStartTime(dto.getProdStartTime())
				.prodEndTime(dto.getProdEndTime())
				.prodPrice(dto.getProdPrice())
				.prodSpaceInfo(dto.getProdSpaceInfo())
				.prodGoodsInfo(dto.getProdGoodsInfo())
				.prodCautionInfo(dto.getProdCautionInfo())
				.prodMaximumPeople(dto.getProdMaximumPeople())
				.prodAddress(dto.getProdAddress())
				.filePath(filePath)
				.prodMajorCategoryId(dto.getProdMajorCategoryId())
				.prodSubcategoryId(dto.getProdSubcategoryId())
				.prodFullAddress(dto.getProdFullAddress())
				.prodDetailedAddress(dto.getProdDetailedAddress())
				.prodLocationX(dto.getProdLocationX())
				.prodLocationY(dto.getProdLocationY())
				.build();
		
			int result = productRepository.saveProduct(product);


		if(result < 1) {
			// 실패 로직 반송
		}
	}
	
	@Transactional
	public void updateProduct(String filePath , ReqUpdateProductDto dto) {
		Product product = Product.builder()
				.prodNo(dto.getProdNo())
				.prodWriterNo(1)
				.prodTitle(dto.getProdTitle())
				.prodStartTime(dto.getProdStartTime())
				.prodEndTime(dto.getProdEndTime())
				.prodPrice(dto.getProdPrice())
				.prodSpaceInfo(dto.getProdSpaceInfo())
				.prodGoodsInfo(dto.getProdGoodsInfo())
				.prodCautionInfo(dto.getProdCautionInfo())
				.prodMaximumPeople(dto.getProdMaximumPeople())
				.prodAddress(dto.getProdAddress())
				.filePath(filePath)
				.prodMajorCategoryId(dto.getProdMajorCategoryId())
				.prodSubcategoryId(dto.getProdSubcategoryId())
				.prodFullAddress(dto.getProdFullAddress())
				.prodDetailedAddress(dto.getProdDetailedAddress())
				.prodLocationX(dto.getProdLocationX())
				.prodLocationY(dto.getProdLocationY())
				.build();
		
		int result = productRepository.updateProduct(product , dto.getChangeImage());
		if(result < 1) {
			// 실패 로직 반송
		}
	}
	
	@Transactional
	public void deleteProduct(int prodNo , String prodDeleteReason) {
		int result = productRepository.deleteProduct(prodNo , prodDeleteReason);
		if(result < 1) {
			// 실패 로직
		}
		
	}
	
	/**
	 * 상품 목록 전체 조회
	 * @param userId
	 * @return
	 */
	public List<Product> findAll(int userId) {
		return productRepository.findAll(userId);
	}
	
	// 상품 상세 조히
	public ResProductDto findById(int ProdNo) {
		
		Product product = productRepository.findById(ProdNo);
		if (product == null ) {
			// 실패 로직
		}
		
		String receiveFilePath = product.getFilePath();
		
		String[] filePath = receiveFilePath.split(",");
		
		ResProductDto dto = ResProductDto.builder()
				.prodNo(product.getProdNo())
				.prodWriterNo(1)
				.prodTitle(product.getProdTitle())
				.prodStartTime(product.getProdStartTime())
				.prodEndTime(product.getProdEndTime())
				.prodPrice(product.getProdPrice())
				.prodSpaceInfo(product.getProdSpaceInfo())
				.prodGoodsInfo(product.getProdGoodsInfo())
				.prodCautionInfo(product.getProdCautionInfo())
				.prodMaximumPeople(product.getProdMaximumPeople())
				.prodAddress(product.getProdAddress())
				.filePath(filePath)
				.prodMajorCategoryId(product.getProdMajorCategoryId())
				.prodSubcategoryId(product.getProdSubcategoryId())
				.prodFullAddress(product.getProdFullAddress())
				.prodDetailedAddress(product.getProdDetailedAddress())
				.prodLocationX(product.getProdLocationX())
				.prodLocationY(product.getProdLocationY())
				.prodRdate(product.getProdRdate())
				.prodUpdateAt(product.getProdUpdateAt())
				.prodDeleteYn(product.getProdDeleteYn())
				.prodDeleteAt(product.getProdDeleteAt())
				.build();
		
		return dto;
	}
	
}
