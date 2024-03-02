package com.project3.placestation.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;

import com.project3.placestation.biz.handler.exception.CustomRestfulException;
import com.project3.placestation.party.dto.PartyDto;
import com.project3.placestation.repository.entity.Party;
import com.project3.placestation.repository.interfaces.PartyRepository;

import lombok.extern.slf4j.Slf4j;
import com.project3.placestation.biz.model.util.BizDefine;
@Service
@Slf4j
public class PartyService {

	@Autowired
	PartyRepository partyRepository;
	
	/**
	 * 모임 전체 조회
	 * @return
	 */
	public List<Party> findAll() {
		return partyRepository.findAll();
	}
	
	/**
	 * 모인 상세 조회
	 */
	public PartyDto findById(int partyNo) {
		PartyDto dto =  partyRepository.findById(partyNo);
		if(dto == null) {
			throw new CustomRestfulException(BizDefine.PRODUCT_NOTHING_FOUND, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return dto;
	}
}
