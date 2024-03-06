package com.project3.placestation.utils;

public class MemberDefine {
	
	// 모든 클래스에서 공유 하기 위해 static을 데이터의 일관성을 유지하기 위해 final을 붙여 상수로 만들었다.

	// 이미지 관련
	public static final int MAX_FILE_SIZE = 1024 * 1024 * 20; // = 20MB 크기 계산
	public static final String UPLOAD_FILE_DIRECTORY = "C:\\dev_workSpace\\upload"; // = 20MB 크기 계산

	//  상수
	public static final String PRINCIPAL = "principal";

	//  Account
	public static final String EXIST_ACCOUNT = "이미 계좌가 존재합니다.";
	public static final String NOT_EXIST_ACCOUNT = "존재하는 계좌가 없습니다.";
	public static final String FAIL_TO_CREATE_ACCOUNT = "계좌 생성이 실패하였습니다.";

	//  User
	public static final String ENTER_YOUR_LOGIN = "로그인 먼저 해주세요.";
	public static final String ENTER_YOUR_USERNAME = "username을 입력해 주세요.";
	public static final String ENTER_YOUR_FULLNAME = "fullname을 입력해 주세요.";
	public static final String ENTER_YOUR_ACCOUNT_NUMBER = "계좌번호를 입력해 주세요.";
	public static final String ENTER_YOUR_PASSWORD = "패스워드를 입력해 주세요.";
	public static final String ENTER_YOUR_BALANCE = "금액을 입력해 주세요.";
	public static final String D_BALANCE_VALUE = "입금 금액이 0원 이하 일 수 없습니다.";
	public static final String W_BALANCE_VALUE = "출금 금액이 0원 이하 일 수 없습니다.";

	public static final String M_NO_CREATE_CODE= "코드를 생성하는데 실패 했습니다.";

	public static final String FAIL_TO_CREATE_USER = "회원가입 실패.";

	public static final String NOT_AN_AUTHENTICATED_USER = "인증된 사용자가 아닙니다.";
	
}
