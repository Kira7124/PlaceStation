package com.project3.placestation.repository.interfaces;

import org.apache.ibatis.annotations.Mapper;

import com.project3.placestation.repository.entity.Company;

@Mapper
public interface CompanyRepository {

	// 회사 정보 전체 찾기
	public Company findCompany();
	
	// 회사 잔고 플러스
	public int updateCompanyBalance(int balance);
	
}
