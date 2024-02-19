package com.project3.placestation.repository.entity;

import java.sql.Timestamp;
import java.text.DecimalFormat;
import java.text.Format;

import com.project3.placestation.utils.TimeUtils;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class BizJoin {
	
	private Integer biz_no;
	private Integer biz_id;
	private String biz_brand_name;
	private String user_password;
	private String user_address;
	private String user_name;
	private Integer user_point;
	private Timestamp join_at;
	private String role;
	private String user_grade;
	private String user_hp;
	private String user_email;
	private String file_path;
	private String biz_Tel;
	private String originimg;
	private String uploadimg;
	
	
	
	
	//포메터(시간)
	public String formatjoinAt() {
		return TimeUtils.timestampToString(join_at);
	}
	
	
	
	//포메터(전화번호)
	public String formatHp(String phoneNumber) {
	    // 전화번호에서 숫자만 남기고 나머지 문자 제거
	    String cleanedNumber = phoneNumber.replaceAll("[^0-9]", "");

	    // 전화번호 포맷 적용
	    if (cleanedNumber.length() == 11) {
	        return cleanedNumber.replaceFirst("(\\d{3})(\\d{4})(\\d{4})", "$1-$2-$3");
	    } else if (cleanedNumber.length() == 10) {
	        return cleanedNumber.replaceFirst("(\\d{3})(\\d{3})(\\d{4})", "$1-$2-$3");
	    } else {
	        // 길이가 맞지 않는 경우
	        return "올바른 전화번호 형식이 아닙니다.";
	    }
	}
	
	
	
	//사진업로드 
	public String setupUserImage() {
	    String imagePath = null;
	    
	  
	    if ("default.jpg".equals(originimg)) {
	      
	        imagePath = getImagePathFromDatabase(); 
	        
	        // imagePath가 null이거나 빈 문자열인 경우 기본 이미지 경로를 반환
	        if (imagePath == null || imagePath.isEmpty()) {
	            return originimg; // 기본 이미지 경로 반환
	        } else {
	            return imagePath; // DB에서 가져온 이미지 경로 반환
	        }
	    } else {
	        // originimg가 다른 값(--> 업로드해서 다른 jpg로 바뀐경우) 일 때, 업로드된 이미지 경로를 반환
	        return uploadimg == null ? originimg : "/images/upload/" + uploadimg;
	    }
	}

	
	
	//업로드경로 메서드
	private String getImagePathFromDatabase() {

	    String imagePath = "/assets/img/default.jpg"; 
	    
	    return imagePath;
	}
	
	
	
	
	
	
	
}
