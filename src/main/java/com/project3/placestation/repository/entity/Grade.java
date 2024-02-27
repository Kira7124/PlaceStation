package com.project3.placestation.repository.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;


@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@ToString
public class Grade {
	private String gradeName;
	private Integer gradeDiscount;
	private Integer gradeMaxprice;
	private Integer gradeSavepoint;
}
