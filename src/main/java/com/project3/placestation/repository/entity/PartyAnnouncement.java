package com.project3.placestation.repository.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
@Builder
public class PartyAnnouncement {
	private Integer partyAnnouncementNo;
	private Integer partyNo;
	private String partyAnnouncementTitle;
	private String partyAnnouncementDescription;
	private String partyAnnouncementUpdateAt;
	private String partyAnnouncementDeleteAt;
	private String partyAnnouncementDeleteYn;
	private String partyAnnouncementCreatedAt;
}
