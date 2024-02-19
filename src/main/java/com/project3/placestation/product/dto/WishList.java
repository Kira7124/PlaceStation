package com.project3.placestation.product.dto;

import lombok.Data;

@Data
public class WishList {

	private int wNo; // 찜 목록 기본키
	private int prodNo; // 게시물 번호
	private int userNo; // 유저 번호
}
