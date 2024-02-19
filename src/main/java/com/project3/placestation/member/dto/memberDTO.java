package com.project3.placestation.member.dto;

import java.sql.Timestamp;

import lombok.Data;
import lombok.ToString;

@ToString
@Data
public class memberDTO {

	private int userNo;
	private String userId;
	private String userPassword;
	private String userAddress;
	private String userName;
	private String userHp;
	private String userEmail;
	private String grade;
	private int userPoin;
	private Timestamp joinAt;
	private Timestamp outAt;
	private String outYn;
	private String filePath;
	private String userOauth;
	
}
