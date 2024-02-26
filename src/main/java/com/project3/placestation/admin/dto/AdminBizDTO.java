package com.project3.placestation.admin.dto;

import java.sql.Timestamp;
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
public class AdminBizDTO {

	private Integer bizno;
	private Integer bizid;
	private String bizbrandname;
	private String bizhp;
	private String bizemail;
	private Integer bizbalance;
	private String filepath;
	private Timestamp joinat;
	private Timestamp outat;
	private Integer fileno;
	private String biztel;
	private List<MultipartFile> files; // 파일 url
	
}
