package com.project3.placestation.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project3.placestation.admin.dto.AdminMemberDTO;
import com.project3.placestation.admin.dto.Criteria;
import com.project3.placestation.member.dto.RequestJoinDTO;
import com.project3.placestation.member.dto.bizJoinDTO;
import com.project3.placestation.repository.entity.BizJoin;
import com.project3.placestation.repository.entity.Member;
import com.project3.placestation.repository.interfaces.MemberRepository;

@Service
public class MemberService {

	@Autowired
	private MemberRepository memberRepository;

	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	

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


	public BizJoin SelectJoinBiz(bizJoinDTO bizId) {

		BizJoin biz = BizJoin.builder()
				.biz_id(bizId.getBizId())
				.build();

		BizJoin result = memberRepository.SelectJoinBiz(biz);


		return  result;
	}

	public void joinProcess(RequestJoinDTO dto) {
		
		Member member = Member.builder()
				.userid(dto.getUserId())
				.username(dto.getUserName())
				.userpassword(bCryptPasswordEncoder.encode(dto.getUserPassword()))
				.useremail(dto.getUserEmail())
				.useraddress(dto.getUserAddress())
				.userhp(dto.getUserHp())
				.gender(dto.getGender())
				.userrole("ROLE_USER")
				.build();
				
		
		
	/*	member.setUserid(dto.getUserId());
		member.setUsername(dto.getUserName());
		member.setUserpassword(bCryptPasswordEncoder.encode(dto.getUserPassword()));
		member.setUseremail(dto.getUserEmail());
		member.setUseraddress(dto.getUserAddress());
		member.setUserhp(dto.getUserHp());
		member.setGender(dto.getGender());
		member.setRole("ROLE_USER");
		member.setUseraddress(dto.getUserAddress());
		*/
				
				
		System.out.println("회원 가입 form데이터 바인딩 테스트: "+ dto.toString());
		System.out.println("회원 가입 form데이터 바인딩 테스트1: "+ dto.getUserId());
		System.out.println("회원 가입 form데이터 바인딩 테스트2: "+ dto.getUserName());
		System.out.println("회원 가입 form데이터 바인딩 테스트3: "+ dto.getUserPassword());
		System.out.println("회원 가입 form데이터 바인딩 테스트4: "+ dto.getUserEmail());
		System.out.println("회원 가입 form데이터 바인딩 테스트5: "+ dto.getUserAddress());
		System.out.println("회원 가입 form데이터 바인딩 테스트6: "+ dto.getGender());
		System.out.println("회원 가입 form데이터 바인딩 테스트7: "+ dto.getUserHp());
		System.out.println("=====================================================");
		System.out.println("회원 가입 entity tostring: "+ member.toString());
		
		
		memberRepository.insertUser(member);
		
	}


}
