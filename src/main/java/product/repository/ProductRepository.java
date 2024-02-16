package product.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import product.entity.ProductEntity;

@Mapper
public interface ProductRepository {

	// 상품 전체 리스트
    List<ProductEntity> productListAll();
}
