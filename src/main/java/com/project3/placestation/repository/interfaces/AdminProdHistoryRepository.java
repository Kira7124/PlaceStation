package com.project3.placestation.repository.interfaces;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project3.placestation.biz.model.dto.BizHistoryDto;

@Mapper
public interface AdminProdHistoryRepository {
	
	public List<BizHistoryDto> findAllByBizId(int bizId);

}
