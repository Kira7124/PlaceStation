package com.project3.placestation.repository.entity;

import java.sql.Timestamp;

import com.project3.placestation.utils.TimeUtils;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Biz {
		
	private Integer bizno;
	private Integer bizid;
	private String bizbrandname;
	private String bizhp;
	private String bizemail;
	private Integer bizbalance;
	private String filepath;
	private Timestamp joinat;
	private Timestamp outat;
	private Integer fileno;
	private String biztel;
	
	
	//포메터(시간)
	public String formatjoinAt() {
		return TimeUtils.timestampToString(joinat);
	}
	
	
	//포메터(휴대번호)
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
	
	
	//포메터(업장번호)
	public String formatTel(String phoneNumber) {
	    // 전화번호에서 숫자만 남기고 나머지 문자 제거
	    String cleanedNumber = phoneNumber.replaceAll("[^0-9]", "");

	    // 전화번호 포맷 적용
	    if (cleanedNumber.length() == 10) {
	        return cleanedNumber.replaceFirst("(\\d{3})(\\d{3})(\\d{4})", "$1-$2-$3");
	    } else if (cleanedNumber.length() == 9) {
	        return cleanedNumber.replaceFirst("(\\d{2})(\\d{3})(\\d{4})", "$1-$2-$3");
	    } else {
	        // 길이가 맞지 않는 경우
	        return "올바른 전화번호 형식이 아닙니다.";
	    }
	}
	
	
	
	
	
	
	
	
}
