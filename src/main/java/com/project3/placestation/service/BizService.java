package com.project3.placestation.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project3.placestation.admin.dto.AdminBizDTO;
import com.project3.placestation.admin.dto.Criteria;
import com.project3.placestation.biz.handler.exception.CustomRestfulException;
import com.project3.placestation.biz.model.dto.ReqBizAccountDto;
import com.project3.placestation.repository.entity.Biz;
import com.project3.placestation.repository.interfaces.BizRepository;

import lombok.extern.slf4j.Slf4j;


@Service
@Slf4j
public class BizService {

	
	@Autowired
	private BizRepository bizRepository;
	
	//사업자회원정보리스트 (페이징) 출력
	public List<Biz> BizAll(Criteria cri) throws Exception{
		List<Biz> result = bizRepository.BizAll(cri);
		return result;
		
	}
	
	
	//사업자회원숫자세기(페이징)
	public int countMember() throws Exception{
		return bizRepository.countBiz();
	}
	
	
	//사업자검색리스트(페이징)
	public List<Biz> searchBizMemberlist(Criteria cri) throws Exception{
		List<Biz> result = bizRepository.searchBizMemberlist(cri);
		return result;
	}
	
	
	//사업자검색리스트숫자세기(페이징)
	public int countSearchBizlist(Criteria cri) throws Exception {
		return bizRepository.countSearchBizlist(cri);
	}
	
	
	//사업자등록증확인(관리자)
	public Biz detailBizFile(Integer bizNo) throws Exception{
		return bizRepository.detailBizFile(bizNo);
	}
	
	
	//관리자사업자수정
	@Transactional
	public void AdminUpdateBiz(AdminBizDTO dto,String filePath) {
		Biz biz = Biz.builder()
				.bizNo(dto.getBizno())
				.bizId(dto.getBizid())
				.bizBrandName(dto.getBizbrandname())
				.bizHp(dto.getBizhp())
				.bizTel(dto.getBiztel())
				.bizEmail(dto.getBizemail())
				.filePath(filePath)
				.build();
			
		
		Integer result = bizRepository.AdminUpdateBiz(biz);
		
	}
	
	
	//관리자사업자삭제
	@Transactional
	public void AdminDeleteBiz(AdminBizDTO dto) {
		Biz biz = Biz.builder()
				.bizNo(dto.getBizno())
				.bizId(dto.getBizid())
				.build();
		
		Integer result = bizRepository.AdminDeleteBiz(biz);
	}
	
  
	// 유저 업데이트
	public void updateBizByBizId(ReqBizAccountDto accountDto , int bizId) {
		int result = bizRepository.updateBizByBizId(accountDto , bizId);
		if(result < 1) {
			throw new CustomRestfulException("유저 정보 변경 시 서버 에러가 발생하였습니다.", HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	
	
	
	
}
