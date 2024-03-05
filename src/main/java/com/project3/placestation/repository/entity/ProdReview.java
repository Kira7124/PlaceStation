package com.project3.placestation.repository.entity;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

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
    private String prodRevContent;
    private Integer prodRevStar;
    private String prodRevCreateAt;
    private Integer userNo;
    private String prodRevUpdateAt;
    private String prodRevDeleteYn;
    private String prodRevDeleteAt;
    private Integer parentId;
    private String prodTitle;
    private String prodPrice;
    private String filePath;
    private Integer offset;

    private static final SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");

    public void setProdRevCreateAt(Timestamp prodRevCreateAt) {
        this.prodRevCreateAt = dateFormat.format(prodRevCreateAt);
    }

    public void setProdRevUpdateAt(Timestamp prodRevUpdateAt) {
        this.prodRevUpdateAt = dateFormat.format(prodRevUpdateAt);
    }

    public void setProdRevDeleteAt(Timestamp prodRevDeleteAt) {
        this.prodRevDeleteAt = dateFormat.format(prodRevDeleteAt);
    }
}