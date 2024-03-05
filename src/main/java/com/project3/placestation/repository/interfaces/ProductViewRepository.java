package com.project3.placestation.repository.interfaces;

import org.apache.ibatis.annotations.Mapper;

import com.project3.placestation.product.dto.ResProductViewDto;

@Mapper
public interface ProductViewRepository {

    public void increaseProductViews(Integer prodNo) throws Exception;
    public ResProductViewDto getProductViews(int prodNo);
    
}
