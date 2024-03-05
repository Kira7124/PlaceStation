package com.project3.placestation.repository.interfaces;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ProductViewRepository {

    public void increaseProductViews(int prodNo);
    public int getProductViews(int prodNo);
    
}
