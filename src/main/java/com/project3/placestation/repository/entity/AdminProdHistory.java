package com.project3.placestation.repository.entity;

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
public class AdminProdHistory {
	private String adminHisNo; // 포트원 merchant_uid
	private String token;	// 포트원 token
	private Integer adminHisProdNo;
	private String adminHisProdName;
	private Integer adminHisPrice;
	private Integer adminHisUsePoint;
	private Integer adminHisSavePoint;
	private Integer adminHisDiscount;
	private Integer adminHisCharge;
	private Integer adminHisSellerId;
	private boolean adminHisConfirm;
	private String adminHisCreatedAt;
	private Integer adminHisBuyerId;
	private String bank;
	private Integer startTime;
	private Integer endTime;
	private String cancelYn;
	private String cancelAt;
	private Integer cancelAmount;
	private String cancelReason;
	private Integer peopleCount;
	private String purchaseDate;
}
