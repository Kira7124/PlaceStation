package com.project3.placestation.service;

import java.util.List;

import org.apache.el.stream.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project3.placestation.admin.dto.Criteria;
import com.project3.placestation.member.dto.MemberWishListDto;
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

    // 상품이 찜 목록에 있는지 확인
    public boolean isProductInWishlist(int prodNo, int userNo) {
        int count = prodWishListRepository.findByProdNoAndUserNo(prodNo, userNo);
        
        return count > 0;
    }
    
    // 유저 넘버로 찜목록 확인
    public List<MemberWishListDto> findByUserNo(int userNo, Criteria cri)  {
    	return prodWishListRepository.findByUserNo(userNo, cri);
    }
}
