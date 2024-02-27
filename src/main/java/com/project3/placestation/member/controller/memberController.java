package com.project3.placestation.member.controller;

import java.util.Collection;
import java.util.Iterator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project3.placestation.config.jwt.JwtUtils;
import com.project3.placestation.config.jwt.UserDetailsImpl;
import com.project3.placestation.member.dto.MemberLoginDto;
import com.project3.placestation.member.dto.RequestJoinDTO;
import com.project3.placestation.member.dto.bizJoinDTO;
import com.project3.placestation.repository.entity.BizJoin;
import com.project3.placestation.repository.entity.Member;
import com.project3.placestation.service.MemberService;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@RequestMapping("/member")
@Controller
@Slf4j
public class memberController {

	@Autowired
	private MemberService service;

	@Autowired
	JwtUtils jwtUtils;

	@Autowired
	HttpSession httpSession;

	@GetMapping("/login")
	public String login(Model model) {

		
		return "member/login";
	}

	@GetMapping("/history")
	public String myPageHistory() {

		return "member/mypage_history";
	}

	
	/*
	 * mypage의 메인
	 * http://localhost/member/main
	 *  
	 * */
	@GetMapping("/main")
	public String myPageMain(Model model) {

		String id = SecurityContextHolder.getContext().getAuthentication().getName();
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

		// Todo : 2) 인증된 객체들를 홀더에 저장해둠
		SecurityContextHolder.getContext().setAuthentication(authentication);

		Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities();
		Iterator<? extends GrantedAuthority> iter = authorities.iterator();
		GrantedAuthority auth = iter.next();
		String role = auth.getAuthority();

		UserDetailsImpl userDetails = (UserDetailsImpl) authentication.getPrincipal();
		
		String jwt = jwtUtils.generateJwtToken(authentication);
		
		MemberLoginDto member = MemberLoginDto
				.builder().token(jwt)
				.userNo(userDetails.getUserNo())
				.userId(userDetails.getEmail())
				.build();
		
		httpSession.setAttribute("member", member);

		System.out.println("디테일 : " + authentication.getDetails());
		System.out.println("이름 :" + authentication.getName());
		System.out.println("프린시퍼 " + authentication.getPrincipal());
		System.out.println("유저 정보 : " + userDetails.getUsername());
		System.out.println("유저 이메일(id) : " + userDetails.getEmail());
		System.out.println("유저 password: " + userDetails.getPassword());

		System.out.println("s회원가입 아이디: " + id);
		System.out.println("s회원가입 롤: " + role);

		model.addAttribute("role", role);
		model.addAttribute("id", id);

		return "member/mypage_main";
	}
	
	
	@GetMapping("/member/mypage-main") 
	public String mypageForm (){
		log.info("mypage Form");
		MemberLoginDto dto=  (MemberLoginDto) httpSession.getAttribute("member");
		if(dto == null ) {
			return "redirect:/member/login";
		}
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

		System.out.println("ssssssssssssssssssssssssssssssssssssssss");
		
		
		
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

		System.out.println("회원 가입 form데이터 바인딩 테스트: " + dto.toString());
		System.out.println("회원 가입 form데이터 바인딩 테스트1: " + dto.getUserId());
		System.out.println("회원 가입 form데이터 바인딩 테스트2: " + dto.getUserName());
		System.out.println("회원 가입 form데이터 바인딩 테스트3: " + dto.getUserPassword());
		System.out.println("회원 가입 form데이터 바인딩 테스트4: " + dto.getUserEmail());
		System.out.println("회원 가입 form데이터 바인딩 테스트5: " + dto.getUserAddress());
		System.out.println("회원 가입 form데이터 바인딩 테스트6: " + dto.getGender());
		System.out.println("회원 가입 form데이터 바인딩 테스트7: " + dto.getGender());
		System.out.println("회원 가입 form데이터 바인딩 테스트8: " + dto.getUserHp());

		service.joinProcess(dto);

		return "redirect:/member/login";
	}

	////////////////////////////////////////////////////////// biz
	////////////////////////////////////////////////////////// /////////////////////////////////////////////////////////////
	@Autowired
	private MemberService memberService;

	@GetMapping("/management")
	public String bizList(int bizId, Model model) {

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
