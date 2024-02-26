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
	private Integer fwriterid;
	private String fwritercontent;
	private String ftitle;
	private String filepath;
	private Timestamp fregdate;
	private Timestamp fupdateat;
	private Timestamp fdeleteat;
	private Integer categoryid;
	private Integer fanswerid;
	private String fanswercontent;

}
