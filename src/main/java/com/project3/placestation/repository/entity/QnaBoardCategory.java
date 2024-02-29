package com.project3.placestation.repository.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@ToString
public class QnaBoardCategory {
	private Integer categoryId;
	private String categoryName;
	private String categoryDescription;
	private String useYn;
	private String filePath;
}
