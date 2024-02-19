package com.project3.placestation.repository.interfaces;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.project3.placestation.biz.model.dto.ReqBizAccountDto;

@Mapper
public interface BizRepository {

	public int updateBizByBizId(@Param("biz")ReqBizAccountDto biz ,@Param("bizId")int bizId);
}
