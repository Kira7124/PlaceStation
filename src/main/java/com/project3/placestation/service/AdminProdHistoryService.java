package com.project3.placestation.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project3.placestation.biz.model.dto.BizHistoryDto;
import com.project3.placestation.repository.interfaces.AdminProdHistoryRepository;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class AdminProdHistoryService {

	@Autowired
	AdminProdHistoryRepository adminProdHistoryRepository;
	
	/**
	 * 사업자의 거래 내역 전체 조회
	 * @param bizId
	 * @return BizHistoryDto
	 */
	public List<BizHistoryDto> findByBizId(int bizId) {
		return adminProdHistoryRepository.findAllByBizId(bizId);
	}
}