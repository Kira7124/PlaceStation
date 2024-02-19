package com.project3.placestation.biz.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project3.placestation.biz.handler.exception.CustomRestfulException;
import com.project3.placestation.biz.model.dto.ReqBizAccountDto;
import com.project3.placestation.filedb.service.FiledbService;
import com.project3.placestation.repository.entity.BizJoin;
import com.project3.placestation.service.BizService;
import com.project3.placestation.service.MemberService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/biz")
public class BizAccountController {

	@Autowired
	MemberService memberService;
	
	@Autowired
	FiledbService filedbService;
	
	@Autowired
	BizService bizService;
	
	
	/**
	 * 사업자 유저 상세 조회
	 * @param model
	 * @return
	 */
	// http://localhost/biz/account-management
	@GetMapping("/account-management")
	public String accountManagementForm(Model model) {
		
		int userId = 1;
		BizJoin dto = memberService.SelectJoinBiz(userId);
		
		if(dto == null) {
			throw new CustomRestfulException("회원 정보가 변경되었거나 없습니다.", HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		log.info(dto.toString());
		
		model.addAttribute("biz" , dto);
		return "biz/account/biz_account_management";
	}
	
	/**
	 * 사업자 유저 업데이트 폼
	 * @param model
	 * @return
	 */
	@GetMapping("/account/update-form")
	public String updateForm(Model model) {
		
		int userId = 1;
		BizJoin dto = memberService.SelectJoinBiz(userId);
		
		if(dto == null) {
			throw new CustomRestfulException("회원 정보가 변경되었거나 없습니다.", HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		log.info(dto.toString());
		
		model.addAttribute("biz" , dto);
		return "biz/account/biz_account_update";
	}
	
	/**
	 * 사업자 계정 수정
	 * @param accountDto
	 * @return
	 */
	@PutMapping("/account/update")
	public String updateBiz(ReqBizAccountDto accountDto) {
		log.info(accountDto.toString());
		
//		^: 문자열의 시작을 나타냅니다.
//		(?=.*[0-9]): 숫자가 최소한 1개 포함되어야 합니다.
//		(?=.*[a-z]): 소문자가 최소한 1개 포함되어야 합니다.
//		(?=.*[A-Z]): 대문자가 최소한 1개 포함되어야 합니다.
//		(?=.*[@#$%^&+=!]): 특수 문자(@, #, $, %, ^, &, +, =, ! 중 하나)가 최소한 1개 포함되어야 합니다.
//		(?=\S+$): 공백이 없어야 합니다.
//		.{8,}$: 최소한 8자 이상의 문자열이어야 합니다.
//		$: 문자열의 끝을 나타냅니다.
		
		// 정규식
		String regex = "(01[0-9]{1}|02|0[3-9]{1}[0-9]{1})-[0-9]{3,4}-[0-9]{4}"; // 휴대폰

		// 1. 유효성 검사
		if(accountDto.getUserName() == null || accountDto.getUserName().isEmpty() || accountDto.getUserName().length() > 20) {
			throw new CustomRestfulException("유저이름을 적어주세요", HttpStatus.BAD_REQUEST);
		}
		if(accountDto.getUserPassword() == null || accountDto.getUserPassword().isEmpty()) {
			throw new CustomRestfulException("유저 패스워드를 적어주세요", HttpStatus.BAD_REQUEST);
		}
		if(accountDto.getBizTel() == null || accountDto.getBizTel().isEmpty()) {
			throw new CustomRestfulException("대표 전화번호를 적어주세요", HttpStatus.BAD_REQUEST);
		}
		if(accountDto.getChangePassword().equals("Y")) {
			if(accountDto.getUserHp() == null || accountDto.getUserHp().isEmpty()) {
				throw new CustomRestfulException("일반 전화번호를 적어주세요", HttpStatus.BAD_REQUEST);
			}
		}
		 if(!accountDto.getUserHp().matches(regex) || accountDto.getUserHp().length() > 15) {
				throw new CustomRestfulException("유효하지 않은 휴대폰 번호 입니다.", HttpStatus.BAD_REQUEST);
		 }
		 if(!accountDto.getBizTel().matches(regex)  || accountDto.getBizTel().length() > 15) {
				throw new CustomRestfulException("유효하지 않은 휴대폰 번호 입니다.", HttpStatus.BAD_REQUEST);
		 }
		if(accountDto.getUserAddress() == null || accountDto.getUserAddress().isEmpty()) {
			throw new CustomRestfulException("주소를 입력해주세요", HttpStatus.BAD_REQUEST);
		}
		if(accountDto.getBizBrandName() == null || accountDto.getBizBrandName().isEmpty()) {
			throw new CustomRestfulException("사업자 상호명을 적어주세요", HttpStatus.BAD_REQUEST);
		}
//		if(accountDto.getProfile() == null || accountDto.getProfile().isEmpty()) {
//			throw new CustomRestfulException("프로필 사진이 없습니다. 프로필 사진을 등록해주세요", HttpStatus.BAD_REQUEST);
//		}
		
		
		
		String filePath = "";
		// 프로필 사진을 변경했다면
		if(accountDto.getChangeImage().equals("Y")) {
			filePath = filedbService.saveFiles(accountDto.getProfile());
		}
		
		int userId = 1;
		
		log.info(filePath);
		// 업데이트
		accountDto.setFilePath(filePath);
		memberService.BizUpdateMember(accountDto , 1);
		bizService.updateBizByBizId(accountDto , userId);
		
//		// 사업자 등록증을 변경했다면..
//		if(accountDto.getBizFile().equals('Y')) {
//			
//		}
		
		
		return "redirect:/biz/account-management";
	}
	
}
