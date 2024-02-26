package com.project3.placestation.biz.model.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class ReqProdSubcategoryDto {
	private Integer categoryId;
	private Integer mainCategoryId;
	private String subcategoryName;
}
