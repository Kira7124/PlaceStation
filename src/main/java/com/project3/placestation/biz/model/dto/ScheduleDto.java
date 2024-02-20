package com.project3.placestation.biz.model.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Data
@Slf4j
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ScheduleDto {
	
	private String title;
	private String start;
	private String end;
	private boolean allDay;
	
	
	public ScheduleDto(String title , int start , int end , String purchaseDate) {
		this.title = title;
		this.start = purchaseDate + "T";
		if(start < 10) {
			this.start += "0";
		}
		this.start += String.valueOf(start) + ":00:00";
		
		this.end = purchaseDate + "T";
		if(end < 10) {
			this.end += "0";
		}
		this.end += String.valueOf(end) + ":00:00";	
		this.allDay = false;
	}
}
