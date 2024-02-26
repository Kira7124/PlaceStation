package com.project3.placestation.biz.model.dto;

import lombok.Data;

@Data
public class ReqBizHistoryRefundDto {
	private String reason;
	private String merchantUid;
	private String token;
	private String adminHisCreatedAt;
	private String purchaseDate;
	private Integer adminHisPrice;
}
