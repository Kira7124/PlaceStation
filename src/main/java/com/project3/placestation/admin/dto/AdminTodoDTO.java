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
public class AdminTodoDTO {
	
	private Integer todono; 
	private String todotitle;
	private String todocontent;
	private Timestamp todoregdate;
	
}
