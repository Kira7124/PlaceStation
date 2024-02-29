package com.project3.placestation.product.dto;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class ResProdMainFilterDto {
	private Integer prodNo;	// 게시물 번호
	private Integer prodWriterNo; // 판매자 id 값
	private String prodTitle; // 게시물 제목
	private Integer prodStartTime; // 시작 시간
	private Integer prodEndTime; // 종료 시간
	private String prodSpaceInfo; // 공간 대여 소개
	private Integer prodMaximumPeople; // 최대 인원 수
	private String prodFullAddress; // 상세 주소
	private Integer prodPrice; // 상품 가격
	private String[] filePath; // 파일 url
	private Integer prodMajorCategoryId; // 대분류 카테고리 id
	private Integer prodSubcategoryId; // 소분류 카테고리 id
	private Integer prodLocationX; // 위도 값
	private Integer prodLocationY; // 경도 값
	private String prodRdate;
    private Integer star;
    private String mainCategoryName;
}
