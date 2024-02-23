package com.project3.placestation.repository.interfaces;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project3.placestation.biz.model.dto.ReqProdSubcategoryDto;

@Mapper
public interface ProdSubcategoryRepository {
	
	public List<ReqProdSubcategoryDto> findAll(); // 전체 조회
	public List<ReqProdSubcategoryDto> findByMainCategoryId(int mainCategoryId); // mainCategoryId 로 서브카테고리 찾기
	
}
