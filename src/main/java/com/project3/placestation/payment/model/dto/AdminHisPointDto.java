package com.project3.placestation.payment.model.dto;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class AdminHisPointDto {
	private Integer adminHisBuyerId;
	private Integer userSavePoint; // 총 적립했던 포인트
}
