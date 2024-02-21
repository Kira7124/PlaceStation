package com.project3.placestation.member.dto;

import java.sql.Timestamp;

import lombok.Builder;
import lombok.Data;
import lombok.ToString;

@ToString
@Builder
@Data
public class bizJoinDTO {

	private int bizNo;
	private int bizId;
	private String bizpassword;
	private String bizaddress;
	private String bizname;
	private int bizpoint;
	private String originimg;
	private String uploadimg;
	private Timestamp joinat;
	private String role;
	private String grade;
	private String bizBrandName;
	private String bizHp;
	private String bizEmail;
	private String bizFilePath;
	private String bizRole;
	private String bizTel;


}
