package com.project3.placestation.admin.dto;



import java.util.List;

import org.springframework.web.multipart.MultipartFile;

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
public class AdminBannerDTO {
	
	private Integer banno; 
	private String banname;
	private String filepath;
	private List<MultipartFile> files; // 파일 url
	
	
}
