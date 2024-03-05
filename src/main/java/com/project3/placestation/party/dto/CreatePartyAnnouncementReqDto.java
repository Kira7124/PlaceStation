package com.project3.placestation.party.dto;

import lombok.Data;

@Data
public class CreatePartyAnnouncementReqDto {
	public Integer partyNo;
	public Integer partyAnnouncementNo;
	public String partyAnnouncementTitle;
	public String partyAnnouncementDescription;
}
