package com.project3.placestation.member.dto;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;


/*
 * 회원가입시 form 데이터를 받기 위한 dto   
 */

@ToString
@Data
@NoArgsConstructor
@AllArgsConstructor
public class RequestJoinDTO {
	
	private int userNo;
	private String userId;
	private String userPassword;
	// address를 받기 위한 변수
	private String zip;
	private String addr1;
	private String addr2;
	// address를 받아서 합친 변수
	private String userAddress;
	private String userName;
	private String userHp;
	
	// email
	private String email;
	
	
	private String grade;
	private int userPoin;
	private Timestamp joinAt;
	private Timestamp outAt;
	private String outYn;
	private List<MultipartFile> filePath;
	private String userOauth;
	private String role;
	private String gender;
	
	// 포트원 변수
	private String impuid;
	private String impkey;
	private String impsecret;
	

	
}
