package com.project3.placestation.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project3.placestation.admin.dto.AdminMemberDTO;
import com.project3.placestation.admin.dto.Criteria;
import com.project3.placestation.biz.handler.exception.CustomRestfulException;
import com.project3.placestation.biz.model.dto.ReqBizAccountDto;
import com.project3.placestation.biz.model.dto.ResPassword;
import com.project3.placestation.member.dto.bizDTO;
import com.project3.placestation.member.dto.bizJoinDTO;
import com.project3.placestation.repository.entity.BizJoin;
import com.project3.placestation.repository.entity.Member;
import com.project3.placestation.repository.interfaces.MemberRepository;

@Service
public class MemberService {
	
	@Autowired
	private MemberRepository memberRepository;
	
	
	//관리자회원정보리스트(페이징) 출력
	public List<Member> listAll(Criteria cri) throws Exception{
		List<Member> result = memberRepository.listAll(cri);
		return result;
	} 
	
	//관리자회원숫자세기(페이징)
	public int countMember() throws Exception{
		return memberRepository.countMember();
	}
	
	
	//관리자회원검색리스트(페이징) 출력
	public List<Member> searchMemberlist(Criteria cri) throws Exception{
		List<Member> result = memberRepository.searchMemberlist(cri);
		return result;
		
	}
	
	//관리자회원검색숫자세기(페이징)
	public int countSearchMemberlist(Criteria cri) throws Exception{
		return memberRepository.countSearchMemberlist(cri);
	}
	
	
	//관리자회원수정
	@Transactional
	public void AdminUpdateMember(AdminMemberDTO dto,String filePath) {
		Member member = Member.builder()
				.userno(dto.getUserno())
				.userid(dto.getUserid())
				.useraddress(dto.getUseraddress())
				.username(dto.getUsername())
				.userhp(dto.getUserhp())
				.useremail(dto.getUseremail())
				.grade(dto.getGrade())
				.filepath(filePath)
				.build();
		
		Integer result = memberRepository.AdminUpdateMember(member);
	}
	
	
	//관리자회원삭제
	@Transactional
	public void AdminDeleteMember(AdminMemberDTO dto) {
		
		Member member = Member.builder()
				.userno(dto.getUserno())
				.userpassword(dto.getUserpassword())
				.build();
		
		
		Integer result = memberRepository.AdminDeleteMember(member);
		
	}
	

	// 사업자 유저 상세 조회
	public BizJoin SelectJoinBiz(int bizId) {
		BizJoin result = memberRepository.SelectJoinBiz(bizId);
		
		// 검사
		if(result == null) {
			throw new CustomRestfulException("유저 정보가 없거나 서버 에러가 발생하였습니다.. ", HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return  result;
	}

	
	// 사업자 유저 정보 변경
	public void BizUpdateMember(ReqBizAccountDto accountDto ,int userNo) {
		int result = memberRepository.BizUpdateMember(accountDto , userNo);
		if(result < 1) {
			throw new CustomRestfulException("유저 정보를 변경하는 도중 서버 에러가 발생하였습니다. ", HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	// 비밀번호 체크
	public ResPassword BizFindCurrentPassword(int userNo) {
		ResPassword result = memberRepository.findPasswordById(userNo);
		if(result.getPassword() == null) {
			throw new CustomRestfulException("유저 정보를 변경하는 도중 서버 에러가 발생하였습니다. ", HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return result;
	}
	
	
	
	
	//관리자 유저id중복체크
	public Integer AdminCheckID(String userid) {		
		Integer checkID = memberRepository.AdminCheckID(userid);
		return checkID;

	} 
	
	
	
}
