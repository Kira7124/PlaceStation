package com.project3.placestation.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;

import com.project3.placestation.biz.handler.exception.CustomLoginRestfulException;
import com.project3.placestation.biz.handler.exception.CustomRestfulException;
import com.project3.placestation.biz.model.util.BizDefine;
import com.project3.placestation.repository.entity.PartyAnnouncement;
import com.project3.placestation.repository.interfaces.PartyAnnouncementRepository;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class PartyAnnouncementService {
	
	@Autowired
	PartyAnnouncementRepository announcementRepository;
	
	/**
	 * 해당 모임의 전체 공지사항 조회
	 * @param partyNo
	 * @return
	 */
	public List<PartyAnnouncement> findAllJoinParty(int partyNo) {
		List<PartyAnnouncement> list = announcementRepository.findAllJoinParty(partyNo);
		return list;
	}

	/**
	 * 공지사항 상세조회
	 * @param partyAnnouncementNo
	 * @return
	 */
	public PartyAnnouncement findById(int partyAnnouncementNo) {
		return announcementRepository.findById(partyAnnouncementNo);
	}
	
	/**
	 * 공지 사항 저장
	 * @param announcement
	 */
	public void save(PartyAnnouncement announcement) {
		int result = announcementRepository.save(announcement);
		if(result == 0) {
			throw new CustomRestfulException(BizDefine.INTERVAL_SERVER_ERROR, HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	/**
	 * 공지 사항 수정
	 * @param announcement
	 */
	public void update(PartyAnnouncement announcement) {
		int result = announcementRepository.updateById(announcement);
		if(result == 0) {
			throw new CustomRestfulException(BizDefine.INTERVAL_SERVER_ERROR, HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	/**
	 * 공지 사항 삭제
	 * @param announcement
	 */
	public void delete(int partyAnnouncementNo) {
		int result = announcementRepository.deleteById(partyAnnouncementNo);
		if(result == 0) {
			throw new CustomRestfulException(BizDefine.INTERVAL_SERVER_ERROR, HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
}
