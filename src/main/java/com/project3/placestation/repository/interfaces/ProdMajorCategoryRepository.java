package com.project3.placestation.repository.interfaces;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project3.placestation.biz.model.dto.ReqProdMainCategoryDto;

@Mapper
public interface ProdMajorCategoryRepository {
	public List<ReqProdMainCategoryDto> findAll();
}
