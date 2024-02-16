package com.project3.placestation.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project3.placestation.admin.dto.AdminMemberDTO;
import com.project3.placestation.admin.dto.Criteria;
import com.project3.placestation.admin.dto.PageVO;
import com.project3.placestation.repository.entity.Member;
import com.project3.placestation.service.MemberService;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private HttpSession httpSession;
	
	
	
	//http://localhost:80/admin/admin-main
	// 관리자 기본메인페이지 출력
	@GetMapping("/admin-main")
	public String adminpageGET() {
		log.debug("admin 메인 페이지 출력!");
		return "admin/adminmain";
	}
	
	
	//http://localhost:80/admin/admin-member
	//관리자 유저관리페이지 출력
	@GetMapping("/admin-member")
	public String adminuserGET(AdminMemberDTO dto,Model model,Criteria cri) throws Exception {
		
		PageVO pageVO = new PageVO();
		pageVO.setCri(cri);
		pageVO.setTotalCount(memberService.countMember());
		
		model.addAttribute("pageVO", pageVO);
		
		List<Member> result = memberService.listAll(cri);
		
		model.addAttribute("memberlist", result);
		
		log.debug("admin-user관리 페이지 출력!");
		return"admin/adminmember";
	}
	
	
	
	//http://localhost:80/admin/admin-seller
	//관리자 사업자관리페이지 출력
	@GetMapping("/admin-seller")
	public String adminsellerGET() {
		log.debug("admin-seller관리 페이지 출력!");
		return "admin/adminseller";
	}
	
	
	
	
	//http://localhost:80/admin/admin-payment
	//관리자 결제,예약관리페이지출력
	@GetMapping("/admin-payment")
	public String adminpaymentGET() {
		log.debug("admin 결제,예약관리 페이지출력!");
		return "admin/adminpayment";
	}
	
	
	//http://localhost:80/admin/admin-notice
	//관리자 공지사항관리페이지출력
	@GetMapping("/admin-notice")
	public String adminnoticeGET() {
		log.debug("admin 공지사항관리페이지출력!");
		return "admin/adminnotice";
	}
	
	
	
	//http://localhost:80/admin/admin-qna
	//관리자 1:1문의관리페이지출력
	@GetMapping("/admin-qna")
	public String adminqnaGET() {
		log.debug("admin 1:1문의관리페이지출력!");
		return "admin/adminqna";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
