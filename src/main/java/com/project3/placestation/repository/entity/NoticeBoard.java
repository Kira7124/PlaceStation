package com.project3.placestation.repository.entity;

import java.sql.Timestamp;

import com.project3.placestation.utils.TimeUtils;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class NoticeBoard {
		
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
	
	//포메터(시간)
	public String formatjoinAt() {
		return TimeUtils.timestampToString(nregdate);
	}
	
	
}
