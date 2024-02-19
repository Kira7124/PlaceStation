package com.project3.placestation.repository.interfaces;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.project3.placestation.biz.model.dto.BizHistoryDto;
import com.project3.placestation.biz.model.util.PageReq;

@Mapper
public interface AdminProdHistoryRepository {
	
	public List<BizHistoryDto> findAllByBizId(@Param("bizId") int bizId ,@Param("pageReq") PageReq pageReq);
	public int countFindAllByBizId(int bizId);
	
}
