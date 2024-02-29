package com.project3.placestation.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project3.placestation.repository.entity.QnaBoardCategory;
import com.project3.placestation.repository.interfaces.QnaBoardCategoryRepository;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class QnaBoardCategoryService {
	
	@Autowired
	QnaBoardCategoryRepository boardCategoryRepository;
	
	/**
	 * 카테고리 전체 찾기
	 * @return
	 */
	public List<QnaBoardCategory> findAll() {
		return boardCategoryRepository.findAll();
	}

}
