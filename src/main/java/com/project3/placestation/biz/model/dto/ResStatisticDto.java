package com.project3.placestation.biz.model.dto;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
@Builder
public class ResStatisticDto {
	
	private List<StatisticDto> annualList;
	private List<StatisticDto> monthlyList;
	private	List<StatisticDto> weekList;
	private int annualCount;
	private int monthlyCount;
	private int weekCount;
}

