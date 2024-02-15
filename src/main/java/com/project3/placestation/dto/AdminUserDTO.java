package com.project3.placestation.dto;

import java.sql.Timestamp;

import lombok.Data;



@Data
public class AdminUserDTO {
	
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
	
	
	
}
