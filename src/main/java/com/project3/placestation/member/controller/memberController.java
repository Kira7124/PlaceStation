package com.project3.placestation.member.controller;

import java.util.Collection;
import java.util.Iterator;
import java.util.StringTokenizer;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project3.placestation.config.jwt.UserDetailsImpl;
import com.project3.placestation.config.oauth2.Oauth2Attributes;
import com.project3.placestation.config.oauth2.SessionUser;
import com.project3.placestation.filedb.service.FiledbService;
import com.project3.placestation.member.dto.MemberLoginDto;
import com.project3.placestation.member.dto.RequestJoinDTO;
import com.project3.placestation.member.dto.memberDTO;
import com.project3.placestation.repository.entity.BizJoin;
import com.project3.placestation.repository.entity.Member;
import com.project3.placestation.repository.interfaces.MemberRepository;
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
	HttpSession httpSession;

	@Autowired
	FiledbService fileService;

	@Autowired
	MemberRepository repository;
	
	
	

	@GetMapping("/login")
	public String login(Model model) {
		// 유저 네임 정보
		String id = SecurityContextHolder.getContext().getAuthentication().getName();
		Object details = SecurityContextHolder.getContext().getAuthentication().getDetails();
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		model.addAttribute("role", details);
		model.addAttribute("name", id);

		System.out.println("s회원가입 아이디: " + id);
		System.out.println("s회원가입 롤: " + details);

		return "member/login";
	}

	/*
	 * mypage의 메인 http://localhost/member/main
	 * 
	 */
	@GetMapping("/mypage/main")
	public String myPageMain(Model model) { // Model model) {

		// TODO 해당 구문은 메인페이지로 넘어가야함 로그인시 마이페이지 메인으로 넘어가면 안됨

		/*
		 // 유저 네임 정보 String id =
		 SecurityContextHolder.getContext().getAuthentication().getName(); Object
		 details =
		 SecurityContextHolder.getContext().getAuthentication().getDetails(); Object
		 principal =
		 SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		 
		 // 유저 객체 정보 (userDetailsImpl 클래스의 필드에 정의된 변수 정보) Authentication
		 Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		 
		 // Todo : 2) 인증된 객체들를 홀더에 저장해둠
		 SecurityContextHolder.getContext().setAuthentication(authentication);
		 
		 Collection<? extends GrantedAuthority> authorities =
		 authentication.getAuthorities(); Iterator<? extends GrantedAuthority> iter =
		 authorities.iterator(); GrantedAuthority auth = iter.next(); String role =
		 auth.getAuthority();
		 
		 UserDetailsImpl userDetails = (UserDetailsImpl)
		 authentication.getPrincipal();
		 
		 
		 Member member = Member .builder() .userno(userDetails.getUserNo())
		 .userid(userDetails.getUserId()) .useraddress(userDetails.getUserAddress())
		 .useremail(userDetails.getEmail()) .userhp(userDetails.getUserHp())
		 .username(id) .userpoint(userDetails.getUserPoin()) .userrole(role)
		 .grade(userDetails.getGrade()) .joinat(userDetails.getJoinAt())
		 .gender(userDetails.getGender()) .build();
		 
		 
		 // 세션에 저장 httpSession.setAttribute("member", authentication);
		 
		 
		 System.out.println("멤버 투스트링 ^^&^&^&^&^&&&&&&&&&&&&&&&&&&&&&&&&&&& " +
		 member.toString());
		 System.out.println("멤버 투스트링 ^^&^&^&^&^&&&&&&&&&&&&&&&&&&&&&&&&&&& 포인트 " +
		 member.getUserpoint());
		 System.out.println("멤버 투스트링 ^^&^&^&^&^&&&&&&&&&&&&&&&&&&&&&&&&&&& 포인트 " +
		 member.getGender());
		 System.out.println("멤버 투스트링 ^^&^&^&^&^&&&&&&&&&&&&&&&&&&&&&&&&&&& 포인트 " +
		 member.getGrade());
		 
		 
		 System.out.println("유저테이더 출력 디테일스@@@@@@@@@@: " + details);
		 System.out.println("유저테이더 출력 디테일스@@@@@@@@@@: " + details.toString());
		 System.out.println("유저테이더 출력 프린시펄!!!!!: " + principal);
		 System.out.println("유저테이더 출력 프린시펄!!!!!: " + principal.toString());
		 
		 
		 
		 System.out.println("========================================="); // Ip
		 address 값, SessionId 값 출력 System.out.println("디테일 : " +
		 authentication.getDetails()); System.out.println("디테일 : " +
		 authentication.getDetails().toString()); // System.out.println("이름 :" +
		 authentication.getName()); System.out.println("프린시퍼 " +
		 authentication.getPrincipal()); System.out.println("프린시퍼 " +
		 authentication.getPrincipal().toString()); System.out.println("유저 정보 : " +
		 userDetails.getUsername()); System.out.println("유저 이메일(id) : " +
		 userDetails.getEmail()); System.out.println("유저 password: " +
		 userDetails.getPassword()); System.out.println("유저 point: " +
		 userDetails.getUserPoin()); System.out.println("유저 grade: " +
		 userDetails.getGrade());
		 
		 System.out.println("s회원가입 아이디: " + id); System.out.println("s회원가입 롤: " +
		 role);
		 
		 model.addAttribute("role", role); model.addAttribute("name", id);
		 */
		
		

		/*
		 * Object principal = httpSession.getAttribute("member");
		 * 
		 * model.addAttribute("principal",principal);
		 * 
		 */
		
		
		// 세번째 시도
		
	    Object oauthUser= httpSession.getAttribute("OauthMember");
		 
	    log.info(" 마이페이지 메인 세션에 남는 객체 정보 "+oauthUser);
	    log.info(" 마이페이지 메인 세션에 남는 객체 정보 tostirng~~~~~ "+oauthUser.toString());
	    
	    
		model.addAttribute("oauthUser",oauthUser);
		
		

		return "member/mypage_main";
	}

	/*
	 * @GetMapping("/member/mypage-main") public String mypageForm (){
	 * log.info("mypage Form"); MemberLoginDto dto= (MemberLoginDto)
	 * httpSession.getAttribute("member"); if(dto == null ) { return
	 * "redirect:/member/login"; } return "member/mypage_main"; }
	 */

	@GetMapping("/mypage/qna")
	public String myPageQna() {

		return "member/mypage_qna";
	}

	@GetMapping("/mypage/history")
	public String myPageHistory() {

		return "member/mypage_history";
	}

	@GetMapping("/mypage/wishlist")
	public String myPageWishlist() {

		return "member/mypage_wishlist";
	}

	@GetMapping("/mypage/managementParty")
	public String myPageManagementParty() {

		return "member/mypage_managementParty";
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

		return "member/seller_register_form";
	}

	@GetMapping("/uregister")
	public String userRegister() {

		return "member/user_register_form";
	}

	// 일반유저 회원가입 처리 유저
	@PostMapping("/uJoinProc")
	public String uJoinProcess(RequestJoinDTO dto) {

		String address = dto.getZip() + dto.getAddr1() + dto.getAddr2();

		// 합친 주소
		dto.setUserAddress(address);

		// 합친 이메일
		String userEmail = dto.getEmail();
		dto.setEmail(userEmail);

		service.uJoinProcess(dto);

		return "redirect:/member/login";
	}

	// 판매자 회원가입 처리
	@PostMapping("/sJoinProc")
	public String joinProcess(RequestJoinDTO dto) {

		// 파일 저장
		String filepath = fileService.saveFiles(dto.getFilePath());

		String fulladdress = dto.getAddr1();

		// 주소 수정
		String address = dto.getZip() + dto.getAddr1() + " " + dto.getAddr2();
		dto.setUserAddress(address);

		System.out.println("조인 유저 어드레스1111111 : " + dto.getZip());
		System.out.println("조인 유저 어드레스2222222222 : " + dto.getAddr1());
		System.out.println("조인 유저 어드레스333333333 : " + dto.getAddr2());
		System.out.println("조인 유저 어드레스4444444444 : " + address);
		System.out.println("조인 유저 어드레스5555555555555 : " + dto.getImpkey());
		System.out.println("조인 유저 어드레스6666666666666 : " + dto.getImpsecret());
		System.out.println("조인 유저 어드레스77777777777777777 : " + dto.getImpuid());

		// 이메일값 수정
		String userEmail = dto.getEmail();
		dto.setEmail(userEmail);

		// 판매자 회원 가입 서비스 호출
		service.sJoinProcess(dto, filepath);

		return "redirect:/member/login";
	}

	// 소셜 로그인
	@GetMapping("/social/register")
	public String registerSocialMember(Model model) {
		String username = null;
		// @RequestBody Oauth2Attributes attributes
		log.info("소셜로그인 페이지 요청 겟맵핑 시작~~~~~~~~~~");
		/*
		 * // 추가 정보를 입력받은 후에 데이터베이스에 저장 Member member = Member.builder()
		 * .userid(attributes.getUsername()) .userpassword(attributes.getPassword())
		 * .username(attributes.getNickname()) .useremail(attributes.getEmail()) // 다른
		 * 속성도 필요에 따라 추가 .build();
		 */

		/* repository.insertUser(member); */

		// ResponseEntity.ok("Social member registered successfully!")

		// 세션 유저 객체에서 빼온 유저 정보 캐스팅
		// 캐스팅한 유저정보로 최초 소셜 로그인 여부 검증
		SessionUser principal = (SessionUser) httpSession.getAttribute("member");
		System.out.println("11111111111111111111111111");
		model.addAttribute("principal", principal);
		System.out.println("222222222222222222222222222222222222" + principal.getName());

		Member member = new Member();
		member.setUserid(principal.getName());

		if (member.getUserid() != null) {
			username = member.getUserid();
		}
		System.out.println("33333333333333333333333333333333333333333");
		
		Member checkOauth = service.OauthFirstCheckProcess(username);
		System.out.println("44444444444444444444444444444444444444444 " + checkOauth);
		if (checkOauth != null) {
			System.out.println("55555555555555555555555555555555555555555555555555555");
			// TODO 여기 메인화면으로 바꿔줘야함

			UserDetailsImpl buildMember = UserDetailsImpl.build(checkOauth);
			httpSession.setAttribute("OauthMember",buildMember);
			return "member/login";
		} else {
			System.out.println("66666666666666666666666666666666666666666666666666666");
			return "member/socialregister";
		}

	}

	@PostMapping("/social/register")
	public String registerSocialMemberProc(RequestJoinDTO dto) {

		String fulladdress = dto.getAddr1();

		// 주소 수정
		String address = dto.getZip() + dto.getAddr1() + " " + dto.getAddr2();
		dto.setUserAddress(address);

		System.out.println("조인 유저 어드레스1111111 : " + dto.getZip());
		System.out.println("조인 유저 어드레스2222222222 : " + dto.getAddr1());
		System.out.println("조인 유저 어드레스333333333 : " + dto.getAddr2());
		System.out.println("조인 유저 어드레스4444444444 : " + address);
		System.out.println("조인 유저 어드레스5555555555555 : " + dto.toString());

		// 유저 아이디 수정
		String userid = dto.getUserId();

		String[] parse = userid.split("_", 2); // "_"를 기준으로 문자열을 2개로 분할

		for (int i = 0; i < parse.length; i++) {
			System.out.println("Index " + i + ": " + parse[i]);
		}

		// oauth명 파싱
		String oauth = parse[0]; // 소셜 구분
		String userName = parse[1]; // 소셜 prefix가 떨어진 유저명

		System.out.println("Prefix: " + oauth);
		System.out.println("Remainder: " + userName);

		dto.setUserOauth(oauth + "_");
		dto.setUserId(userName);

		// 이메일값 수정
		String userEmail = dto.getEmail();
		dto.setEmail(userEmail);

		// 오스 이메일 가입자의 비밀번호 생성
		int randomNumber = (int) (Math.random() * 100000000);
		UUID uuPass = new UUID(0, randomNumber);

		System.out.println("조인 유저 어드레스88888888888888 : " + randomNumber);

		dto.setUserPassword(uuPass.toString());

		System.out.println("조인 유저 어드레스999999999999999999 : " + uuPass.toString());

		System.out.println("조인 유저 어드레스66666666666666666666 : " + dto.toString());
		// 회원 가입 서비스 호출
		UserDetailsImpl OauthJoinProcess = service.OauthJoinProcess(dto);

		
		httpSession.setAttribute("OauthMember", OauthJoinProcess);
		
		// ResponseEntity.ok("Social member registered successfully!")
		return "redirect:/member/login";
	}
	
	@PostMapping("/mypage/userUpdate")
	public void myPageUpdateProc() {
		
	}
	
	
	
	
	@PostMapping("/changePhoto")
	public String changePhoto(Member member) {
		
		String filePath = fileService.saveFiles(member.getProfilefilepath());
		memberService.changePhoto(member, filePath);
		
		return "redirect:/member/mypage/main";
		
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
