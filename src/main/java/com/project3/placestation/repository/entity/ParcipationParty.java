package com.project3.placestation.repository.entity;

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
public class ParcipationParty {

	private Integer parcipationPartyNo;
	private Integer partyNo;
	private Integer partyUserNo;
	private String parcipationUpdateAt;
	private String parcipationDeleteAt;
	private String parcipationDeleteYn;
	private String parcipationJoinAt;
}
