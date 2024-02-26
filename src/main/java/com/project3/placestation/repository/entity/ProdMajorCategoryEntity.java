package com.project3.placestation.repository.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ProdMajorCategoryEntity {
	private int categoryId; // 대분류 id
	private String categoryName; // 카테고리 이름
}
