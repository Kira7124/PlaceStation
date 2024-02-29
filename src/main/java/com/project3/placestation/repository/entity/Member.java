package com.project3.placestation.repository.entity;

import java.sql.Timestamp;
import java.text.DecimalFormat;
import java.text.Format;

import com.project3.placestation.utils.TimeUtils;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
@Builder
public class Member {

	private Integer userno;
	private String userid;
	private String userpassword;
	private String useraddress;
	private String username;
	private String userhp;
	private String useremail;
	private Integer userpoint;
	private Timestamp joinat;
	private String userrole;
	private String grade;
	private String gender;
	private String token;
	private String oauth;
	
	// 판매자 회원가입
	private String bizid;
	private String filepath;
	
	
	
	
	
}