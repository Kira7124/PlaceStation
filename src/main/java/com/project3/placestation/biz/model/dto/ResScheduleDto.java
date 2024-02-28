package com.project3.placestation.biz.model.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class ResScheduleDto {
	private String prodTitle;
	private Integer startTime;
	private Integer endTime;
	private String purchaseDate;
	private String adminHisNo; //
	private Integer adminHisProdNo;
	private String adminHisCreatedAt;
	private Integer adminHisBuyerId;
	private String cancelYn;
	private String cancelAt;
	private Integer cancelAmount;
}
