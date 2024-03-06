package com.project3.placestation.admin.dto;

import java.sql.Timestamp;

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
public class AdminNoticeDTO {
	
	private Integer nbno;
	private String nwriter;
	private String ncontent;
	private String ntitle;
	private String filepath;
	private Timestamp nregdate;
	private Timestamp nupdatedate;
	private	Integer categoryid;
	private String ndeleteyn;
	private Timestamp ndeleteat;
	private Integer nreadcount;
	
	
}
