package com.project3.placestation.repository.entity;

import java.sql.Timestamp;

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
	
	
	
	
	
}