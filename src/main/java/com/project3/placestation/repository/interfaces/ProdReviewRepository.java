package com.project3.placestation.repository.interfaces;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Component;

import com.project3.placestation.repository.entity.ProdReview;

@Component
@Mapper
public interface ProdReviewRepository {

	// 상품 번호로 리뷰 조회
	public List<ProdReview> findByRevProdNo(int prodNo);
	
	public int addReview(ProdReview review); // 리뷰 등록
	public int saveReview(ProdReview review); // 답글 등록
	public int deleteReview(Integer prodRevNo);
	public int countReview(Integer prodNo);
	public Double avgStar(Integer prodNo);
}
