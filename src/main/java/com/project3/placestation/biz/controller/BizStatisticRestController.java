package com.project3.placestation.biz.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.project3.placestation.biz.model.dto.ResStatisticDto;
import com.project3.placestation.biz.model.dto.StatisticDto;
import com.project3.placestation.biz.model.util.StatisticKind;
import com.project3.placestation.service.AdminProdHistoryService;

import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
@RequestMapping("/biz/statistic")
public class BizStatisticRestController {

	@Autowired
	AdminProdHistoryService adminProdHistoryService;

	/**
	 * 사업자 통계
	 * 
	 * @param bizId
	 * @return
	 */
	@GetMapping("/all")
	public ResponseEntity<?> getAll() {
		try {

			int bizId = 1;
			List<StatisticDto> annualList = adminProdHistoryService.findStatisticSales(bizId, StatisticKind.ANNUAL);
			List<StatisticDto> monthlyList = adminProdHistoryService.findStatisticSales(bizId, StatisticKind.MONTHLY);
			List<StatisticDto> weekList = adminProdHistoryService.findStatisticSales(bizId, StatisticKind.WEEK);

			int annualCount = adminProdHistoryService.findStatisticSalesVolumes(bizId, StatisticKind.ANNUAL);
			int monthlyCount = adminProdHistoryService.findStatisticSalesVolumes(bizId, StatisticKind.MONTHLY);
			int weekCount = adminProdHistoryService.findStatisticSalesVolumes(bizId, StatisticKind.WEEK);

			ResStatisticDto dto = ResStatisticDto.builder().annualList(annualList).monthlyList(monthlyList)
					.weekList(weekList).annualCount(annualCount).monthlyCount(monthlyCount).weekCount(weekCount)
					.build();

			log.info(dto.toString());
			return new ResponseEntity<>(dto, HttpStatus.OK);
		} catch (Exception e) {
			log.info(e.getMessage());
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

}
