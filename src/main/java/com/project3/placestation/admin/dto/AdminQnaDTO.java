package com.project3.placestation.admin.dto;

import java.sql.Timestamp;

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
public class AdminQnaDTO {

	private Integer qbno;
	private Integer qwriter;
	private String qtitle;
	private String qcontent;
	private String filepath;
	private Timestamp qregdate;
	private Timestamp qupdatedate;
	private Integer categoryid;
	private String qdeleteyn;
	private Timestamp qdeleteat;
	private String qstatus;
	private String qreply;
	
	
	
}
