package com.project3.placestation.product.dto;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class ProdFilterDto {
	private Integer prodNo;
	private Integer prodWriterNo;
	private String prodTitle;
	private Integer prodStartTime;
	private Integer prodEndTime;
	private String prodSpaceInfo;
	private Integer prodMaximumPeople;
	private String prodFullAddress;
	private Integer prodPrice;
	private String filePath;
	private Integer prodMajorCategoryId;
	private Integer prodSubcategoryId;
	private Integer prodLocationX;
	private Integer prodLocationY;
	private String prodRdate;
	private Integer star;	
    private String mainCategoryName;
}
