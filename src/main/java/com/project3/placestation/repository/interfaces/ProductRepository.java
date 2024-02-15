package com.project3.placestation.repository.interfaces;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project3.placestation.repository.entity.Product;

@Mapper
public interface ProductRepository {

	// 상품 전체 리스트
    List<Product> productListAll();
}
