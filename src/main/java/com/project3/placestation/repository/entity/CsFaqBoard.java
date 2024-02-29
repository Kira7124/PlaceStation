package com.project3.placestation.repository.entity;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class CsFaqBoard {
	private Integer fbno;
	private String fwriter;
	private String fcontent;
	private String ftitle;
	private String filepath;
	private Timestamp fregdate;
	private Timestamp fupdatedate;
	private Timestamp fdeleteat;
	private Integer categoryid;

}
