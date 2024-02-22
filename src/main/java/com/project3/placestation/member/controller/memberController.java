package com.project3.placestation.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project3.placestation.member.dto.RequestJoinDTO;
import com.project3.placestation.member.dto.bizJoinDTO;
import com.project3.placestation.repository.entity.BizJoin;
import com.project3.placestation.service.MemberService;

@RequestMapping("/member")
@Controller
public class memberController {

	
	@Autowired
	private MemberService service;
	
	
	
	
	@GetMapping("/login")
	public String login(Model model) {
		/*
		 * String id = SecurityContextHolder.getContext().getAuthentication().getName();
		 * Authentication authentication =
		 * SecurityContextHolder.getContext().getAuthentication();
		 * 
		 * Collection<? extends GrantedAuthority> authorities =
		 * authentication.getAuthorities(); Iterator<? extends GrantedAuthority> iter =
		 * authorities.iterator(); GrantedAuthority auth = iter.next(); String role =
		 * auth.getAuthority();
		 * 
		 * model.addAttribute("id", id); model.addAttribute("role", role);
		 */

		return "member/login";
	}

	@GetMapping("/history")
	public String myPageHistory() {

		return "member/mypage_history";
	}

	@GetMapping("/main")
	public String myPageMain(Model model) {

		/*
		 * String id = SecurityContextHolder.getContext().getAuthentication().getName();
		 * Authentication authentication =
		 * SecurityContextHolder.getContext().getAuthentication();
		 * 
		 * Collection<? extends GrantedAuthority> authorities =
		 * authentication.getAuthorities(); Iterator<? extends GrantedAuthority> iter =
		 * authorities.iterator(); GrantedAuthority auth = iter.next(); String role =
		 * auth.getAuthority();
		 * 
		 * model.addAttribute("role", role); model.addAttribute("id", id);
		 */

		return "member/mypage_main";
	}

	@GetMapping("/qna")
	public String myPageQna() {

		return "member/mypage_qna";
	}

	@GetMapping("/sterms")
	public String sellerTerms() {

		return "member/terms_seller";
	}

	@GetMapping("/uterms")
	public String userTerms() {

		return "member/terms_user";
	}

	@GetMapping("/sregister")
	public String sellerRegister(Model model) {
		
		/*
		 * String id = SecurityContextHolder.getContext().getAuthentication().getName();
		 * Authentication authentication =
		 * SecurityContextHolder.getContext().getAuthentication();
		 * 
		 * Collection<? extends GrantedAuthority> authorities =
		 * authentication.getAuthorities(); Iterator<? extends GrantedAuthority> iter =
		 * authorities.iterator(); GrantedAuthority auth = iter.next(); String role =
		 * auth.getAuthority();
		 * 
		 * System.out.println("s회원가입 아이디: "+ id); System.out.println("s회원가입 롤: "+ role);
		 * 
		 * model.addAttribute("role", role); model.addAttribute("id", id);
		 */


		return "member/seller_register_form";
	}

	@GetMapping("/uregister")
	public String userRegister() {

		return "member/user_register_form";
	}

	@GetMapping("/wishlist")
	public String myPageWishlist() {

		return "member/mypage_wishlist";
	}

	
	// 회원가입 처리 
	@PostMapping("/uJoinProc")
	public String joinProcess(RequestJoinDTO dto) {
		
		System.out.println("회원 가입 form데이터 바인딩 테스트: "+ dto.toString());
		System.out.println("회원 가입 form데이터 바인딩 테스트1: "+ dto.getUserId());
		System.out.println("회원 가입 form데이터 바인딩 테스트2: "+ dto.getUserName());
		System.out.println("회원 가입 form데이터 바인딩 테스트3: "+ dto.getUserPassword());
		System.out.println("회원 가입 form데이터 바인딩 테스트4: "+ dto.getUserEmail());
		System.out.println("회원 가입 form데이터 바인딩 테스트5: "+ dto.getUserAddress());
		System.out.println("회원 가입 form데이터 바인딩 테스트6: "+ dto.getGender());
		System.out.println("회원 가입 form데이터 바인딩 테스트7: "+ dto.getGender());
		System.out.println("회원 가입 form데이터 바인딩 테스트8: "+ dto.getUserHp());
		
		service.joinProcess(dto);
		
		return "redirect:/member/login";
	}
	
	
	
	////////////////////////////////////////////////////////// biz
	////////////////////////////////////////////////////////// /////////////////////////////////////////////////////////////
	@Autowired
	private MemberService memberService;

	@GetMapping("/management")
	public String bizList(bizJoinDTO bizId, Model model) {

		/*
		 * User principal = (User)session.getAttribute(Define.PRINCIPAL); if(principal
		 * == null) { throw new MyUnAuthorizedException("로그인이 필요합니다.",
		 * HttpStatus.UNAUTHORIZED); }
		 */

		BizJoin dto = memberService.SelectJoinBiz(bizId); // principal.getuser_id();

		model.addAttribute("dto", dto);

		return "/";
	}

}
