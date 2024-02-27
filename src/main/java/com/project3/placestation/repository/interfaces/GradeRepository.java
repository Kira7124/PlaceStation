package com.project3.placestation.repository.interfaces;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project3.placestation.repository.entity.Grade;

@Mapper
public interface GradeRepository {

	// grade name 컬럼으로 상세 조회
	public Grade findByGradeName(String gradeName);
	
	public List<Grade> findAll();
	
}
