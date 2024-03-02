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
public class Party {
	private Integer partyNo;
	private String partyName;
	private String partyTitle;
	private String partyDescription;
	private Integer partyHost;
	private Integer partyMaximumPeople;
	private String filePath;
	private String parcipationUserNo;
	private Integer partyManager;
	private Integer productNo;
	private String adminHisNo;
	private String partyCreatedAt;
	private String partyUpdateAt;
	private String partyDeleteAt;
	private String partyDeleteYn;
	
}
