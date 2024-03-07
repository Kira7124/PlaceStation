package com.project3.placestation.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project3.placestation.admin.dto.AdminMemberDTO;
import com.project3.placestation.admin.dto.Criteria;
import com.project3.placestation.biz.handler.exception.CustomRestfulException;
import com.project3.placestation.biz.model.dto.ReqBizAccountDto;
import com.project3.placestation.biz.model.dto.ResPassword;
import com.project3.placestation.biz.model.util.PageReq;
import com.project3.placestation.biz.model.util.PageRes;
import com.project3.placestation.config.jwt.UserDetailsImpl;
import com.project3.placestation.member.dto.MemberHistoryDto;
import com.project3.placestation.member.dto.RequestJoinDTO;
import com.project3.placestation.member.dto.UserUpdateDTO;
import com.project3.placestation.payment.model.common.MemberGrade;
import com.project3.placestation.payment.model.dto.PaymentMemberDto;
import com.project3.placestation.repository.entity.BizJoin;
import com.project3.placestation.repository.entity.Member;
import com.project3.placestation.repository.interfaces.AdminProdHistoryRepository;
import com.project3.placestation.repository.interfaces.MemberRepository;
import com.project3.placestation.repository.interfaces.ProdWishListRepository;

import jakarta.mail.MessagingException;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class MemberService {

	@Autowired
	private MemberRepository memberRepository;

	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;

	@Autowired
	private JavaMailSender mailSender;

	@Autowired
	AdminProdHistoryRepository adminProdHistoryRepository;
	
	@Autowired
	private ProdWishListRepository wishListRepository;
	

	// 관리자회원정보리스트(페이징) 출력
	public List<Member> listAll(Criteria cri) throws Exception {
		List<Member> result = memberRepository.listAll(cri);
		return result;
	}

	// 관리자회원숫자세기(페이징)
	public int countMember() throws Exception {
		return memberRepository.countMember();
	}

	// 관리자회원검색리스트(페이징) 출력
	public List<Member> searchMemberlist(Criteria cri) throws Exception {
		List<Member> result = memberRepository.searchMemberlist(cri);
		return result;

	}

	// 관리자회원검색숫자세기(페이징)
	public int countSearchMemberlist(Criteria cri) throws Exception {
		return memberRepository.countSearchMemberlist(cri);
	}

	// 관리자회원수정
	@Transactional
	public void AdminUpdateMember(AdminMemberDTO dto, String filePath) {
		Member member = Member.builder().userno(dto.getUserno()).userid(dto.getUserid())
				.useraddress(dto.getUseraddress()).username(dto.getUsername()).userhp(dto.getUserhp())
				.useremail(dto.getUseremail()).grade(dto.getGrade()).filepath(filePath).build();

		Integer result = memberRepository.AdminUpdateMember(member);
	}

	// 관리자사진수정
	@Transactional
	public void AdminPhotoUpdate(AdminMemberDTO dto, String filePath) {

		Member member = Member.builder().userno(dto.getUserno()).filepath(filePath).build();

		Integer result = memberRepository.AdminPhotoUpdate(member);
	}

	// 관리자회원삭제
	@Transactional
	public void AdminDeleteMember(AdminMemberDTO dto) {

		Member member = Member.builder().userno(dto.getUserno()).userpassword(dto.getUserpassword()).build();

		Integer result = memberRepository.AdminDeleteMember(member);

	}

	// 사업자 유저 상세 조회
	public BizJoin SelectJoinBiz(int bizId) {
		BizJoin result = memberRepository.SelectJoinBiz(bizId);

		// 검사
		if (result == null) {
			throw new CustomRestfulException("유저 정보가 없거나 서버 에러가 발생하였습니다.. ", HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return result;
	}

	// 사업자 유저 정보 변경
	public int BizUpdateMember(ReqBizAccountDto accountDto, int userNo) {
		int result = memberRepository.BizUpdateMember(accountDto, userNo);
		if (result < 1) {
			throw new CustomRestfulException("유저 정보를 변경하는 도중 서버 에러가 발생하였습니다. ", HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return result;
	}

	// 비밀번호 체크
	public ResPassword BizFindCurrentPassword(int userNo) {
		ResPassword result = memberRepository.findPasswordById(userNo);
		if (result.getPassword() == null) {
			throw new CustomRestfulException("유저 정보를 변경하는 도중 서버 에러가 발생하였습니다. ", HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return result;
	}

	// 관리자 유저id중복체크
	public Integer AdminCheckID(String userid) {
		Integer checkID = memberRepository.AdminCheckID(userid);
		return checkID;

	}

	/**
	 * 유저 정보 상세조회 Exception 로그인 창으로 가게끔 수정 필요
	 * 
	 * @param userNo
	 * @return
	 */
	public PaymentMemberDto findMemberById(int userNo) {
		PaymentMemberDto dto = memberRepository.findMemberById(userNo);
		if (dto == null) {
			throw new CustomRestfulException("유저 정보가 없거나 변경되었습니다.", HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return dto;
	}

	// 포인트 변경 (수정 필요)
	@Transactional
	public int updateUserPoint(int userPoint, MemberGrade grade, int buyerId) {
		log.info("userPoint : " + userPoint);
		log.info("grade : " + grade);
		int result = memberRepository.updateMemberPoint(userPoint, grade.toString(), buyerId);
		if (result == 0) {
			return 0;
		}
		return result;
	}

	/**
	 * 포인트 계산 ( + )
	 * 
	 * @param currentUserPoint
	 * @param sumPoint
	 * @return
	 */
	public int calUserPoint(int currentUserPoint, int sumPoint) {
		return currentUserPoint + sumPoint;
	}

	// 일반 유저 회원가입 처리
	public void uJoinProcess(RequestJoinDTO dto) {

		Member member = Member.builder().userid(dto.getUserId()).username(dto.getUserName())
				.userpassword(bCryptPasswordEncoder.encode(dto.getUserPassword())).useremail(dto.getEmail())
				.useraddress(dto.getUserAddress()).userhp(dto.getUserHp()).gender(dto.getGender()).userrole("ROLE_USER")
				.build();

		memberRepository.insertUser(member);

	}

	// 소셜 유저 회원가입 처리
	@Transactional
	public Member OauthJoinProcess(RequestJoinDTO dto) {

		Member member = Member.builder().userid(dto.getUserId()).username(dto.getUserName())
				.userpassword(bCryptPasswordEncoder.encode(dto.getUserPassword())).useremail(dto.getEmail())
				.useraddress(dto.getUserAddress()).userhp(dto.getUserHp()).gender(dto.getGender()).userrole("ROLE_USER")
				.oauth(dto.getUserOauth()).build();

		System.out.println("오스 서비스=======: " + member);

		int insertMember = memberRepository.insertOauthUser(member);

		Member memberReturn;
		// 유저 아이디로 셀렉트 해서 값 들고와서 userimple로 변환
		if (insertMember == 1) {
			String uid = member.getUserid();

			memberReturn = memberRepository.selectByIsUserId(uid);


			return memberReturn;

		} else {

			return null;
		}
	}

	// 소셜 유저 회원가입 최초 여부
	public Member OauthFirstCheckProcess(String username) {

		Member userCheck = memberRepository.selectByValidUserNameOauth(username);

		log.info("소셜 최초 가입 유저서비스 리턴값 확인: "+userCheck);
		
		return userCheck;

	}

	// 판매자 유저 회원가입 처리
	@Transactional
	public void sJoinProcess(RequestJoinDTO dto, String filepath) {

		Member member = Member.builder().userid(dto.getUserId()).username(dto.getUserName())
				.userpassword(bCryptPasswordEncoder.encode(dto.getUserPassword())).useremail(dto.getEmail())
				.useraddress(dto.getUserAddress()).userhp(dto.getUserHp()).gender(dto.getGender()).userrole("ROLE_BIZ")
				.filepath(filepath).impkey(dto.getImpkey()).impuid(dto.getImpuid()).impsecret(dto.getImpsecret())
				.build();

		// TODO member.xml의 insertBizUser에 filepath컬럼 주가되면 쿼리문 수정(filepath추가)

		// bizUser insert
		memberRepository.insertUser(member);

		// member.setBizid(userNo.getUserno());
		Member userNo = memberRepository.selectByUserId(member);

		// userno값 호출
		member.setUserno(userNo.getUserno());

		// biz insert
		memberRepository.insertBiz(member);

	}

	// email 샌더
	public void sendEmail(String to, String subject, String text) throws MessagingException {

		System.out.println("send Email");
		SimpleMailMessage message = new SimpleMailMessage();

		message.setSubject(subject);
		message.setText(text);
		message.setTo(to);

		mailSender.send(message);
		System.out.println("send Email$$$$$$$$$$$$$$$$$$$$$");
		/*
		 * MimeMessage message = mailSender.createMimeMessage(); MimeMessageHelper
		 * helper = new MimeMessageHelper(message, true, "UTF-8");
		 * 
		 * helper.setTo(to); // 보낼 대상의 이메일 입력 helper.setSubject(subject); // 제목
		 * helper.setText(text, true); // 내용
		 * 
		 * mailSender.send(message);
		 */

	}

	// (회원가입)아이디 중복검사
	public int validUid(String uid) {

		return memberRepository.selectByValidUserId(uid);
	}

	// (회원가입)전화번호 중복검사
	public int validHp(String hp) {

		return memberRepository.selectByValidHp(hp);
	}

	// (회원가입)사업자 전화번호 중복검사
	public int validManagerHp(String managerHp) {

		return memberRepository.selectByValidManageHp(managerHp);
	}

	// (회원가입)이메일 중복체크
	public int validEmail(String email) {

		int isEmail = memberRepository.selectByValidEmail(email);

		return isEmail;
	}

	public int confirmCodeByMail(String code) {

		if (code.equals(code)) {
			// 이메일 코드 일치시
			return 1;
		} else {
			return 0;
		}

	}

	// 사진변경
	public int changePhoto(int userno, String filePath) {

		log.info("체인지포토 서비스 :" + filePath);
		log.info("체인지 포토 서비스 넘버:" + userno);

		memberRepository.changePhoto(userno, filePath);

		return 1;
	}

	public Member selectUserUpdatePhoto(int userno) {

		Member member = memberRepository.selectUserUpdatePhoto(userno);

		return member;

	}

	public Member selectUserNo(int userno) {

		
		
		return memberRepository.selectUserNo(userno);
	}

	@Transactional
	public void updateUser(UserUpdateDTO dto) {

		
		Member updateMember = Member.builder()
				.userno(dto.getUserno())
				.username(dto.getUpname())
				.userpassword(bCryptPasswordEncoder.encode(dto.getUppass()))
				.useremail(dto.getUpemail())
				.useraddress(dto.getUpaddress())
				.userhp(dto.getUphp())
				.filepath(dto.getUpfilepath())
				.build();
		
		int returnMember = memberRepository.userUpdateMember(updateMember);
		
		if(returnMember == 0) {
			throw new CustomRestfulException("서버에러", HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		
		
	}

	
	public int countByUserWishList(int userno) {
		
		
		
		
		return wishListRepository.countByUserWishList(userno);
	}
	
	
	// ------------ StarsinLiver --------------
	// 유저 거래녀역 찾기
	public PageRes<MemberHistoryDto> memberFineAllByUserNo(int userNo, PageReq pageReq) {
		List<MemberHistoryDto> list = adminProdHistoryRepository.memberFindAllByUserNo(userNo, pageReq);
		int count = adminProdHistoryRepository.countMemberFindAllByUserNo(userNo);

		PageRes<MemberHistoryDto> pageRes = new PageRes<>(list, pageReq.getPage(), count, pageReq.getSize());
		return pageRes;
	}

}
