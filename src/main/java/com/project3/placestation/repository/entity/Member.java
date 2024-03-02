package com.project3.placestation.repository.entity;

import java.sql.Timestamp;

import com.project3.placestation.utils.TimeUtils;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
@Builder
public class Member {

	// member 테이블 pk값
	private int userno;
	// 유저아이디 (로그인시 입력하는 값) 
	private String userid;
	// 비밀번호
	private String userpassword;
	// 주소
	private String useraddress;
	// 이름
	private String username;
	// 휴대폰 번호
	private String userhp;
	// 이메일
	private String useremail;
	// 유저 포인트
	private Integer userpoint;
	// 회원 가입 일자
	private Timestamp joinat;
	// 회원 타입
	private String userrole;
	// 회원 등급
	private String grade;
	// 성별
	private String gender;

	// 판매자 회원가입용 변수
	// userNo값을 참조하는 자동증가값
	private int bizid;
	// 사업자 등록증 이미지 경로
	private String filepath;
	
	
	// jwt관련 변수
	private String token;
	private String oauth;
	
	
	//포메터(시간)
    public String formatjoinAt() {
        return TimeUtils.timestampToString(joinat);
    }



    //포메터(전화번호)
    public String formatHp(String phoneNumber) {
        // 전화번호에서 숫자만 남기고 나머지 문자 제거
        String cleanedNumber = phoneNumber.replaceAll("[^0-9]", "");

        // 전화번호 포맷 적용
        if (cleanedNumber.length() == 11) {
            return cleanedNumber.replaceFirst("(\\d{3}) (\\d{4})(\\d{4})", "$1-$2-$3");
        } else if (cleanedNumber.length() == 10) {
            return cleanedNumber.replaceFirst("(\\d{3})(\\d{3})(\\d{4})", "$1-$2-$3");
        } else {
            // 길이가 맞지 않는 경우
            return "올바른 전화번호 형식이 아닙니다.";
        }
    }

}