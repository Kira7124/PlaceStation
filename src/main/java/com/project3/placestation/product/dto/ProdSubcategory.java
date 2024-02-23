package com.project3.placestation.product.dto;

import lombok.Data;

@Data
public class ProdSubcategory {

	private int categoryId; // 소분류 id
	private int mainCategoryId; // 대분류 id
	private String subcategoryName; // 소분류 카테고리 이름
}
