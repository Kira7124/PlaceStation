package com.project3.placestation.repository.interfaces;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ProductViewRepository {

    public void increaseProductViews(Integer prodNo) throws Exception;
    public int getProductViews(int prodNo);
    
}
