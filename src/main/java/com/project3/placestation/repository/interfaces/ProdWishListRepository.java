package com.project3.placestation.repository.interfaces;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.project3.placestation.member.dto.MemberWishListDto;
import com.project3.placestation.repository.entity.ProdWishList;

@Mapper
public interface ProdWishListRepository {
    
    public int addWishList(ProdWishList wishList);

	public void deleteWishList(ProdWishList prodWishList);

	public int countWishlist(Integer prodNo);

	public int findByProdNoAndUserNo(@Param("prodNo")Integer prodNo,@Param("userNo") Integer userNo);
	
	// 자신이 찜한 목록 확인
	public List<MemberWishListDto> findByUserNo(int userNo);
}
