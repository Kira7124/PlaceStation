package com.project3.placestation.member.controller;

import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project3.placestation.admin.dto.Criteria;
import com.project3.placestation.admin.dto.PageVO;
import com.project3.placestation.biz.handler.exception.CustomLoginRestfulException;
import com.project3.placestation.biz.model.util.BizDefine;
import com.project3.placestation.config.jwt.UserDetailsImpl;
import com.project3.placestation.config.oauth2.SessionUser;
import com.project3.placestation.filedb.service.FiledbService;
import com.project3.placestation.member.dto.MemberParcipationDto;
import com.project3.placestation.member.dto.MemberWishListDto;
import com.project3.placestation.member.dto.RequestJoinDTO;
import com.project3.placestation.member.dto.UserUpdateDTO;
import com.project3.placestation.repository.entity.BizJoin;
import com.project3.placestation.repository.entity.Member;
import com.project3.placestation.repository.entity.Party;
import com.project3.placestation.repository.interfaces.MemberRepository;
import com.project3.placestation.service.MemberService;
import com.project3.placestation.service.ParcipationPartyService;
import com.project3.placestation.service.PartyService;
import com.project3.placestation.service.ProdWishListService;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@RequestMapping("/user")
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

	@Autowired
	ParcipationPartyService parcipationPartyService;

	@Autowired
	PartyService partyService;
	
	@Autowired
	ProdWishListService prodWishListService;

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

		System.out.println("main ssssssssssssssssssss");

		/*
		 * // 멤버 받기 Member member = (Member) httpSession.getAttribute("member");
		 * if(member == null) { throw new
		 * CustomLoginRestfulException(BizDefine.ACCOUNT_IS_NONE,
		 * HttpStatus.INTERNAL_SERVER_ERROR); }
		 */

		Member member = (Member) httpSession.getAttribute("member");

		int userno = member.getUserno();

		Member User = memberService.selectUserNo(userno);

		log.info("마이페이지 메인의 컨트롤러: " + User.toString());
		
		model.addAttribute("User", User);

		return "member/mypage_main";
	}

	@GetMapping("/session")
	public String session() {

		// TODO 해당 구문은 메인페이지로 넘어가야함 로그인시 마이페이지 메인으로 넘어가면 안됨
		/*
		 * if(httpSession.getAttribute("OauthMember") != null) {
		 * 
		 * Object member = httpSession.getAttribute("OauthMember");
		 * httpSession.setAttribute("member", member);
		 * 
		 * }
		 */
		// 유저 네임 정보
		String id = SecurityContextHolder.getContext().getAuthentication().getName();
		Object details = SecurityContextHolder.getContext().getAuthentication().getDetails();
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

		// 유저 객체 정보 (userDetailsImpl 클래스의 필드에 정의된 변수 정보) Authentication
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

		// Todo : 2) 인증된 객체들를 홀더에 저장해둠
		SecurityContextHolder.getContext().setAuthentication(authentication);

		Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities();
		Iterator<? extends GrantedAuthority> iter = authorities.iterator();
		GrantedAuthority auth = iter.next();
		String role = auth.getAuthority();

		UserDetailsImpl userDetails = (UserDetailsImpl) authentication.getPrincipal();

		Member member = Member.builder().userno(userDetails.getUserNo()).userid(userDetails.getUserId())
				.useraddress(userDetails.getUserAddress()).useremail(userDetails.getEmail())
				.userhp(userDetails.getUserHp()).username(id).userpoint(userDetails.getUserPoin()).userrole(role)
				.grade(userDetails.getGrade()).joinat(userDetails.getJoinAt()).gender(userDetails.getGender())
				.filepath(userDetails.getFilePath())
				.build();

		log.info("userDetails가 member로 변환된데이터: " + member.toString());

		httpSession.setAttribute("member", member);

		// 세션에 저장 httpSession.setAttribute("member", authentication);

		System.out.println("멤버 투스트링 ^^&^&^&^&^&&&&&&&&&&&&&&&&&&&&&&&&&&& " + member.toString());
		System.out.println("멤버 투스트링 ^^&^&^&^&^&&&&&&&&&&&&&&&&&&&&&&&&&&& 포인트 " + member.getUserpoint());
		System.out.println("멤버 투스트링 ^^&^&^&^&^&&&&&&&&&&&&&&&&&&&&&&&&&&& 포인트 " + member.getGender());
		System.out.println("멤버 투스트링 ^^&^&^&^&^&&&&&&&&&&&&&&&&&&&&&&&&&&& 포인트 " + member.getGrade());

		System.out.println("유저테이더 출력 디테일스@@@@@@@@@@: " + details);
		System.out.println("유저테이더 출력 디테일스@@@@@@@@@@: " + details.toString());
		System.out.println("유저테이더 출력 프린시펄!!!!!: " + principal);
		System.out.println("유저테이더 출력 프린시펄!!!!!: " + principal.toString());

		System.out.println("=========================================");
		// Ipaddress 값, SessionId 값 출력
		System.out.println("디테일 : " + authentication.getDetails());
		System.out.println("디테일 : " + authentication.getDetails().toString()); //
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

		/*
		 * Object sessionmember = httpSession.getAttribute("member");
		 * 
		 * log.info("sessionmember : " + sessionmember);
		 * 
		 * 
		 */
		return "redirect:/main/index";
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

	@GetMapping("/mypage/wishlist")
	public String myPageWishlist(Model model, Criteria cri) {

		// 1. 유효성 검사
		Member member = (Member) httpSession.getAttribute("member");
//		if (member == null) {
//			throw new CustomLoginRestfulException(BizDefine.ACCOUNT_IS_NONE, HttpStatus.INTERNAL_SERVER_ERROR);
//		}
		int total = service.countByUserWishList(member.getUserno());

		// wishList 전체 개수
		log.info("위시리트스 총 개수: "+total);
		
		PageVO pageVo = new PageVO();
		pageVo.setCri(cri);
		pageVo.setTotalCount(total);
		
		log.info("위시 리트스 페이지 브이오 객체 값 확인: " + pageVo.toString());
		
		List<MemberWishListDto> wishList = prodWishListService.findByUserNo(member.getUserno());
		
		
		
		for(MemberWishListDto dto: wishList) {
			
			log.info("wishList11111111111111111111 : "  +  dto.toString());
			log.info("포문도냐?");
			
		}
		
		model.addAttribute("pageVo", pageVo);
		
		log.info("wishList : " +  wishList);
		model.addAttribute("wishList", wishList);
		return "member/mypage_wishlist";

	}

	@GetMapping("/mypage/managementParty")
	public String myPageManagementParty(Model model) {
		// 1. 유효성 검사
		Member member = (Member) httpSession.getAttribute("member");
//		if (member == null) {
//			throw new CustomLoginRestfulException(BizDefine.ACCOUNT_IS_NONE, HttpStatus.INTERNAL_SERVER_ERROR);
//		}
		
		List<Party> partyList = partyService.findbyUserNo(member.getUserno());
		List<MemberParcipationDto> parcipationList = parcipationPartyService.findUserNo(member.getUserno());
		log.info("partyList : " + partyList);
		log.info("parcipationList : " + parcipationList);
		model.addAttribute("partyList", partyList);
		model.addAttribute("parcipationList", parcipationList);
		return "member/mypage_managementParty";
	}

	// 판매자 약관
	@GetMapping("/sterms")
	public String sellerTerms() {

		return "member/terms_seller";
	}

	// 유저 약관
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

		return "redirect:/user/login";
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

		return "redirect:/user/login";
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
		System.out.println("11111111111111111111111111 " + principal);
		model.addAttribute("principal", principal);
		System.out.println("222222222222222222222222222222222222" + principal.getUsername());
		System.out.println("222222222222222222222222222222222222" + principal.getEmail());

		Member member = new Member();
		member.setUserid(principal.getUsername());

		if (member.getUserid() != null) {
			username = member.getUserid();
		}
		System.out.println("33333333333333333333333333333333333333333" + member);

		Member checkOauth = service.OauthFirstCheckProcess(principal.getName());
		System.out.println("44444444444444444444444444444444444444444 " + checkOauth);
		if (checkOauth != null) {
			System.out.println("55555555555555555555555555555555555555555555555555555");
			// TODO 여기 메인화면으로 바꿔줘야함

			int userno = checkOauth.getUserno();

			log.info("이미 존재하는 회원의 셀력트 값 userno: " + userno);

			UserDetailsImpl buildMember = UserDetailsImpl.build(checkOauth);

			log.info("5와 6사이의 소셜 로그인 최초 검증 분기 세션 값 확인: " + buildMember);

			// TODO httpSession.setAttribute("member",buildMember);

			// TODO Object sessionCheck = httpSession.getAttribute("member");

			// log.info("세션 체크 멤버가 저장 되었니?? : "+ sessionCheck);

			// 유저 데이터 셀렉트
			Member OauthJoinProcess = service.OauthFirstCheckProcess(principal.getName());

			log.info("소셜로그인 데이터 구분: " + OauthJoinProcess);

			httpSession.setAttribute("member", OauthJoinProcess);

			return "redirect:/main/index";
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
		Member OauthJoinProcess = service.OauthJoinProcess(dto);

		httpSession.setAttribute("member", OauthJoinProcess);

		// ResponseEntity.ok("Social member registered successfully!")
		return "redirect:/main/index";
	}

	@PostMapping("/userUpdate")
	public String myPageUpdateProc(UserUpdateDTO dto, Model model) {
		log.info("update dto : " + dto.toString());
		// 멤버 받기
		Member member = (Member) httpSession.getAttribute("member");
		if (member == null) {
			throw new CustomLoginRestfulException(BizDefine.ACCOUNT_IS_NONE, HttpStatus.INTERNAL_SERVER_ERROR);
		}

		log.info("업데이트 컨트롤러 디티오 확인: " + dto.toString());

		String address = dto.getZip() + dto.getAddr1() + " " + dto.getAddr2();

		dto.setUpaddress(address);

		// 유저 업데이트 서비스 호출
		memberService.updateUser(dto);

		member.setFilepath(dto.getUpfilepath());

		httpSession.setAttribute("member", member);

		return "redirect:/user/mypage/main";

	}

	@PostMapping("/changePhoto")
	@ResponseBody
	public String changePhoto(Member member) {
		int userno = member.getUserno();

		log.info("유저넘버 :" + userno);
		log.info("다정이 내이름을 불러 " + member.getProfilefilepath());

		// 파일 테이블에 파일 저장
		String filePath = fileService.saveFiles(member.getProfilefilepath());
		log.info("changePhoto 파일패스: " + filePath);

		// 해당 마이페이지 유저의 file_path값을 저장
		int filepath = memberService.changePhoto(userno, filePath);

		log.info("filepath 는 어떻게 나오고 있을 까요?" + filepath);

		Member PhotoMember = memberService.selectUserUpdatePhoto(userno);

		log.info("controller member entity check : " + PhotoMember.toString());

		String path = PhotoMember.getFilepath();
		log.info("path는 왜 default 일까요?" + path);

		log.info("모든 것을 다 거치고 돌아온 파일 패스 경로: " + path);

		Member file = (Member) httpSession.getAttribute("member");

		file.builder().filepath(path).build();

		log.info("memberController file path chk : " + file);
		httpSession.setAttribute("member", file);
		// 여기서 session을 열어서 filepath를 set해주는게 의미가 있나? 잘 모르겠음 안하면 마이페이지 다시 요청시 예정 파일 패스를
		// 요청해서 다시 이미가 돌아감

		return path;

	}

	@PostMapping("/deleteWish")
	public void deleteWish(int prodNo) {
		
		Member member = (Member) httpSession.getAttribute("member");
		
		int userno = member.getUserno();
		
		userno= 30;
		prodNo = 1;
		
		service.deleteWish(userno,prodNo);
		
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
