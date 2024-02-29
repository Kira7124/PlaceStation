package com.project3.placestation.biz.controller.restController;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.project3.placestation.biz.model.dto.BizMonthlyFeeDto;
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
			List<StatisticDto> annualList = exchangeList(adminProdHistoryService.findStatisticSales(bizId, StatisticKind.ANNUAL)); // 년간 매출
			
			
			List<StatisticDto> monthlyList = exchangeList(adminProdHistoryService.findStatisticSales(bizId, StatisticKind.MONTHLY)); // 월간 매출
			
			log.info(monthlyList.toString());
			List<StatisticDto> weekList = exchangeList(adminProdHistoryService.findStatisticSales(bizId, StatisticKind.WEEK)); // 주간 매출 

			int annualCount = adminProdHistoryService.findStatisticSalesVolumes(bizId, StatisticKind.ANNUAL); // 년간 판매량
			int monthlyCount = adminProdHistoryService.findStatisticSalesVolumes(bizId, StatisticKind.MONTHLY); // 월간 판매량
			int weekCount = adminProdHistoryService.findStatisticSalesVolumes(bizId, StatisticKind.WEEK); // 주간 판매량
			
			List<BizMonthlyFeeDto> monthlyFeeStatistic = adminProdHistoryService.findMonthlyFee(bizId); // 월간 수수료 통계
			
			ResStatisticDto resStatisticDto = ResStatisticDto.builder().annualList(annualList).monthlyList(monthlyList)
					.weekList(weekList).annualCount(annualCount).monthlyCount(monthlyCount).weekCount(weekCount)
					.build();
			
			
			List<Integer> monthlyFeeCharge = new ArrayList<>(); // 월간 수수료
			List<String> monthlyFeeDate = new ArrayList<>(); // 수수료 월 데이터
			
			for(BizMonthlyFeeDto dto : monthlyFeeStatistic) {
				monthlyFeeCharge.add(dto.getCharge());
				monthlyFeeDate.add(dto.getDate());
			}
			
			resStatisticDto.setMonthlyFeeCharge(monthlyFeeCharge);
			resStatisticDto.setMonthlyFeeDate(monthlyFeeDate);
			

			log.info(monthlyFeeStatistic.toString());
			log.info(resStatisticDto.toString());
			return new ResponseEntity<>(resStatisticDto, HttpStatus.OK);

		} catch (Exception e) {
			log.info(e.getMessage());
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	/**
	 * 
	 * @param list
	 * @return
	 */
	public List<StatisticDto> exchangeList(List<StatisticDto> list) {
		List<StatisticDto> sList = new ArrayList<>();
		for(StatisticDto dto : list) {
			if(dto.getCancelAmount() > 0) {
				dto.setAmount(dto.getAmount() - dto.getCancelAmount());
			}
			sList.add(dto);
		}
		return sList;
	}
}
