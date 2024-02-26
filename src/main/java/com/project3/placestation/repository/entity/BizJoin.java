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
@Builder
@ToString
public class BizJoin {
	private Integer bizNo;
	private Integer bizId;
	private String bizBrandName;
	private String impUid;
	private String impKey;
	private String impSecret;
	private String userPassword;
	private String userAddress;
	private String userName;
	private Integer userPoint;
	private Timestamp joinAt;
	private String role;
	private String userGrade;
	private String userHp;
	private String userEmail;
	private String filePath;
	private String bizTel;
}
