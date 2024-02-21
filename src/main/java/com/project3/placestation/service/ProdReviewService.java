package com.project3.placestation.service;

import java.sql.Timestamp;
import java.time.Instant;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;

import com.project3.placestation.biz.handler.exception.CustomRestfulException;
import com.project3.placestation.product.dto.ProdReviewDto;
import com.project3.placestation.repository.entity.ProdReview;
import com.project3.placestation.repository.interfaces.ProdReviewRepository;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class ProdReviewService {

	@Autowired
	ProdReviewRepository prodReviewRepository;

	// 상품 별 리뷰 조회 
	public List<ProdReviewDto> findByRevProdNo(int prodNo) {
	    List<ProdReview> prodReviews = prodReviewRepository.findByRevProdNo(prodNo);
	    List<ProdReviewDto> dtos = new ArrayList<>();
	    
	    for (ProdReview prodRev : prodReviews) {
	        ProdReviewDto dto = ProdReviewDto.builder()
	            .prodRevNo(prodRev.getProdRevNo())
	            .prodNo(prodRev.getProdNo())
	            .prodRevTitle(prodRev.getProdRevTitle())
	            .prodRevContent(prodRev.getProdRevContent())
	            .prodRevStar(prodRev.getProdRevStar())
	            .prodRevCreateAt(prodRev.getProdRevCreateAt())
	            .prodRevId(prodRev.getProdRevId())
	            .prodRevUpdateAt(prodRev.getProdRevUpdateAt())
	            .prodRevDeleteYn(prodRev.getProdRevDeleteYn())
	            .prodRevDeleteAt(prodRev.getProdRevDeleteAt())
	            .childId(prodRev.getChildId())
	            .parentId(prodRev.getParentId())
	            .build();
	        dtos.add(dto);
	    }
	    
	    return dtos;
	}

    public void saveReview(ProdReviewDto reviewDto) {
        ProdReview review = convertDtoToEntity(reviewDto);
        
        // 현재 시간 설정
        review.setProdRevCreateAt(Timestamp.from(Instant.now()));
        review.setProdRevUpdateAt(null); // 초기 리뷰 등록 시 업데이트 시간은 null
        review.setProdRevDeleteYn("N");
        
        // 리뷰 저장 로직 (Repository 또는 Mapper를 사용)
        prodReviewRepository.save(review); // 가정: save 메소드가 리뷰 저장을 담당
    }

    private ProdReview convertDtoToEntity(ProdReviewDto dto) {
        return ProdReview.builder()
                .prodNo(dto.getProdNo())
                .prodRevTitle(dto.getProdRevTitle())
                .prodRevContent(dto.getProdRevContent())
                .prodRevStar(dto.getProdRevStar())
                .prodRevId(dto.getProdRevId())
                .childId(dto.getChildId())
                .parentId(dto.getParentId())
                .build();
    }
	
	// 유저 별 리뷰 조회
//	public ProdReviewDto findByRevId(int prodRevId) {
//
//		ProdReview prodRev = prodReviewRepository.findByRevProdNo(prodRevId);
//		
//		if (prodRev == null) {
//            return new ProdReviewDto();
//        }
//
//		ProdReviewDto dto = ProdReviewDto.builder()
//	            .prodRevNo(prodRev.getProdRevNo())
//	            .prodNo(prodRev.getProdNo())
//	            .prodRevTitle(prodRev.getProdRevTitle())
//	            .prodRevContent(prodRev.getProdRevContent())
//	            .prodRevStar(prodRev.getProdRevStar())
//	            .prodRevCreateAt(prodRev.getProdRevCreateAt())
//	            .prodRevId(prodRev.getProdRevId())
//	            .prodRevUpdateAt(prodRev.getProdRevUpdateAt())
//	            .prodRevDeleteYn(prodRev.getProdRevDeleteYn())
//	            .prodRevDeleteAt(prodRev.getProdRevDeleteAt())
//	            .childId(prodRev.getChildId())
//	            .parentId(prodRev.getParentId())
//	            .build();
//		
//		return dto;
//	}

}
