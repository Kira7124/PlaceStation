package com.project3.placestation.repository.interfaces;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.project3.placestation.biz.model.dto.BizHistoryDto;
import com.project3.placestation.biz.model.dto.ResScheduleDto;
import com.project3.placestation.biz.model.dto.StatisticDto;
import com.project3.placestation.biz.model.util.PageReq;
import com.project3.placestation.biz.model.util.StatisticKind;

@Mapper
public interface AdminProdHistoryRepository {
	
	// 사업자 거내 내역 관리
	public List<BizHistoryDto> findAllByBizId(@Param("bizId") int bizId ,@Param("pageReq") PageReq pageReq);
	
	// 사업자 거래 내역 관리 - 페이징 처리 
	public int countFindAllByBizId(int bizId);
	
	//  사업자 스케쥴 관리
	public List<ResScheduleDto> findScheduleByBizId(int bizId);
	
	// 사업자 통계 - 매출
	public List<StatisticDto> findStatisticSales(@Param("bizId") int bizId ,@Param("kind") String kind);
	
	// 사업자 통계 - 판매량
	public int findStatisticSalesVolumes(@Param("bizId") int bizId ,@Param("kind") String kind);

}
