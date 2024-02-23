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
}
