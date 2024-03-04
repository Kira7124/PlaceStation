package com.project3.placestation.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project3.placestation.biz.handler.exception.CustomRestfulException;
import com.project3.placestation.biz.model.util.BizDefine;
import com.project3.placestation.party.dto.ParcipationUserDto;
import com.project3.placestation.repository.interfaces.ParcipationPartyRepository;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class ParcipationPartyService {

	@Autowired
	ParcipationPartyRepository parcipationPartyRepository;

	/**
	 * 모임 방 안의 사람 찾기
	 * 
	 * @param partyNo
	 * @return
	 */
	public List<ParcipationUserDto> findAllById(int partyNo) {
		return parcipationPartyRepository.findAllById(partyNo);
	}

	/**
	 * 모임 방 안에 자신(유저) 가 있는지 체크
	 */
	public boolean validMemberJoin(List<ParcipationUserDto> list, int userNo) {
		for (ParcipationUserDto dto : list) {
			if (dto.getPartyUserNo() == userNo)
				return true;
		}
		return false;
	}
	
	/**
	 * 모임 참가하기
	 * @param partyNo
	 * @param userNo
	 * @return boolean
	 */
	@Transactional
	public boolean save(int partyNo , int userNo) {
		int result = parcipationPartyRepository.save(partyNo, userNo);
		if(result == 0) {
			throw new CustomRestfulException(BizDefine.INTERVAL_SERVER_ERROR, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return true;
	}
	
	/**
	 * 모임 불참가하기
	 * @param partyNo
	 * @param userNo
	 * @return boolean
	 */
	public boolean deleteParty(int partyNo , int userNo) {
		int result = parcipationPartyRepository.deleteParty(partyNo, userNo);
		if(result == 0) {
			throw new CustomRestfulException(BizDefine.INTERVAL_SERVER_ERROR, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return true;
	}
}
