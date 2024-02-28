package com.project3.placestation.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project3.placestation.product.dto.ProdWishListDto;
import com.project3.placestation.repository.entity.ProdWishList;
import com.project3.placestation.repository.interfaces.ProdWishListRepository;

@Service
public class ProdWishListService {
	
    @Autowired
    private ProdWishListRepository prodWishListRepository;

    // 찜 하기
    public void addWishList(ProdWishListDto dto) {
    	
        ProdWishList prodWishList = ProdWishList.builder()
        		.prodNo(dto.getProdNo())
        		.userNo(dto.getUserNo())
        		.build();
        
        prodWishListRepository.addWishList(prodWishList);
    }
    
    // 찜 취소(삭제)
    public void deleteWishList(ProdWishListDto dto) {
        ProdWishList prodWishList = ProdWishList.builder()
        		.prodNo(dto.getProdNo())
        		.userNo(dto.getUserNo())
        		.build();
        
        prodWishListRepository.deleteWishList(prodWishList);
    }
    
    // 찜 개수 count
    public int getCountWishlist(int prodNo) {
        return prodWishListRepository.countWishlist(prodNo);
    }
    
    
}
