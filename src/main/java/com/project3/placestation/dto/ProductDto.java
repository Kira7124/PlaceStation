package com.project3.placestation.dto;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class ProductDto {

	private int cateNo;
	private int prodCate1;
	private int prodCate2;
	private int prodNo;
	private String prodTitle;
	private String prodContent;
	private String prodWriter;
	private Timestamp prodRdate;
	private int prodHit;
	private int prodRating;
	private int prodReview;
	private int prodWishlist;
	private int prodComplain;
	private String prodAddress;
	private int prodPrice;
	private String regip;
	private String file1;
	private String file2;
	private String file3;
	
}
