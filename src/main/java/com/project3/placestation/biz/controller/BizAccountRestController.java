package com.project3.placestation.biz.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.project3.placestation.biz.model.dto.ReqPassword;
import com.project3.placestation.biz.model.dto.ResPassword;
import com.project3.placestation.service.MemberService;

import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
@RequestMapping("/biz")
public class BizAccountRestController {

	@Autowired
	MemberService memberService;

	@PostMapping("/account/password-check")
	public ResponseEntity<?> passwordCheck(@RequestBody ReqPassword currentPassword) {
		try {
			// 우효성 검사
			log.info(currentPassword.toString());
			System.out.println("안되나요");
			if(currentPassword.getPassword() == null || currentPassword.getPassword().isEmpty()) {
				return new ResponseEntity<>("데이터가 오지 않았습니다." ,HttpStatus.BAD_REQUEST);
			}
			
			// 서버에서 정보 받기
			int bizId = 1;
			ResPassword dbPassword = memberService.BizFindCurrentPassword(bizId);
			log.info(dbPassword.toString());
			
			// 확인
			if(dbPassword.getPassword().equals(currentPassword.getPassword())) {
				System.out.println("확인!!");
				return new ResponseEntity<>(true,HttpStatus.ACCEPTED);
			}
			return new ResponseEntity<>(false,HttpStatus.BAD_REQUEST);
		} catch (Exception e) {
			return new ResponseEntity<>(false , HttpStatus.BAD_REQUEST);
		}
	}
}
