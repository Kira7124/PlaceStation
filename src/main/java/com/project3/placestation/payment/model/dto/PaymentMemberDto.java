package com.project3.placestation.payment.model.dto;

import lombok.Data;

@Data
public class PaymentMemberDto {
	private Integer userNo;
	private String userAddress;
	private String userName;
	private String userHp;
	private String userEmail;
	private String userGrade;
	private Integer userPoint;
	private String joinAt;
	private String userRole;
	private String gender;
}
