package com.project3.placestation.repository.interfaces;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project3.placestation.repository.entity.QnaBoardCategory;

@Mapper
public interface QnaBoardCategoryRepository {

	// 1 : 1 문의 카테고리 전체 불러오기
	public List<QnaBoardCategory> findAll();
}
