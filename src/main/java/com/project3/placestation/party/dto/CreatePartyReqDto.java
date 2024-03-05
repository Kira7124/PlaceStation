package com.project3.placestation.party.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class CreatePartyReqDto {
	private Integer productNo;
	private String adminHisNo;
	private String partyTitle;
	private String partyDescription;
	private Integer partyMaximumPeople;
	private MultipartFile file;	
}
