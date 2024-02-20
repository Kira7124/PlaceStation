package com.project3.placestation.repository.interfaces;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project3.placestation.admin.dto.Criteria;
import com.project3.placestation.repository.entity.Biz;

@Mapper
public interface BizRepository {

	//사업자명단출력(페이징처리)
	public List<Biz> BizAll(Criteria cri) throws Exception;
	
	//사업자숫자세기(페이징처리)
	public int countBiz() throws Exception;
	
	
	
	
	
}
