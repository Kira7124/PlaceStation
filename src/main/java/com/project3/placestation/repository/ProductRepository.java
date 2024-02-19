package com.project3.placestation.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.project3.placestation.model.entity.Product;

@Mapper
public interface ProductRepository {

	public int saveProduct(Product product); // 상품 저장
	public List<Product> findAll(int userId); // 상품 전체 조회
	public Product findById(int prodNo);
	public int updateProduct(@Param(value = "product")Product product , @Param(value = "changeImage") String changeImage);
	public int deleteProduct(@Param(value = "prodNo")int prodNo ,@Param(value = "prodDeleteReason") String prodDeleteReason);
}
