package com.project3.placestation.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project3.placestation.member.dto.bizJoinDTO;
import com.project3.placestation.repository.entity.BizJoin;
import com.project3.placestation.service.MemberService;

import java.util.Collection;
import java.util.Iterator;

@RequestMapping("/member")
@Controller
public class memberController {

	
	@GetMapping("/login")
	public String login(Model model) {

		String id = SecurityContextHolder.getContext().getAuthentication().getName();

		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

		Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities();
		Iterator<? extends  GrantedAuthority> iter = authorities.iterator();
		GrantedAuthority auth = iter.next();
		String role = auth.getAuthority();

		model.addAttribute("id",id);
		model.addAttribute("role",role);
		
		
		return "member/login";
	}
	
	
	
	@GetMapping("/history")
	public String myPageHistory() {
		
		return "member/mypage_history";
	}
	
	
	@GetMapping("/main")
	public String myPageMain() {
		
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
	public String sellerRegister() {
		
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
	
	
	
	
	////////////////////////////////////////////////////////// biz /////////////////////////////////////////////////////////////
	@Autowired
	private MemberService memberService;
	
	
	@GetMapping("/management") 
	public String bizList(bizJoinDTO bizId, Model model) {
		
		/*User principal = (User)session.getAttribute(Define.PRINCIPAL);
		if(principal == null) {
			throw new MyUnAuthorizedException("로그인이 필요합니다.", HttpStatus.UNAUTHORIZED);
		}*/
		
		
		BizJoin dto = memberService.SelectJoinBiz(bizId); //principal.getuser_id();
		
		model.addAttribute("dto", dto);
		
		return "/";
	}

}
