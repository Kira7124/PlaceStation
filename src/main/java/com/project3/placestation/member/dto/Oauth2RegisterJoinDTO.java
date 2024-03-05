package com.project3.placestation.member.dto;

import lombok.Builder;
import lombok.Data;
import lombok.ToString;

@Data
@ToString
@Builder
public class Oauth2RegisterJoinDTO {

	private String suserId;
	private String suserPassword;
	private String szip;
	private String saddr1;
	private String saddr2;
	private String suserName;
	private String suserHp;
	private String semail;
	private String sgender;
	private String userOauth;
	
}
