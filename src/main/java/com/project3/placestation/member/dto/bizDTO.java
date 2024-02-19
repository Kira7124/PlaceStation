package com.project3.placestation.member.dto;

import java.sql.Timestamp;

import lombok.Data;
import lombok.ToString;


@ToString
@Data
public class bizDTO {

	private int bizNo;
	private int bizId;
	private String bizBrandName;
	private String bizHp;
	private String bizEmail;
	private String bizFilePath;
	private Timestamp bizJoinAt;
	private Timestamp bizOutAt;
	private String bizRole;
	private int bizFileNo;
	private String bizTel;
	
}
