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
import com.project3.placestation.member.dto.bizDTO;
import com.project3.placestation.member.dto.bizJoinDTO;
import com.project3.placestation.repository.entity.BizJoin;
import com.project3.placestation.repository.entity.Member;
import com.project3.placestation.repository.interfaces.MemberRepository;

@Service
public class MemberService {
	
	@Autowired
	private MemberRepository memberRepository;
	
	
	//회원정보리스트(페이징) 출력
	public List<Member> listAll(Criteria cri) throws Exception{
		List<Member> result = memberRepository.listAll(cri);
		return result;
	} 
	
	//회원숫자세기(페이징)
	public int countMember() throws Exception{
		return memberRepository.countMember();
	}
	
	
	//관리자회원수정
	@Transactional
	public void AdminUpdateMember(AdminMemberDTO dto) {
		Member member = Member.builder()
				.userno(dto.getUserno())
				.userid(dto.getUserid())
				.useraddress(dto.getUseraddress())
				.username(dto.getUsername())
				.userhp(dto.getUserhp())
				.useremail(dto.getUseremail())
				.grade(dto.getGrade())
				.build();
		
		Integer result = memberRepository.AdminUpdateMember(member);
	}
	
	
	// 사업자 유저 상세 조회
	public BizJoin SelectJoinBiz(int bizId) {
		BizJoin result = memberRepository.SelectJoinBiz(bizId);
		return  result;
	}
	
	// 사업자 유저 정보 변경
	public void BizUpdateMember(ReqBizAccountDto accountDto ,int userNo) {
		int result = memberRepository.BizUpdateMember(accountDto , userNo);
		if(result < 1) {
			throw new CustomRestfulException("유저 정보를 변경하는 도중 서버 에러가 발생하였습니다. ", HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
}
