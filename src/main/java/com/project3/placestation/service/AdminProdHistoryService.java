package com.project3.placestation.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project3.placestation.biz.model.dto.BizHistoryDto;
import com.project3.placestation.biz.model.util.PageReq;
import com.project3.placestation.biz.model.util.PageRes;
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
	@Transactional
	public PageRes<BizHistoryDto> findByBizId(int bizId  ,PageReq pageReq) {
		List<BizHistoryDto> list = adminProdHistoryRepository.findAllByBizId(bizId , pageReq);
		int totalCount = adminProdHistoryRepository.countFindAllByBizId(bizId);
		

		 PageRes<BizHistoryDto> pageRes = new PageRes<>(list, pageReq.getPage() , totalCount , pageReq.getSize());
			log.info("가져온 값입니다. : " + pageRes);
		 return pageRes;
	}
}
