package com.project3.placestation.repository.interfaces;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project3.placestation.admin.dto.Criteria;
import com.project3.placestation.member.dto.RequestJoinDTO;
import com.project3.placestation.member.dto.memberDTO;
import com.project3.placestation.repository.entity.BizJoin;
import com.project3.placestation.repository.entity.Member;

@Mapper
public interface MemberRepository {


	//회원명단출력 (페이징처리)
	public List<Member> listAll(Criteria cri) throws Exception;

	//회원숫자세기 (페이징처리)
	public int countMember() throws Exception;

	//관리자회원정보수정
	public Integer AdminUpdateMember(Member member);

	//판매자와 유저 테이블 join데이터
	public BizJoin SelectJoinBiz(BizJoin biz);
	
	//회원 단건 정보 검색(로그인 처리)
	public memberDTO selectUser(String userId);

	//일반 회원 가입(회원 가입 처리)
	public int insertUser(Member member);
	
	//회원 단건 정보 검색(로그인 처리)
	public memberDTO selecByUserId(String username);
	
	//회원 단건 정보 검색
	public Member selectByIsUserId(String uid);

	public Member selecyByUserEmail(String email);
}
