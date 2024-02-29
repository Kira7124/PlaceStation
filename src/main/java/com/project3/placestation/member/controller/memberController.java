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

		// 유저 네임 정보
		String id = SecurityContextHolder.getContext().getAuthentication().getName();
		Object details = SecurityContextHolder.getContext().getAuthentication().getDetails();
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		// 유저 객체 정보 (userDetailsImpl 클래스의 필드에 정의된 변수 정보)
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

		// Todo : 2) 인증된 객체들를 홀더에 저장해둠
		SecurityContextHolder.getContext().setAuthentication(authentication);

		Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities();
		Iterator<? extends GrantedAuthority> iter = authorities.iterator();
		GrantedAuthority auth = iter.next();
		String role = auth.getAuthority();

		UserDetailsImpl userDetails = (UserDetailsImpl) authentication.getPrincipal();
		
		String jwt = jwtUtils.generateJwtToken(authentication);
		
		Member member = Member
				.builder().token(jwt)
				.userno(userDetails.getUserNo())
				.userid(userDetails.getEmail())
				.useraddress(userDetails.getEmail())
				.useremail(userDetails.getEmail())
				.userhp(userDetails.getEmail())
				.username(id)
				.userpoint(userDetails.getUserPoin())
				.userrole(role)
				.build();
		
		httpSession.setAttribute("member", member);

		
		System.out.println("유저테이더 출력 디테일스@@@@@@@@@@: " + details);
		System.out.println("유저테이더 출력 디테일스@@@@@@@@@@: " + details.toString());
		System.out.println("유저테이더 출력 프린시펄!!!!!: " + principal);
		System.out.println("유저테이더 출력 프린시펄!!!!!: " + principal.toString());
		
		
		
		System.out.println("=========================================");
		// Ip address 값, SessionId 값 출력
		System.out.println("디테일 : " + authentication.getDetails());
		System.out.println("디테일 : " + authentication.getDetails().toString());
		//
		System.out.println("이름 :" + authentication.getName());
		System.out.println("프린시퍼 " + authentication.getPrincipal());
		System.out.println("프린시퍼 " + authentication.getPrincipal().toString());
		System.out.println("유저 정보 : " + userDetails.getUsername());
		System.out.println("유저 이메일(id) : " + userDetails.getEmail());
		System.out.println("유저 password: " + userDetails.getPassword());
		System.out.println("유저 point: " + userDetails.getUserPoin());
		System.out.println("유저 grade: " + userDetails.getGrade());

		System.out.println("s회원가입 아이디: " + id);
		System.out.println("s회원가입 롤: " + role);

		model.addAttribute("role", role);
		model.addAttribute("name", id);

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

	// 일반유저 회원가입 처리 유저
	@PostMapping("/uJoinProc")
	public String uJoinProcess(RequestJoinDTO dto) {

		System.out.println("u회원 가입 form데이터 바인딩 테스트: " + dto.toString());
		System.out.println("u회원 가입 form데이터 바인딩 테스트1: " + dto.getUserId());
		System.out.println("u회원 가입 form데이터 바인딩 테스트2: " + dto.getUserName());
		System.out.println("u회원 가입 form데이터 바인딩 테스트3: " + dto.getUserPassword());
		System.out.println("u회원 가입 form데이터 바인딩 테스트4: " + dto.getUserEmail());
		System.out.println("u회원 가입 form데이터 바인딩 테스트5: " + dto.getUserAddress());
		System.out.println("u회원 가입 form데이터 바인딩 테스트6: " + dto.getGender());
		System.out.println("u회원 가입 form데이터 바인딩 테스트7: " + dto.getGender());
		System.out.println("u회원 가입 form데이터 바인딩 테스트8: " + dto.getUserHp());

		String address = dto.getZip() + dto.getAddr1() + dto.getAddr2();
		
		System.out.println("회원가입 주소 합친 데이터 확인: " + address);
		
		// 합친 주소
		dto.setUserAddress(address);
		
		System.out.println("회원가입 주소 합친 데이터 확인 dto버전: " + dto.getUserAddress());
		
		// 합친 이메일
		String userEmail = dto.getEmail() + "@" + dto.getEmail2();
		
		System.out.println("회원가입 Email 합친 데이터 확인: " + userEmail);
		
		dto.setUserEmail(userEmail);
		
		System.out.println("회원가입 Email 합친 데이터 확인 dto버전: " + dto.getUserEmail());
		
		service.uJoinProcess(dto);

		return "redirect:/member/login";
	}
	
	// 판매자 회원가입 처리
	@PostMapping("/sJoinProc")
	public String joinProcess(RequestJoinDTO dto) {
		
		System.out.println("s회원 가입 form데이터 바인딩 테스트: " + dto.toString());
		System.out.println("s회원 가입 form데이터 바인딩 테스트1: " + dto.getUserId());
		System.out.println("s회원 가입 form데이터 바인딩 테스트2: " + dto.getUserName());
		System.out.println("s회원 가입 form데이터 바인딩 테스트3: " + dto.getUserPassword());
		System.out.println("s회원 가입 form데이터 바인딩 테스트4: " + dto.getUserEmail());
		System.out.println("s회원 가입 form데이터 바인딩 테스트5: " + dto.getUserAddress());
		System.out.println("s회원 가입 form데이터 바인딩 테스트6: " + dto.getGender());
		System.out.println("s회원 가입 form데이터 바인딩 테스트7: " + dto.getGender());
		System.out.println("s회원 가입 form데이터 바인딩 테스트8: " + dto.getUserHp());
		

		// 합친 주소
		String address = dto.getZip() + dto.getAddr1() + dto.getAddr2();
		
		System.out.println("회원가입 주소 합친 데이터 확인: " + address);
		
		dto.setUserAddress(address);
		
		System.out.println("회원가입 주소 합친 데이터 확인 dto버전: " + dto.getUserAddress());
		
		// 합친 이메일
		String userEmail = dto.getEmail() + "@" + dto.getEmail2();
		
		System.out.println("회원가입 Email 합친 데이터 확인: " + userEmail);
		
		dto.setUserEmail(userEmail);
		
		System.out.println("회원가입 Email 합친 데이터 확인 dto버전: " + dto.getUserEmail());
		
		
		service.sJoinProcess(dto);
		
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
