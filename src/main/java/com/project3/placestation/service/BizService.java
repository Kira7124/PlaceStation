package com.project3.placestation.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project3.placestation.admin.dto.Criteria;
import com.project3.placestation.repository.entity.Biz;
import com.project3.placestation.repository.interfaces.BizRepository;

@Service
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
	
	
	
	
	
	
}
