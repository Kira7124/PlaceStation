package com.project3.placestation.party.dto;

import java.util.Arrays;

import lombok.Data;

@Data
public class PartyDto {
	private Integer partyNo;
	private String partyName;
	private String partyTitle;
	private String partyDescription;
	private Integer partyHost;
	private Integer partyMaximumPeople;
	private String filePath;
	private String parcipationUserNo;
	private Integer partyManager;
	private Integer productNo;
	private String adminHisNo;
	private String partyCreatedAt;
	private String partyUpdateAt;
	private String partyDeleteAt;
	private String partyDeleteYn;
	// member 테이블 pk값
	private int userno;
	// 유저아이디 (로그인시 입력하는 값) 
	private String userid;
	// 이름
	private String username;
	// 휴대폰 번호
	private String userhp;
	// 이메일
	private String useremail;
	// 회원 타입
	private String userrole;
	// 회원 등급
	private String grade;
	// 성별
	private String gender;
	private String userFilePath;
	private Integer prodNo;	// 게시물 번호
	private Integer prodWriterNo; // 판매자 id 값
	private String prodTitle; // 게시물 제목
	private Integer prodStartTime; // 시작 시간
	private Integer prodEndTime; // 종료 시간
	private String prodSpaceInfo; // 공간 대여 소개
	private String prodGoodsInfo; // 물품 대여 소개
	private String prodCautionInfo; // 예약시 주의사항
	private Integer prodMaximumPeople; // 최대 인원 수
	private String prodAddress; // 상품 주소
	private String prodDetailedAddress; // 상세 주소
	private Integer prodPrice; // 상품 가격
	private String productFilePath; // 파일 url
	private Integer prodMajorCategoryId; // 대분류 카테고리 id
	private Integer prodSubcategoryId; // 소분류 카테고리 id
	private String prodFullAddress; // 위치 풀 네임
	private Double prodLocationX; // 위도 값
	private Double prodLocationY; // 경도 값
	private String prodRdate; // 게시물 작성일
	private String prodUpdateAt;	// 업데이트 날짜
	private String prodDeleteYn;	// 삭제 Y , N
	private String prodDeleteAt;	// 삭제일
	private String prodDeleteReason; // 삭제 이유
	private String historyAdminHisNo; // 포트원 merchant_uid
	private String token;	// 포트원 token
	private Integer adminHisProdNo;
	private String adminHisProdName;
	private Integer adminHisPrice;
	private Integer adminHisUsePoint;
	private Integer adminHisSavePoint;
	private Integer adminHisDiscount;
	private Integer adminHisCharge;
	private Integer adminHisSellerId;
	private boolean adminHisConfirm;
	private String adminHisCreatedAt;
	private Integer adminHisBuyerId;
	private String bank;
	private Integer startTime;
	private Integer endTime;
	private String cancelYn;
	private String cancelAt;
	private Integer cancelAmount;
	private Integer peopleCount;
	private String purchaseDate;
	
	/**
	 * 개인 당 금액 계산
	 * @return
	 */
	public String peopleByamount() {
		int amount = adminHisPrice / peopleCount;
		return String.valueOf(amount);
	}
	
	/**
	 * 파티에 가입되어 있는지 확인
	 * @param userno
	 * @return
	 */
	public boolean validPartyJoin(int userno) {
		String[] strArray = parcipationUserNo.split(",");
		return Arrays.asList(strArray).contains(String.valueOf(userno));
	}
}
