package com.project3.placestation.repository.interfaces;


import java.util.List;


import org.apache.ibatis.annotations.Mapper;

import com.project3.placestation.admin.dto.Criteria;
import com.project3.placestation.repository.entity.Biz;
import org.apache.ibatis.annotations.Param;

import com.project3.placestation.biz.model.dto.ReqBizAccountDto;
import com.project3.placestation.payment.model.dto.PaymentFortOneKeyDto;

@Mapper
public interface BizRepository {

	//사업자명단출력(페이징처리)
	public List<Biz> BizAll(Criteria cri) throws Exception;
	
	//사업자숫자세기(페이징처리)
	public int countBiz() throws Exception;
	
	//사업자명단출력(검색 , 페이징처리)
	public List<Biz> searchBizMemberlist(Criteria cri) throws Exception;
	
	//사업자명단숫자세기(검색,페이징처리)
	public int countSearchBizlist(Criteria cri) throws Exception;
	
	//사업자정보수정(관리자)
	public Integer AdminUpdateBiz(Biz biz);
		
	//사업자정보삭제(관리자)
	public Integer AdminDeleteBiz(Biz biz);
	

	public int updateBizByBizId(@Param("biz")ReqBizAccountDto biz ,@Param("bizId")int bizId);
	
	
	//사업자등록증(관리자조회)
	public Biz detailBizFile(Integer bizNo) throws Exception;

	// 사업자 포트원 키 찾기
	public PaymentFortOneKeyDto findFortOneKeyByBizNo(int bizNo);

}
