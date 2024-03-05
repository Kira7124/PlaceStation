package com.project3.placestation.repository.interfaces;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.project3.placestation.party.dto.PartyDto;
import com.project3.placestation.repository.entity.Party;

@Mapper
public interface PartyRepository {
	
	// 전체 조회
	public List<Party> findAll();
	
	// 상세 조회
	public PartyDto findById(int partyNo);
	
	// 모임이 이미 있는지 확인
	public boolean existByUserNoAndProdNoAndAdminHisNo(@Param("userNo") int userNo ,@Param("prodNo") int prodNo ,@Param("adminHisNo") String adminHisNo);
	
	// 모임 저장
	public int save(Party party);
	
	// 모임 수정
	public int update(@Param("party")Party party ,@Param("isFileChange") String isFileChange);
	
	// 모임 삭제
	public int delete(int partyNo);
}
