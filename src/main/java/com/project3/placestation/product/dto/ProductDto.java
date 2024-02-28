package com.project3.placestation.product.dto;

import java.sql.Timestamp;

import com.project3.placestation.biz.model.dto.ResProductDto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@ToString
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ProductDto {
    private int prodWriterNo; // 판매자 id 값
    private int prodNo; // 상품 번호
    private String prodTitle; // 상품 제목
    private String prodWriter; // 상품 작성자
    private Timestamp prodRdate; // 상품 작성일
    private int prodStartTime; // 상품 시작 시간?
    private int prodEndTime; // 상품 종료 시간?
    private String prodSpaceInfo; // 공간대여 소개 글
    private String prodGoodsInfo; // 물품대여 소개 글
    private String prodCautionInfo; // 예약시 주의사항
    private int prodPrice; // 상품 가격
    private int prodMaximumPeople; // 최대 인원 수
    private String prodAddress; // 상품 주소
    private String prodDetailedAddress; // 상품 상세 주소
    private String prodFullAddress; // 상품 전체 주소
    private String filePath; // 파일 경로
    private int prodMajorCategoryId; // 대분류
    private int prodSubcategoryId; // 소분류
    private double prodLocationX; // 위도 값
    private double prodLocationY; // 경도 값
    private Timestamp prodUpdateAt; // 상품 업데이트 시간
    private Timestamp prodDeleteAt; // 상품 삭제 시간
    private String prodDeleteYn; // 상품 삭제 'Y','N'
    private String prodDeleteReason; // 상품 삭제 이유
}