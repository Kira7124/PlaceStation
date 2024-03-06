package com.project3.placestation.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project3.placestation.biz.model.dto.ReqProdMainCategoryDto;
import com.project3.placestation.repository.interfaces.ProdMajorCategoryRepository;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class ProdMajorCategoryService {

	@Autowired
	ProdMajorCategoryRepository categoryRepository;
	
	public List<ReqProdMainCategoryDto> findAll() {
		return categoryRepository.findAll();
	}
}
