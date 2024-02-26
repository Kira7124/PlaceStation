package com.project3.placestation.member.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@ToString
public class MemberLoginDto {
	private String token;
	private Integer userNo;
	private String userId;
	private String userGrade;
	private String userName;
}
