package com.project3.placestation.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project3.placestation.admin.dto.AdminMemberDTO;
import com.project3.placestation.admin.dto.Criteria;
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
	
	
	//관리자회원삭제
	@Transactional
	public void AdminDeleteMember(AdminMemberDTO dto) {
		
		Member member = Member.builder()
				.userno(dto.getUserno())
				.userpassword(dto.getUserpassword())
				.build();
		
		
		Integer result = memberRepository.AdminDeleteMember(member);
		
	}
	
	
	
	
	
	
	
}
