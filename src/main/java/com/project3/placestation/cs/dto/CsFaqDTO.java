package com.project3.placestation.cs.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class CsFaqDTO {
	private Integer fBno;
	private Integer fWriter;
	private String fContent;
	private String fTitle;
	private String filePath;
	private Timestamp fRegdate;
	private Timestamp fUpdatedate;
	private Timestamp fDeleteat;
	private Integer categoryId;

}
