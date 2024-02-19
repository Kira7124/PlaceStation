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
	private String adminHisNo;
	private Integer adminHisProdNo;
	private Integer adminHisPrice;
	private Integer adminHisUserPoint;
	private Integer adminHisSavePoint;
	private Integer adminHisDiscount;
	private Integer adminHisCharge;
	private Integer hisSellerId;
	private boolean adminHisConfirm;
	private String adminHisCreatedAt;
	private Integer adminHisBuyerId;
	private String bank;
	private Integer startTime;
	private Integer endTime;
	private String cancelYn;
	private String cancelAt;
	private Integer cancelAmount;
	private Integer peopleCount;
}
