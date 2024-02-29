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
public class AdminPaymentDTO {

	private String userno;
	private String adminhisno;
	private Integer adminhisprodno;
	private Integer adminhisprice;
	private Integer adminhisuserpoint;
	private Integer adminhissavepoint;
	private Integer adminhisdiscount;
	private Integer adminhischarge;
	private String adminhisprodname;
	private Integer hissellerid;
	private boolean adminhisconfirm;
	private String adminhiscreatedat;
	private Integer adminhisbuyerid;
	private String bank;
	private Integer starttime;
	private Integer endtime;
	private String cancelyn;
	private String cancelat;
	private Integer cancelamount;
	private Integer peoplecount;
	private String purchasedate;
	private String token;
		
	
	
}
