package com.project3.placestation.party.dto;

import lombok.Data;

@Data
public class ParcipationUserDto {
	private Integer parcipationPartyNo;
	private Integer partyNo;
	private Integer partyUserNo;
	private String parcipationUpdateAt;
	private String parcipationDeleteAt;
	private String parcipationDeleteYn;
	private String parcipationJoinAt;
	private String userName;
	private String userHp;
	private String userEmail;
	private String grade;
	private Integer userPoint;
	private String gender;
	private String filePath;
}
