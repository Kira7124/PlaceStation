package com.project3.placestation.biz.model.dto;

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
public class ReqBizAccountDto {
	private String userName;
	private String userId;
	private String userHp;
	private String userPassword;
	private String bizTel;
	private String userAddress;
	private String impUid;
	private String impKey;
	private String impSecret;
	private MultipartFile profile;
	private String changeImage;
	private String bizBrandName;
	private MultipartFile bizFile;
	private String changeBizFile;
	private String filePath;
	private String changePassword;
}
