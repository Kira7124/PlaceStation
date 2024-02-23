package com.project3.placestation.repository.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Biz {
	private Integer bizNo;
	private Integer bizId;
	private String bizBrandName;
	private Integer bizBalance;
	private String filePath;
	private String bizTel;
}
