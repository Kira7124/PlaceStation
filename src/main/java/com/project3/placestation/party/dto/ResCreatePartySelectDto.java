package com.project3.placestation.party.dto;

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
public class ResCreatePartySelectDto {
	private String adminHisNo;
	private Integer adminHisProdNo;
	private Integer adminHisPrice;
	private Integer adminHisSellerId;
	private boolean adminHisConfirm;
	private Integer adminHisBuyerId;
	private Integer startTime;
	private Integer endTime;
	private String cancelYn;
	private Integer peopleCount;
	private Integer prodNo;
	private String prodTitle;
	private String prodFullAddress;
	private String[] filePath;
	private Integer prodMajorCategoryId;
	private Integer prodSubcategoryId;
	private String prodRdate;
	private String mainCategory;
	private String subcategory;
	private String purchaseDate;
}
