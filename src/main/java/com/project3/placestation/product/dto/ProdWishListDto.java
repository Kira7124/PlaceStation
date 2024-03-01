package com.project3.placestation.product.dto;

import lombok.Data;

@Data
public class ProdWishListDto {

	private Integer wNo; // 찜 목록 기본키
	private Integer prodNo; // 게시물 번호
	private Integer userNo; // 유저 번호
}
