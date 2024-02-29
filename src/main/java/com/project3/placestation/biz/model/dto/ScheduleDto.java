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
	private String url;
	private String adminHisNo;
	private Integer adminHisProdNo;
	private String adminHisCreatedAt;
	private Integer adminHisBuyerId;
	private String cancelYn;
	private String cancelAt;
	private Integer cancelAmount;

	public ScheduleDto(String title, int start, int end, String purchaseDate, String adminHisNo, Integer adminHisProdNo,
			String adminHisCreatedAt, Integer adminHisBuyerId, String cancelYn, String cancelAt, Integer cancelAmount) {
		this.title = title + "상품 \r\n 예약번호 : " + adminHisNo + "\r\n" + "예약 시간 : " + purchaseDate + " " + start + "시 ~ "
				+ end + "시";

		this.start = purchaseDate + "T";
		if (start < 10) {
			this.start += "0";
		}
		this.start += String.valueOf(start) + ":00:00";

		this.end = purchaseDate + "T";
		if (end < 10) {
			this.end += "0";
		}
		this.end += String.valueOf(end) + ":00:00";
		this.allDay = false;

		this.adminHisNo = adminHisNo;
		this.adminHisProdNo = adminHisProdNo;
		this.adminHisCreatedAt = adminHisCreatedAt;
		this.cancelYn = cancelYn;
		this.cancelAt = cancelAt;
		this.cancelAmount = cancelAmount;
		this.url = "http://localhost/biz/reservation-management?text=" + adminHisNo;

	}
}
