package com.project3.placestation.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project3.placestation.admin.dto.AdminMemberDTO;
import com.project3.placestation.admin.dto.Criteria;
import com.project3.placestation.admin.dto.PageVO;
import com.project3.placestation.repository.entity.Member;
import com.project3.placestation.service.MemberService;

import jakarta.servlet.http.HttpServletRequest;
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
	
	
	
	//http://localhost:80/admin/admin-update
	//admin 회원update페이지출력(모달)
	@GetMapping("/admin-update")
	public String adminupdateGET() {
		log.debug("adminupdate페이지출력");
		return "admin/adminupdate";
	}
	
	
	
	//Modal 에서 ~
	//관리자회원정보수정POST (회원번호를 받아서 조회한다음에, 해당하는 회원의 정보를 전달받아서 수정!)
	@PostMapping("/admin-update")
	public String adminupdatePOST(AdminMemberDTO dto) {
		log.debug("adminupdatePOST실행!");
		memberService.AdminUpdateMember(dto);
		
		return "redirect:/admin/admin-member";
	}
	
	
	
	
	
	
	//http://localhost:80/admin/admin-delete
	//admin 회원delete페이지출력(모달)
	@GetMapping("/admin-delete")
	public String admindeleteGET() {
		log.debug("admindelete페이지출력");
		return "admin/admindelete";
	}
	
	
	
	
	//admin 회원deletePOST 실행
	//Modal~...
	@PostMapping("/admin-delete")
	public String admindeletePOST(AdminMemberDTO dto) {
		memberService.AdminDeleteMember(dto);
		log.debug("admindeletePOST 삭제처리완!");
		return"redirect:/admin/admin-member";
	}
	
	
	
	@GetMapping("/admin-searchmember")
	public String adminuserGET(HttpServletRequest request, Criteria cri, Model model) throws Exception {
		
		String searchKeyword = request.getParameter("searchKeyword");
		
	    if (searchKeyword != null && !searchKeyword.isEmpty()) {
	        cri.setSearchKeyword(searchKeyword);
	    }

	    PageVO pageVO = new PageVO();
	    pageVO.setCri(cri);
	    pageVO.setTotalCount(memberService.countSearchMemberlist(cri));

	    model.addAttribute("pageVO", pageVO);

	    List<Member> result = memberService.searchMemberlist(cri);

	    model.addAttribute("memberlist", result);

	    log.debug("admin-user관리 페이지 출력!");
	    return "admin/adminsearchlist";
	}
	
	
	
	
	
	
	
	
	
	
}
