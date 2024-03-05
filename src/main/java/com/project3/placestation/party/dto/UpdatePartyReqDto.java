package com.project3.placestation.party.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class UpdatePartyReqDto {
	private Integer partyNo;
	private String partyTitle;
	private String partyDescription;
	private Integer partyMaximumPeople;
	private MultipartFile file;
	private String isFileChange;
}
