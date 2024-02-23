package com.project3.placestation.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;

import com.project3.placestation.biz.handler.exception.CustomRestfulException;
import com.project3.placestation.biz.model.dto.ReqBizAccountDto;
import com.project3.placestation.repository.interfaces.BizRepository;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class BizService {
	
	@Autowired
	BizRepository bizRepository;
	
	// 유저 업데이트
	public void updateBizByBizId(ReqBizAccountDto accountDto , int bizId) {
		int result = bizRepository.updateBizByBizId(accountDto , bizId);
		if(result < 1) {
			throw new CustomRestfulException("유저 정보 변경 시 서버 에러가 발생하였습니다.", HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
}
