package com.project3.placestation.repository.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@ToString
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Getter
public class ProdWishList {
	private Integer wNo; // 찜 목록 기본키
	private Integer prodNo; // 게시물 번호
	private Integer userNo; // 유저 번호
}
