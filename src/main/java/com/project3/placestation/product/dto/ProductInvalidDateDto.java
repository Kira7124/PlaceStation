package com.project3.placestation.product.dto;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ProductInvalidDateDto {
	private Integer startTime;	// 시작 시간
	private Integer endTime;	// 종료 시간
	private String purchaseDate; // 구매된 날짜
	
	

}
