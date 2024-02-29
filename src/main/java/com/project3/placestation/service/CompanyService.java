package com.project3.placestation.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project3.placestation.repository.entity.Company;
import com.project3.placestation.repository.interfaces.CompanyRepository;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class CompanyService {

	@Autowired
	CompanyRepository companyRepository;
	
	/**
	 * 컴퍼니 정보 찾기
	 * @return
	 */
	public Company findCompany() {
		return companyRepository.findCompany();
	}
	

	/**
	 * 회사 잔고 플러스
	 * @param comBalance
	 * @param sumBalance
	 * @return
	 */
	public int updateSumCompanyBalance(int comBalance , int sumBalance) {
		int balance = comBalance + sumBalance;
		int result = companyRepository.updateCompanyBalance(balance);
		return result;
	}
	

	/**
	 * 회사 잔고 마이너스
	 * @param comBalance
	 * @param sumBalance
	 * @return
	 */
	public int updateMinCompanyBalance(int comBalance , int sumBalance) {
		int balance = comBalance - sumBalance;
		int result = companyRepository.updateCompanyBalance(balance);

		return result;
	}
}
