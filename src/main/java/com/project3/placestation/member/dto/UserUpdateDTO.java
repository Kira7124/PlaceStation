package com.project3.placestation.member.dto;

import java.io.File;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@Builder
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class UserUpdateDTO {

	private int userno;
	private String upname;
	private String uppass;
	private String upemail;
	private String zip;
	private String addr1;
	private String addr2;
	
	private String upaddress;
	private String uphp;
	private String upfilepath;

	
}
