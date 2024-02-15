package com.project3.placestation.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project3.placestation.dto.AdminUserDTO;
import com.project3.placestation.dto.Criteria;
import com.project3.placestation.dto.PageVO;
import com.project3.placestation.repository.entity.User;
import com.project3.placestation.service.UserService;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private HttpSession httpSession;
	
	
	

	
	
	//http://localhost:80/admin/admin-main
	// 관리자 기본메인페이지 출력
	@GetMapping("/admin-main")
	public String adminpageGET() {
		log.debug("admin 메인 페이지 출력!");
		return "admin/adminmain";
	}
	
	
	
	
	
	//http://localhost:80/admin/admin-user
	//관리자 유저관리페이지 출력
	@GetMapping("/admin-user")
	public String adminuserGET(AdminUserDTO dto,Model model,Criteria cri) throws Exception {
		
		PageVO pageVO = new PageVO();
		pageVO.setCri(cri);
		pageVO.setTotalCount(userService.countUser());
		
		model.addAttribute("pageVO", pageVO);
		
		List<User> result = userService.listAll(cri);
		
		model.addAttribute("userlist", result);
		
		log.debug("admin-user관리 페이지 출력!");
		return"admin/adminuser";
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
