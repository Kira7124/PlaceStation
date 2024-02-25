package com.project3.placestation.payment.model.dto;

import lombok.Builder;
import lombok.Data;
import lombok.ToString;

///product/payment?prodNo=1&people=2&date=2024-02-23&startTime=18&endTime=20

@Data
@ToString
@Builder
public class ReqPaymentPageDto {
	private Integer prodNo;
	private Integer people;
	private String date;
	private Integer startTime;
	private Integer endTime;
	private Integer amount;
	private Integer discountAmount;
	private Integer discountPercent;
}
