package com.project3.placestation.repository.interfaces;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.project3.placestation.admin.dto.Criteria;
import com.project3.placestation.biz.model.dto.BizHistoryDto;
import com.project3.placestation.biz.model.dto.BizMonthlyFeeDto;
import com.project3.placestation.biz.model.dto.DbToken;
import com.project3.placestation.biz.model.dto.MemberToptenDto;
import com.project3.placestation.biz.model.dto.ResScheduleDto;
import com.project3.placestation.biz.model.dto.StatisticDto;
import com.project3.placestation.biz.model.util.PageReq;
import com.project3.placestation.member.dto.MemberHistoryDto;
import com.project3.placestation.party.dto.CreatePartySelectDto;
import com.project3.placestation.payment.model.dto.AdminHisPointDto;
import com.project3.placestation.product.dto.ProductInvalidDateDto;
import com.project3.placestation.repository.entity.AdminProdHistory;

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
	
	//관리자 환불처리2
	public Integer AdminPaymentCancel2(BizHistoryDto dto);
	
	
	//관리자 환불내역확인3
	public BizHistoryDto AdminRefund(Integer adminHisProdNo);
	
	
	
	// 사업자 거내 내역 관리
	public List<BizHistoryDto> findAllByBizId(@Param("bizId") int bizId ,@Param("pageReq") PageReq pageReq);
	
	// 사업자 거래 내역 관리 - 페이징 처리 
	public int countFindAllByBizId(int bizId);
	


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
	public int updateCancel(@Param("merchantUid")String merchantUid,@Param("cancelAmount") double cancelAmount , @Param("cancelReason") String cancelReason);
	
	// 많이 산 유저 탑 5
	public List<MemberToptenDto> findMemberTopFive(int bizId);
	
	// 월 수수료 통계
	public List<BizMonthlyFeeDto> findMonthlyFee(int bizId);
	
	// 유저 번호로 모임 찾기
	public List<CreatePartySelectDto> findAllByUserNo(@Param("userNo") int userNo ,@Param("text") String text , @Param("pageReq")PageReq pageReq);
	
	// 유저 번호로 모임 찾기 페이징 처리 카운트
	public int countFindAllByUserNo(@Param("userNo") int userNo ,@Param("text") String text );
	
	// boolean (count) 조회
	public boolean existById(String adminProdNo);
	
	// 상세 조회
	public AdminProdHistory findByAdminHisNo(String adminProdNo);
	
	// 유저 번호로 거래내역 찾기
	public List<MemberHistoryDto> memberFindAllByUserNo(@Param("userNo") int userNo , @Param("pageReq")PageReq pageReq);
	
	// 유저 번호로 거래내역 찾기 페이징 처리 카운트
	public int countMemberFindAllByUserNo(@Param("userNo") int userNo );
}
