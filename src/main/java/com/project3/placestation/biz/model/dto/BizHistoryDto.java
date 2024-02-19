package com.project3.placestation.biz.model.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class BizHistoryDto {
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
