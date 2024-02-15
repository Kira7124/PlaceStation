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
public class Product {
	
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
