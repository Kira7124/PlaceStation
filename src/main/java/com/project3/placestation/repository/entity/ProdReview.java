package com.project3.placestation.repository.entity;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ProdReview {

    private Integer prodRevNo;
    private Integer prodNo;
    private String prodRevTitle;
    private String prodRevContent;
    private Integer prodRevStar;
    private Timestamp prodRevCreateAt;
    private Integer prodRevId;
    private Timestamp prodRevUpdateAt;
    private String prodRevDeleteYn;
    private Timestamp prodRevDeleteAt;
    private Integer childId;
    private Integer parentId;
    private String prodTitle;
    private String prodPrice;
    private String filePath;
}
