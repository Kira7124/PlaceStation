package com.project3.placestation.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project3.placestation.repository.entity.Charge;
import com.project3.placestation.repository.interfaces.ChargeRepository;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class ChargeService {
	
	@Autowired
	ChargeRepository chargeRepository;
	
	/**
	 * 해당 수수료 값 찾기
	 * @return
	 */
	public Charge findChPercent() {
		return chargeRepository.findChPercent();
	}

}
