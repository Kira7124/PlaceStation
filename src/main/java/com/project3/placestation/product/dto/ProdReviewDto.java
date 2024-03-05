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
    private String prodRevCreateAt; // 리뷰 작성 시간
    private Integer userNo; // 리뷰 작성 유저번호
    private String prodRevUpdateAt; // 리뷰 업데이트 시간
    private String prodRevDeleteYn; // 리뷰삭제 'Y','N'
    private String prodRevDeleteAt; // 리뷰 삭제 시간
    private Integer parentId; // 원 댓글 id값
    private Integer offset;
<<<<<<< HEAD
    private String userName; // member테이블 유저 이름
    private String filePath; // member테이블 유저 프로필
=======
>>>>>>> ec90f41778ebbee010f2f320c6d1274f4665a9f4
    
}