package com.project3.placestation.party.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
@Builder
public class PartyJoinReqDto {
	private Integer userNo;
	private Integer partyNo;
	private String parcipationUserNo;
	private String isJoin;
}
