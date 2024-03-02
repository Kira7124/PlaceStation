package com.project3.placestation.repository.interfaces;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project3.placestation.party.dto.PartyDto;
import com.project3.placestation.repository.entity.Party;

@Mapper
public interface PartyRepository {
	public List<Party> findAll();
	
	public PartyDto findById(int partyNo);
	
	public int updateParcipationUserNoById(Party party);
	
}
