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
import com.project3.placestation.repository.entity.BizJoin;
import com.project3.placestation.service.MemberService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/biz")
public class BizAccountController {

	@Autowired
	MemberService memberService;
	
	
	/**
	 * 사업자 유저 상세 조회
	 * @param model
	 * @return
	 */
	// http://localhost/biz/account-management
	@GetMapping("/account-management")
	public String accountManagementForm(Model model) {
		
		int userId = 1;
		BizJoin dto = memberService.SelectJoinBiz(1);
		
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
		BizJoin dto = memberService.SelectJoinBiz(1);
		
		if(dto == null) {
			throw new CustomRestfulException("회원 정보가 변경되었거나 없습니다.", HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		log.info(dto.toString());
		
		model.addAttribute("biz" , dto);
		return "biz/account/biz_account_update";
	}
	
	
	@PutMapping("/account/update")
	public String updateBiz(ReqBizAccountDto accountDto) {
		log.info(accountDto.toString());
		
		// 1. 유효성 검사
		if(accountDto.getUserName() == null || accountDto.getUserName().isEmpty()) {
			throw new CustomRestfulException("유저이름을 적어주세요", HttpStatus.BAD_REQUEST);
		}
		if(accountDto.getUserPassword() == null || accountDto.getUserPassword().isEmpty()) {
			throw new CustomRestfulException("유저 패스워드를 적어주세요", HttpStatus.BAD_REQUEST);
		}
		if(accountDto.getBizTel() == null || accountDto.getBizTel().isEmpty()) {
			throw new CustomRestfulException("전화번호를 적어주세요", HttpStatus.BAD_REQUEST);
		}
		if(accountDto.getUserAddress() == null || accountDto.getUserAddress().isEmpty()) {
			throw new CustomRestfulException("주소를 입력해주세요", HttpStatus.BAD_REQUEST);
		}
		if(accountDto.getBizBrandName() == null || accountDto.getBizBrandName().isEmpty()) {
			throw new CustomRestfulException("사업자 상호명을 적어주세요", HttpStatus.BAD_REQUEST);
		}
		if(accountDto.getProfile() == null || accountDto.getProfile().isEmpty()) {
			throw new CustomRestfulException("프로필 사진이 없습니다. 프로필 사진을 등록해주세요", HttpStatus.BAD_REQUEST);
		}
		if(accountDto.getChangeBizFile().equals('Y') ||  accountDto.getBizFile() == null && accountDto.getBizFile().isEmpty()) {
			throw new CustomRestfulException("사업자 등록증은 필수입니다.", HttpStatus.BAD_REQUEST);
		}
		
		
		
		return "redirect:/biz/account-management";
	}
	
}
