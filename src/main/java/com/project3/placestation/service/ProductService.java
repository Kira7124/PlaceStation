package com.project3.placestation.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project3.placestation.biz.handler.exception.CustomRestfulException;
import com.project3.placestation.biz.model.dto.ReqProductDto;
import com.project3.placestation.biz.model.dto.ReqUpdateProductDto;
import com.project3.placestation.biz.model.dto.ResProductDto;
import com.project3.placestation.repository.entity.Product;
import com.project3.placestation.repository.interfaces.ProductRepository;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class ProductService {

	@Autowired
	ProductRepository productRepository;

	public void saveProduct(String filePath, ReqProductDto dto) {

		Product product = Product.builder().prodWriterNo(1).prodTitle(dto.getProdTitle())
				.prodStartTime(dto.getProdStartTime()).prodEndTime(dto.getProdEndTime()).prodPrice(dto.getProdPrice())
				.prodSpaceInfo(dto.getProdSpaceInfo()).prodGoodsInfo(dto.getProdGoodsInfo())
				.prodCautionInfo(dto.getProdCautionInfo()).prodMaximumPeople(dto.getProdMaximumPeople())
				.prodAddress(dto.getProdAddress()).filePath(filePath).prodMajorCategoryId(dto.getProdMajorCategoryId())
				.prodSubcategoryId(dto.getProdSubcategoryId()).prodFullAddress(dto.getProdFullAddress())
				.prodDetailedAddress(dto.getProdDetailedAddress()).prodLocationX(dto.getProdLocationX())
				.prodLocationY(dto.getProdLocationY()).build();

		int result = productRepository.saveProduct(product);

		// 확인
		if (result < 1) {
			throw new CustomRestfulException("상품 저장시 실패하였습니다.", HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	@Transactional
	public void updateProduct(String filePath, ReqUpdateProductDto dto, int prodNo, int writerNo) {
		Product product = Product.builder().prodNo(prodNo).prodWriterNo(writerNo).prodTitle(dto.getProdTitle())
				.prodStartTime(dto.getProdStartTime()).prodEndTime(dto.getProdEndTime()).prodPrice(dto.getProdPrice())
				.prodSpaceInfo(dto.getProdSpaceInfo()).prodGoodsInfo(dto.getProdGoodsInfo())
				.prodCautionInfo(dto.getProdCautionInfo()).prodMaximumPeople(dto.getProdMaximumPeople())
				.prodAddress(dto.getProdAddress()).filePath(filePath).prodMajorCategoryId(dto.getProdMajorCategoryId())
				.prodSubcategoryId(dto.getProdSubcategoryId()).prodFullAddress(dto.getProdFullAddress())
				.prodDetailedAddress(dto.getProdDetailedAddress()).prodLocationX(dto.getProdLocationX())
				.prodLocationY(dto.getProdLocationY()).build();

		int result = productRepository.updateProduct(product, dto.getChangeImage());

		// 확인
		if (result < 1) {
			throw new CustomRestfulException("상품 업데이트시 실패하였습니다.", HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	@Transactional
	public void deleteProduct(int prodNo, String prodDeleteReason) {
		int result = productRepository.deleteProduct(prodNo, prodDeleteReason);
		if (result < 1) {
			throw new CustomRestfulException("상품 삭제시 실패하였습니다.", HttpStatus.INTERNAL_SERVER_ERROR);
		}

	}

	/**
	 * 상품 목록 전체 조회
	 * 
	 * @param userId
	 * @return
	 */
	public List<ResProductDto> findAll(int userId) {
		List<Product> listProduct = productRepository.findAllByUserId(userId);
		List<ResProductDto> resProduct = new ArrayList<>();

		if (listProduct.isEmpty() == false) {
			for (Product product : listProduct) {

				String[] filePath = {};
				if (product.getFilePath() != null && product.getFilePath().isEmpty() == false) {
					String receiveFilePath = product.getFilePath();
					filePath = receiveFilePath.split(",");
				}

				ResProductDto dto = ResProductDto.builder().prodNo(product.getProdNo()).prodWriterNo(1)
						.prodTitle(product.getProdTitle()).prodStartTime(product.getProdStartTime())
						.prodEndTime(product.getProdEndTime()).prodPrice(product.getProdPrice())
						.prodSpaceInfo(product.getProdSpaceInfo()).prodGoodsInfo(product.getProdGoodsInfo())
						.prodCautionInfo(product.getProdCautionInfo()).prodMaximumPeople(product.getProdMaximumPeople())
						.prodAddress(product.getProdAddress()).filePath(filePath)
						.prodMajorCategoryId(product.getProdMajorCategoryId())
						.prodSubcategoryId(product.getProdSubcategoryId()).prodFullAddress(product.getProdFullAddress())
						.prodDetailedAddress(product.getProdDetailedAddress()).prodLocationX(product.getProdLocationX())
						.prodLocationY(product.getProdLocationY()).prodRdate(product.getProdRdate())
						.prodUpdateAt(product.getProdUpdateAt()).prodDeleteYn(product.getProdDeleteYn())
						.prodDeleteAt(product.getProdDeleteAt()).build();
				resProduct.add(dto);
			}
		}
		return resProduct;
	}
	
	
	// 상품 상세 조히
	public ResProductDto findById(int ProdNo) {

		Product product = productRepository.findById(ProdNo);

		// 확인
		if (product == null) {
			throw new CustomRestfulException("해당 상품이 없거나 오류가 발생하였습니다.", HttpStatus.INTERNAL_SERVER_ERROR);
		}

		String[] filePath = {};

		if (product.getFilePath() != null && product.getFilePath().isEmpty() == false)  {
			String receiveFilePath = product.getFilePath();
			filePath = receiveFilePath.split(",");
		}

		ResProductDto dto = ResProductDto.builder().prodNo(product.getProdNo()).prodWriterNo(1)
				.prodTitle(product.getProdTitle()).prodStartTime(product.getProdStartTime())
				.prodEndTime(product.getProdEndTime()).prodPrice(product.getProdPrice())
				.prodSpaceInfo(product.getProdSpaceInfo()).prodGoodsInfo(product.getProdGoodsInfo())
				.prodCautionInfo(product.getProdCautionInfo()).prodMaximumPeople(product.getProdMaximumPeople())
				.prodAddress(product.getProdAddress()).filePath(filePath)
				.prodMajorCategoryId(product.getProdMajorCategoryId()).prodSubcategoryId(product.getProdSubcategoryId())
				.prodFullAddress(product.getProdFullAddress()).prodDetailedAddress(product.getProdDetailedAddress())
				.prodLocationX(product.getProdLocationX()).prodLocationY(product.getProdLocationY())
				.prodRdate(product.getProdRdate()).prodUpdateAt(product.getProdUpdateAt())
				.prodDeleteYn(product.getProdDeleteYn()).prodDeleteAt(product.getProdDeleteAt()).build();

		return dto;
	}

}

