package com.project3.placestation.repository.interfaces;

import org.apache.ibatis.annotations.Mapper;

import com.project3.placestation.repository.entity.Charge;

@Mapper
public interface ChargeRepository {

	public Charge findChPercent();
}
