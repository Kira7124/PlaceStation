package com.project3.placestation.biz.model.dto;

import lombok.Data;

@Data
public class ReqBizHistoryRefundDto {
	private String reason;
	private String merchantUid;
	private String token;
	private String adminHisCreatedAt;
	private Integer adminHisSellerId;
	private String purchaseDate;
	private Integer adminHisPrice;
	private Integer adminHisCharge;
	private Integer adminHisSavePoint;
	private Integer adminHisUsePoint;
	private Integer adminHisDiscount;
}
