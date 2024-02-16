package com.project3.placestation.admin.dto;

import java.sql.Timestamp;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@ToString
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class AdminMemberDTO {
	
	private Integer userno;
	private String userid;
	private String userpassword;
	private String useraddress;
	private String username;
	private String userhp;
	private String useremail;
	private Integer userpoint;
	private MultipartFile customFile;
	private String originimg;
	private String uploadimg;
	private Timestamp joinat;
	private String role;
	private String grade;
	
	
	
}
