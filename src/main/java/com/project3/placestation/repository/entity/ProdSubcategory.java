package com.project3.placestation.repository.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ProdSubcategory {
	private Integer categoryId;
	private Integer mainCategoryId;
	private String subcategoryName;
}
