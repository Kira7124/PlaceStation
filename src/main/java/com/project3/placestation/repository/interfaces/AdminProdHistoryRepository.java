package com.project3.placestation.repository.interfaces;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.project3.placestation.admin.dto.Criteria;
import com.project3.placestation.biz.model.dto.BizHistoryDto;
import com.project3.placestation.biz.model.dto.ResScheduleDto;
import com.project3.placestation.biz.model.dto.StatisticDto;
import com.project3.placestation.biz.model.util.PageReq;
import com.project3.placestation.biz.model.util.StatisticKind;
import com.project3.placestation.product.dto.ProductInvalidDateDto;

@Mapper
public interface AdminProdHistoryRepository {
	
	//관리자 결제내역 관리
	public List<BizHistoryDto> paymentlistAll(Criteria cri) throws Exception;
	
	//관리자 결제내역 관리 카운팅(페이징용)
	public int countPayment() throws Exception;
	
	//결제내역(검색,페이징)
	public List<BizHistoryDto> searchPaymentlist(Criteria cri) throws Exception;
	
	//결제내역숫자세기(검색,페이징)
	public int countSearchPaymentlist(Criteria cri) throws Exception;

	//결제총액
	public Integer countAdminpaymentCount() throws Exception;
	
	//관리자 환불처리
	public Integer AdminPaymentCancel(BizHistoryDto dto);
	
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

	// 상품 시간 제한
	public List<ProductInvalidDateDto> findProductInvalidByProdNo(@Param("prodNo")int prodNo , @Param("date") String date);
}
