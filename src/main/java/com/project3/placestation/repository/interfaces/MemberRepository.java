package com.project3.placestation.repository.interfaces;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.project3.placestation.admin.dto.Criteria;
import com.project3.placestation.biz.model.dto.ReqBizAccountDto;
import com.project3.placestation.member.dto.bizJoinDTO;
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
	public BizJoin SelectJoinBiz(int bizId); 	
	
	// 사업자 유저 정보 변경
	public int BizUpdateMember(@Param("accountDto")ReqBizAccountDto accountDto ,@Param("userNo") int userNo);
	
}
