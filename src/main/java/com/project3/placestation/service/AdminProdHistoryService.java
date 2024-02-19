package com.project3.placestation.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project3.placestation.biz.model.dto.BizHistoryDto;
import com.project3.placestation.biz.model.dto.ResScheduleDto;
import com.project3.placestation.biz.model.dto.ScheduleDto;
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
	public PageRes<BizHistoryDto> findByBizId(int bizId  ,PageReq pageReq) {
		List<BizHistoryDto> list = adminProdHistoryRepository.findAllByBizId(bizId , pageReq);
		int totalCount = adminProdHistoryRepository.countFindAllByBizId(bizId);
		

		 PageRes<BizHistoryDto> pageRes = new PageRes<>(list, pageReq.getPage() , totalCount , pageReq.getSize());
		 return pageRes;
	}
	
	/**
	 * 스케쥴 관리
	 * @param bizId
	 * @return
	 */
	public List<ScheduleDto> findScheduleByBizId(int bizId) {
		List<ResScheduleDto> dtos = adminProdHistoryRepository.findScheduleByBizId(bizId);
		log.info(dtos.toString());
		
		List<ScheduleDto> scheduleDtos = new ArrayList<>();
		for(ResScheduleDto dto : dtos) {
			scheduleDtos.add(new ScheduleDto(dto.getProdTitle() , dto.getStartTime() , dto.getEndTime() , dto.getPurchaseDate()));
		}
		log.info(scheduleDtos.toString());
		return scheduleDtos;
	}
}
