package com.project3.placestation.repository.entity;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ProductEntity {
	
    private int prodWriterNo;
    private int prodNo;
    private String prodTitle;
    private String prodWriter;
    private Timestamp prodRdate;
    private int prodStartTime;
    private int prodEndTime;
    private String prodSpaceInfo;
    private String prodGoodsInfo;
    private String prodCautionInfo;
    private int prodMaximumPeople;
    private String prodAddress;
    private String prodDetailedAddress;
    private int prodPrice;
    private String filePath;
    private int prodMajorCategoryId;
    private int prodSubcategoryId;
    private String prodFullAddress;
    private double prodLocationX;
    private double prodLocationY;
    private Timestamp prodUpdateAt;
    private Timestamp prodDeleteAt;
    private String prodDeleteYn;
    private String prodDeleteReason;
	
}
