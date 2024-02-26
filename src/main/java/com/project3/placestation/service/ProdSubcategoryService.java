package com.project3.placestation.service;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project3.placestation.biz.model.dto.ReqProdSubcategoryDto;
import com.project3.placestation.repository.interfaces.ProdSubcategoryRepository;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class ProdSubcategoryService {

	@Autowired
	ProdSubcategoryRepository prodSubcategoryRepository;
	
	/**
	 * Subcategory 모두 찾기
	 * @return
	 */
	public List<ReqProdSubcategoryDto> findAll() {
		return prodSubcategoryRepository.findAll();
	}
	
	/**
	 * mainCategoryId 로 서브카테고리 찾기
	 * @param mainCategoryId
	 * @return
	 */
	public List<ReqProdSubcategoryDto> findByMainCategoryId(int mainCategoryId) {
		return prodSubcategoryRepository.findByMainCategoryId(mainCategoryId);
	}
}
