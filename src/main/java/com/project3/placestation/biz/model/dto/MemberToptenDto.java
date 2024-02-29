package com.project3.placestation.biz.model.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class MemberToptenDto {
	private Integer adminHisBuyerId;
	private Integer count;
	private	String userName;
	private String filePath;
	private String grade;
	private String gender;
}
