package com.project3.placestation.member.dto;

public class MemberWishListDto {
	private Integer prodNo;	// 게시물 번호
	private Integer prodWriterNo; // 판매자 id 값
	private String prodTitle; // 게시물 제목
	private Integer prodStartTime; // 시작 시간
	private Integer prodEndTime; // 종료 시간
	private String prodSpaceInfo; // 공간 대여 소개
	private String prodGoodsInfo; // 물품 대여 소개
	private String prodCautionInfo; // 예약시 주의사항
	private Integer prodMaximumPeople; // 최대 인원 수
	private String prodAddress; // 상품 주소
	private String prodDetailedAddress; // 상세 주소
	private Integer prodPrice; // 상품 가격
	private String filePath; // 파일 url
	private Integer prodMajorCategoryId; // 대분류 카테고리 id
	private Integer prodSubcategoryId; // 소분류 카테고리 id
	private String prodFullAddress; // 위치 풀 네임
	private Double prodLocationX; // 위도 값
	private Double prodLocationY; // 경도 값
	private String prodRdate; // 게시물 작성일
	private String prodUpdateAt;	// 업데이트 날짜
	private String prodDeleteYn;	// 삭제 Y , N
	private String prodDeleteAt;	// 삭제일
	private String prodDeleteReason; // 삭제 이유
	private String additionExplanation; // 부가 설명
	private String additionExplanationName;
	private String additionExplanationFilePath;
}
