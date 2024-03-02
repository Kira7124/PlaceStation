package com.project3.placestation.repository.entity;

import java.sql.Timestamp;

import com.project3.placestation.utils.TimeUtils;

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
public class QnaBoard {
	
	private Integer qbno;
	private Integer qwriter;
	private String qcontent;
	private String qtitle;
	private String filepath;
	private Timestamp qregdate;
	private Timestamp qupdatedate;
	private Integer categoryid;
	private String qdeleteyn;
	private Timestamp qdeleteat;
	private String qstatus;
	private String qreply;
	private String userid;

	
	//포메터(시간)
	public String formatjoinAt() {
		return TimeUtils.timestampToString(qregdate);
	}
	
	
}
