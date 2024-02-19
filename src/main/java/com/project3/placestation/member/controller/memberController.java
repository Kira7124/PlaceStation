package com.project3.placestation.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project3.placestation.member.dto.bizJoinDTO;
import com.project3.placestation.repository.entity.BizJoin;
import com.project3.placestation.service.MemberService;

@RequestMapping("/member")
@Controller
public class memberController {

	
	@GetMapping("/login")
	public String login() {
		
		return "member/login";
	}
	
	
	
	@GetMapping("/history")
	public String myPageHistory() {
		
		return "member/mypage_history";
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
