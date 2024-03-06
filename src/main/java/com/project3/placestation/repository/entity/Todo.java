package com.project3.placestation.repository.entity;

import java.sql.Timestamp;

import com.project3.placestation.admin.dto.AdminTodoDTO;
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
public class Todo {
	
	private Integer todono; 
	private String todotitle;
	private String todocontent;
	private Timestamp todoregdate;
	
	
	//포메터(시간)
	public String formatjoinAt() {
		return TimeUtils.timestampToString(todoregdate);
	}
	
	
	
	
	
	
}

