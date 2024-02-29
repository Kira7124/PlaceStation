package com.project3.placestation.cs.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class QnaBoardReqDto {
	private Integer categoryId;
	private String title;
	private String content;
	private MultipartFile file;
}
