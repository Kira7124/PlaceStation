package com.project3.placestation.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project3.placestation.biz.handler.exception.CustomRestfulException;
import com.project3.placestation.biz.model.util.BizDefine;
import com.project3.placestation.party.dto.PartyDto;
import com.project3.placestation.repository.entity.Party;
import com.project3.placestation.repository.interfaces.PartyRepository;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class PartyService {

	@Autowired
	PartyRepository partyRepository;

	/**
	 * 모임 전체 조회
	 * 
	 * @return
	 */
	public List<Party> findAll() {
		return partyRepository.findAll();
	}

	/**
	 * 모인 상세 조회
	 */
	public PartyDto findById(int partyNo) {
		PartyDto dto = partyRepository.findById(partyNo);
		if (dto == null) {
			throw new CustomRestfulException(BizDefine.PRODUCT_NOTHING_FOUND, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return dto;
	}

	/**
	 * 모임 시간 체크
	 * @param purchaseDate
	 * @param startTime
	 * @return
	 */
	public boolean validJoinTime(String purchaseDate , int startTime) {
		Date now = new Date();
		
		String purchaseDate2 = purchaseDate + " " + startTime;
		
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH");
		try {
			Date parseDate = dateFormat.parse(purchaseDate2);	
			if(now.before(parseDate)) {
				return false;
			}
			
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return true;
	}

}
