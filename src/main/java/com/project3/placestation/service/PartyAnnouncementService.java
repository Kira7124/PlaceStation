package com.project3.placestation.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project3.placestation.repository.entity.PartyAnnouncement;
import com.project3.placestation.repository.interfaces.PartyAnnouncementRepository;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class PartyAnnouncementService {
	
	@Autowired
	PartyAnnouncementRepository announcementRepository;
	
	public List<PartyAnnouncement> findAllJoinParty(int partyNo) {
		List<PartyAnnouncement> list = announcementRepository.findAllJoinParty(partyNo);
		return list;
	}

}
