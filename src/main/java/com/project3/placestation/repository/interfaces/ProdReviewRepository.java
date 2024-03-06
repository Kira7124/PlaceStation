package com.project3.placestation.repository.interfaces;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.h2.mvstore.Page;
import org.springframework.boot.autoconfigure.data.web.SpringDataWebProperties.Pageable;
import org.springframework.stereotype.Component;

import com.project3.placestation.product.dto.ProdReviewDto;
import com.project3.placestation.repository.entity.ProdReview;

@Component
@Mapper
public interface ProdReviewRepository {

	// 상품 번호로 리뷰 조회
	List<ProdReview> findByRevProdNoPaged(@Param("prod_no") int prodNo, @Param("offset") int offset, @Param("limit") int limit);

	public int addReview(ProdReview review); // 리뷰 등록
	public int saveReview(ProdReview review); // 답글 등록
	public int countReview(Integer prodNo);
	public Double avgStar(Integer prodNo);
	public int deleteReview(@Param(value = "prodRevNo")Integer prodRevNo); // 리뷰 삭제

    // 답글 리스트
    List<ProdReview> findReplies(Integer prodNo);
    // 리뷰 페이징 리스트 <- 사용중
	List<ProdReview> findReviews(@Param("prod_no") int prodNo, @Param("offset") int offset, @Param("limit") int limit);
}
