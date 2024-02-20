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
public class ProdReviewDto {
    private Integer prodRevNo; // 리뷰번호
    private Integer prodNo; // 게시물 번호
    private String prodRevTitle; // 리뷰 제목
    private String prodRevContent; // 리뷰 내용
    private Integer prodRevStar; // 리뷰 평점
    private Timestamp prodRevCreateAt; // 리뷰 작성 시간
    private Integer prodRevId; // 리뷰 작성 유저ID
    private Timestamp prodRevUpdateAt; // 리뷰 업데이트 시간
    private String prodRevDeleteYn; // 리뷰삭제 'Y','N'
    private Timestamp prodRevDeleteAt; // 리뷰 삭제 시간
    private Integer childId;
    private Integer parentId;

}