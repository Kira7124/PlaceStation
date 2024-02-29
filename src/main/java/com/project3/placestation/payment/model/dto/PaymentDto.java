package com.project3.placestation.payment.model.dto;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class PaymentDto {
	private String merchantUid;
	private Integer prodNo;
	private Integer amount;	// 원래 가격
	private Integer afterAmount; // 나중에 된 가격
	private Integer usePoint;
	private Integer discount;
	private String prodName;
	private Integer sellerId;
	private Integer buyerId;
	private Integer startTime;
	private Integer endTime;
	private Integer peopleCount;
	private String purchaseDate;
	private Integer currentUserPoint;
}