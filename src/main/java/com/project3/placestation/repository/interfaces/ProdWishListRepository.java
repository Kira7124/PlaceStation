package com.project3.placestation.repository.interfaces;

import org.apache.ibatis.annotations.Mapper;

import com.project3.placestation.repository.entity.ProdWishList;

@Mapper
public interface ProdWishListRepository {
    
    public int addWishList(ProdWishList wishList);

	public void deleteWishList(ProdWishList prodWishList);

	public int countWishlist(Integer prodNo);


}
