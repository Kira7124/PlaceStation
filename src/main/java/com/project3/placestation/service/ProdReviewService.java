package com.project3.placestation.service;

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
	            .prodRevContent(prodRev.getProdRevContent())
	            .prodRevStar(prodRev.getProdRevStar())
	            .prodRevCreateAt(prodRev.getProdRevCreateAt())
	            .userNo(prodRev.getUserNo())
	            .prodRevUpdateAt(prodRev.getProdRevUpdateAt())
	            .prodRevDeleteYn(prodRev.getProdRevDeleteYn())
	            .prodRevDeleteAt(prodRev.getProdRevDeleteAt())
	            .parentId(prodRev.getParentId())
	            .build();
	        dtos.add(dto);
	    }
	    
	    return dtos;
	}
	
	// 답글 등록 

    public void saveReview(ProdReviewDto dto) {
        
        ProdReview prodReview = ProdReview.builder()
                .prodNo(dto.getProdNo())
                .prodRevContent(dto.getProdRevContent())
                .prodRevStar(dto.getProdRevStar())
                .userNo(dto.getUserNo())
                .parentId(dto.getParentId())
                .build();
        
        int result = prodReviewRepository.saveReview(prodReview);
		// 확인
		if (result < 1) {
			throw new CustomRestfulException("답글 등록에 실패했습니다.", HttpStatus.INTERNAL_SERVER_ERROR);
		}
    }
	// 리뷰 등록 
    public void addReview(ProdReviewDto dto) {
        
        ProdReview prodReview = ProdReview.builder()
                .prodNo(dto.getProdNo())
                .prodRevContent(dto.getProdRevContent())
                .prodRevStar(dto.getProdRevStar())
                .userNo(dto.getUserNo())
                .parentId(dto.getParentId())
                .build();
        

        int result = prodReviewRepository.addReview(prodReview);

		// 확인
		if (result < 1) {
			throw new CustomRestfulException("리뷰 등록에 실패했습니다.", HttpStatus.INTERNAL_SERVER_ERROR);
		}
    }


    // 리뷰 삭제
    public void deleteReview(Integer prodRevNo) {
    	
    	int result = prodReviewRepository.deleteReview(prodRevNo);
		if (result < 1) {
			throw new CustomRestfulException("리뷰 삭제에 실패하였습니다.", HttpStatus.INTERNAL_SERVER_ERROR);
		}

	}
    
    // 리뷰 개수 count
    public Integer getCountReview(Integer prodNo) {
    	return prodReviewRepository.countReview(prodNo);
    }
    
    public Double getAvgStar(Integer prodNo) {
    	Double avgStar = prodReviewRepository.avgStar(prodNo);
        return avgStar != null ? avgStar : 0;
    }
}
