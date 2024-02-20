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

    private int prodRevNo;
    private int prodNo;
    private String prodRevTitle;
    private String prodRevContent;
    private int prodRevStar;
    private Timestamp prodRevCreateAt;
    private int prodRevId;
    private Timestamp prodRevUpdateAt;
    private String prodRevDeleteYn;
    private Timestamp prodRevDeleteAt;
    private int childId;
    private int parentId;
    private String prodTitle;
    private String prodPrice;
    private String filePath;
}
