package com.project3.placestation.repository.interfaces;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project3.placestation.repository.entity.ProdReview;

@Mapper
public interface ProductReviewRepository {

	// 유저 Id 로 리뷰 조회
	public List<ProdReview> findByRevId(int prodRevId);
	// 상품 번호로 리뷰 조회
	public List<ProdReview> findByRevProdNo(int prodNo);
}
