package com.project3.placestation.repository.interfaces;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project3.placestation.repository.entity.PartyAnnouncement;

@Mapper
public interface PartyAnnouncementRepository {

	/**
	 * 해당 모임의 공지사항 전체 조회
	 * @param partyNo
	 * @return
	 */
	public List<PartyAnnouncement> findAllJoinParty(int partyNo);
	
	/**
	 * 공지 사항 상세조회
	 * @param partyAnnouncementNo
	 * @return
	 */
	public PartyAnnouncement findById(int partyAnnouncementNo);
	
	/**
	 * 공지사항 저장
	 * @param announcement
	 * @return
	 */
	public int save(PartyAnnouncement announcement);
	
	/**
	 * 공지사항 수정
	 * @param announcement
	 * @return
	 */
	public int updateById(PartyAnnouncement announcement);
	
	public int deleteById(int partyAnnouncementNo);
}
