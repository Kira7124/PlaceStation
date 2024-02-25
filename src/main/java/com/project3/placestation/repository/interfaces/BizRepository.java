package com.project3.placestation.repository.interfaces;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.project3.placestation.biz.model.dto.ReqBizAccountDto;
import com.project3.placestation.payment.model.dto.PaymentFortOneKeyDto;

@Mapper
public interface BizRepository {

	public int updateBizByBizId(@Param("biz")ReqBizAccountDto biz ,@Param("bizId")int bizId);
	
	// 사업자 포트원 키 찾기
	public PaymentFortOneKeyDto findFortOneKeyByBizNo(int bizNo);
}
