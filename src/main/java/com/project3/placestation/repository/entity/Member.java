package com.project3.placestation.repository.entity;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

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

	private int userno;
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
	private int bizid;
	private String filepath;
	
	
	
	
	
}