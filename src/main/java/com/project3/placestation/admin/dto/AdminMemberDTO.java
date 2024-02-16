package com.project3.placestation.admin.dto;

import java.sql.Timestamp;

import lombok.Data;



@Data
public class AdminMemberDTO {
	
	private Integer userno;
	private String userid;
	private String userpassword;
	private String useraddress;
	private String username;
	private String userhp;
	private String userbirth;
	private String useremail;
	private Integer userpoint;
	private Timestamp joinat;
	private String role;
	private String grade;
	
	
	
}
