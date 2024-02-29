package com.project3.placestation.repository.interfaces;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.project3.placestation.biz.model.dto.BizHistoryDto;
import com.project3.placestation.biz.model.dto.BizMonthlyFeeDto;
import com.project3.placestation.biz.model.dto.DbToken;
import com.project3.placestation.biz.model.dto.MemberToptenDto;
import com.project3.placestation.biz.model.dto.ResScheduleDto;
import com.project3.placestation.biz.model.dto.StatisticDto;
import com.project3.placestation.biz.model.util.PageReq;
import com.project3.placestation.payment.model.dto.AdminHisPointDto;
import com.project3.placestation.product.dto.ProductInvalidDateDto;
import com.project3.placestation.repository.entity.AdminProdHistory;

@Mapper
public interface AdminProdHistoryRepository {

	// 사업자 거래 내역 관리
	public List<BizHistoryDto> findAllByBizId(@Param("bizId") int bizId, @Param("pageReq") PageReq pageReq , @Param("text") String text);

	// 사업자 거래 내역 관리 - 페이징 처리
	public int countFindAllByBizId(@Param("bizId") int bizId , @Param("text") String text);

	// 사업자 스케쥴 관리
	public List<ResScheduleDto> findScheduleByBizId(int bizId);

	// 사업자 통계 - 매출
	public List<StatisticDto> findStatisticSales(@Param("bizId") int bizId, @Param("kind") String kind);

	// 사업자 통계 - 판매량
	public int findStatisticSalesVolumes(@Param("bizId") int bizId, @Param("kind") String kind);

	// 상품 시간 제한
	public List<ProductInvalidDateDto> findProductInvalidByProdNo(@Param("prodNo") int prodNo,
			@Param("date") String date);

	// 거래 내역 저장
	public int save(AdminProdHistory adminProdHistory);

	// 유저의 포인트 내역 확인
	public AdminHisPointDto findUserPointByBuyerId(int buyerId);

	// 토큰 정보 빼오기
	public DbToken getToken(String merchantUid);

	// 환불
	public int updateCancel(@Param("merchantUid")String merchantUid,@Param("cancelAmount") double cancelAmount);
	
	// 많이 산 유저 탑 5
	public List<MemberToptenDto> findMemberTopFive(int bizId);
	
	// 월 수수료 통계
	public List<BizMonthlyFeeDto> findMonthlyFee(int bizId);

}
