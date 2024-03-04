package com.project3.placestation.repository.interfaces;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.project3.placestation.party.dto.ParcipationUserDto;

@Mapper
public interface ParcipationPartyRepository {

	// 방 안에 있는 사람 찾기
	public List<ParcipationUserDto> findAllById(int partyNo);
	
	// 모임 참가하기
	public int save(@Param("partyNo")int partyNo,@Param("userNo") int userNo);
	
	// 모임 불참가하기
	public int deleteParty(@Param("partyNo")int partyNo,@Param("userNo") int userNo);
}
