package com.project3.placestation.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project3.placestation.repository.interfaces.ProductViewRepository;

@Service
public class ProductViewService {

	@Autowired
	ProductViewRepository productViewRepository;
	
    // 상품 조회수 증가
    public void increaseProductViews(int prodNo) throws Exception {
        productViewRepository.increaseProductViews(prodNo);
    }
    

    // 상품 조회수 가져오기
    public int getProductViews(int prodNo) {
        return productViewRepository.getProductViews(prodNo);
    }

}
