package com.project3.placestation.product.dto;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class ProdReviewDto {
    private int prodRevNo; // 리뷰번호
    private int prodNo; // 게시물 번호
    private String prodRevTitle; // 리뷰 제목
    private String prodRevContent; // 리뷰 내용
    private int prodRevStar; // 리뷰 평점
    private Timestamp prodRevCreateAt; // 리뷰 작성 시간
    private int prodRevId; // 리뷰 작성 유저ID
    private Timestamp prodRevUpdateAt; // 리뷰 업데이트 시간
    private String prodRevDeleteYn; // 리뷰삭제 'Y','N'
    private Timestamp prodRevDeleteAt; // 리뷰 삭제 시간
    private int childId;
    private int parentId;

}