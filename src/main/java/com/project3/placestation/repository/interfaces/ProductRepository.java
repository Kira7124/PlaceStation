package com.project3.placestation.repository.interfaces;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import com.project3.placestation.repository.entity.ProdReview;
import com.project3.placestation.repository.entity.Product;

@Component
@Mapper
public interface ProductRepository {

	// 상품 전체 리스트
	public List<Product> findAll();
	// 상품 리스트 리뷰 개수
	public List<ProdReview> findAllByRev();
	// 상품 리스트 높은 평점
	public List<Product> findAllByStar();
	// 상품 리스트 최신
	public List<Product> findAllByStart();
	
	public int saveProduct(Product product); // 상품 저장
	public List<Product> findAllByUserId(int userId); // 상품 전체 조회
	public List<Product> findProductAllByUserId(int userId); // 상품 전체 조회
	public List<Product> findAllLimitEight(); // 상품 전체 조회
	public Product findById(int prodNo);
	public int updateProduct(@Param(value = "product")Product product , @Param(value = "changeImage") String changeImage);
	public int deleteProduct(@Param(value = "prodNo")int prodNo ,@Param(value = "prodDeleteReason") String prodDeleteReason);

}
