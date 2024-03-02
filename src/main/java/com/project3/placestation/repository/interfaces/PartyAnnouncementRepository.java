package com.project3.placestation.repository.interfaces;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project3.placestation.repository.entity.PartyAnnouncement;

@Mapper
public interface PartyAnnouncementRepository {

	public List<PartyAnnouncement> findAllJoinParty(int partyNo);
}
