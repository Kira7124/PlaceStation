package com.project3.placestation.cs.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@ToString
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class CsNoticeBoardCategoryDTO {
	
	private Integer categoryId; // 카테고리 기본키
	private String categoryName; // 카테고리명 (일반 , 사업자)
	private String useYn; // 사용 여부(DEFAULT: Y)

}
