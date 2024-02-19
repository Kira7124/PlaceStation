package com.project3.placestation.repository.interfaces;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Component;

import com.project3.placestation.repository.entity.ProdReviewEntity;
import com.project3.placestation.repository.entity.ProductEntity;

@Component
@Mapper
public interface ProductRepository {

	// 상품 전체 리스트
	public List<ProductEntity> findAll();
	// 상품 번호로 조회
    public List<ProductEntity> findByProdNo(Integer prodNo);
	// 상품 리스트 리뷰 개수
	public List<ProdReviewEntity> findAllByRev();
	// 상품 리스트 높은 평점
	public List<ProductEntity> findAllByStar();
	// 상품 리스트 최신
	public List<ProductEntity> findAllByStart();
	
	
}
