package com.project3.placestation.biz.model.util;

public class BizDefine {
	public final static String DATA_IS_NOTHING = "데이터가 오지 않았습니다.";
	public final static String ACCOUNT_IS_NONE = "회원 정보가 변경되었거나 없습니다.";
	public final static String PLEASE_WRITE_USERNAME = "유저이름을 적어주세요.";
	public final static String PLEASE_WRITE_PASSWORD = "비밀번호를 적어주세요.";
	public final static String PLEASE_WRITE_CEO_PHONE = "대표 전화번호를 적어주세요.";
	public final static String PLEASE_WRITE_NORMAL_PHONE = "일반 전화번호를 적어주세요.";
	public final static String NO_VALID_PHONE = "유효하지 않은 휴대폰 번호 입니다.";
	public final static String NO_VALID_ADDRESS = "주소를 입력해주세요.";
	public final static String NO_VALID_DETAILED_ADDRESS = "상세 주소를 입력해주세요.";
	public final static String NO_VALID_MAP = "지도 상세 위치를 입력해 주세요.";
	public final static String PLEASE_WRITE_BUIZNESS_NAME = "사업자 상호명을 적어주세요.";
	public final static String PLEASE_WRITE_IMP_UID = "포트원 uid 를 적어주세요.";
	public final static String NO_VALID_IMP_UID = "포트원 UID 누락.";
	public final static String PLEASE_WRITE_IMP_KEY = "포트원 key 를 적어주세요.";
	public final static String NO_VALID_IMP_KEY = "포트원 key 를 누락.";
	public final static String PLEASE_WRITE_IMP_SECRET = "포트원 secret 를 적어주세요.";
	public final static String NO_VALID_IMP_SECRET = "IMP_SECRET 누락.";
	public final static String PLEASE_WRITE_TITLE = "제목을 적어주세요";
	public final static String NO_VALID_TITLE_MORE_THAN_TWENTY = "제목은 20자 이상을 허용할 수 없습니다.";
	public final static String NO_VALID_BANNER_IMAGE_OR_LESS_THAN_SIX = "배너 이미지가 없거나 6개 이상을 허용할 수 없습니다.";
	public final static String NO_VALID_TIME = "잘못된 시간 요청입니다.";
	public final static String NO_VALID_DATE = "잘못된 날짜 요청입니다.";
	public final static String NO_VALID_START_TIME = "시작 시간은 0 ~ 23시 안으로 적어주세요.";
	public final static String NO_VALID_END_TIME = "종료 시간은 0 ~ 23시 안으로 적어주세요.";
	public final static String NO_VALID_END_TIME_LESS_THAN_START_TIME = "종료 시간은 시작시간보다 낮아야 합니다.";
	public final static String NO_VALID_PEOPLE = "인원 수가 너무 작거나 큽니다.";
	public final static String NO_VALID_AMOUNT = "가격이 너무 작거나 큽니다.";
	public final static String PLEASE_WRITE_SPACE_INFO = "공간 소개를 입력해 주세요.";
	public final static String PLEASE_WRITE_GOODS_INFO = "대여 물품을 입력해 주세요.";
	public final static String PLEASE_WRITE_CAUTION_INFO = "예약 시 주의 사항를 입력해 주세요.";
	public final static String PLEASE_WRITE_MAIN_CATEGORY = "메인 카테고리를 지정해 주세요.";
	public final static String PLEASE_WRITE_SUB_CATEGORY = "서브 카테고리를 지정해 주세요.";
	public final static String PLEASE_WRITE_REASON = "상세 이유를 적어주세요.";
	public final static String PLEASE_WRITE_DESCRIPTION = "설명을 적어주세요.";
	public final static String PLEASE_WRITE_REASON_LESS_THAN_FOUR_HUNDRED = "상세 이유를 적어주세요.";
	public final static String PLEASE_WRITE_REFUND_REASON = "환불 사유를 적어주세요.";
	public final static String PLEASE_WRITE_REFUND_REASON_LESS_THAN_THOUSAND = "환불 사유는 1000자 미만입니다..";
	public final static String NO_VALID_HISTORY_DATE = "거래 내역 날짜 누락.";
	public final static String NO_VALID_TARGET_HISTORY_DATE = "거래 대상 날짜 누락.";
	public final static String NO_VALID_AMOUNT_HISTORY_DATE = "거래 가격 날짜 누락.";
	public final static String SERVER_ERROR_TO_REFUND = "서버 에러가 발생하였습니다.. 환불에 실패하였습니다.";
	public final static String WRONG_REQUEST = "잘못된 요청입니다.";
	public final static String NO_SEARCH_PRODUCT = "상품 정보가 없습니다.";
	public final static String NO_SEARCH_ANNOUNCEMENT = "공지사항 정보가 없거나 변경되었습니다.";
	public final static String DUPLICATED_TIME = "시작시간 또는 종료 시간이 중복되었습니다.";
	public final static String SERVER_ERROR = "서버 에러가 발생하였습니다 관리자에게 문의해주세요.";
	public final static String SERVER_ERROR_OR_NOT_FOUND = "서버 에러가 발생하였거나 결제내역이 없습니다. 관리자에게 문의해주세요.";
	public final static String NO_VALID_TOKEN = "토큰 누락, 서버 에러가 발생하였습니다.";
	public final static String NO_VALID_DESCRIPTION_IMAGE = "부가 설명을 하나라도 지정해 주세요.";
	public final static String PRODUCT_NOTHING_FOUND = "상품이 변경되었거나 삭제되었습니다.";
	public final static String PARCIPATION_PARTY_NOTHING_FOUND = "모임이 변경되었거나 삭제되었습니다.";
	public final static String VALID_PARCIPATION_PARTY = "모임에 참가하지 않으셨군요!";
	public final static String INTERVAL_SERVER_ERROR = "로그인이 되어있지 않거나 , 서버 에러가 발생하였습니다.";
	public final static String NO_VALID_JOIN = "이미 참가했거나 참가 인원이 꽉 찼습니다.";
	public final static String NO_VALID_PARTY_DATE = "이미 종료 시간이 지났습니다.";
	public final static String NO_VALID_PARTY_CREATE = "모임을 생성하실 수 있는 내역이 없네요!! 예약을 먼저 하셔야겠어요!!";
	public final static String PARTY_CREATE_ALREADY_DONE = "모임이 이미 있네요!!!";
	public final static String NO_SEARCH_PARTY = "모임이 찾을수가 없어요! 모임이 변경되었거나 삭제되었나봐요 또는 서버 에러가 발생했을 수도 있으니 관리자에게 문의를 넣어주세요.";
	public final static String NO_AUTHORITY = "권한이 없습니다.";
	public final static String PLEASE_WRITE_STAR = "평점을 선택해 주세요.";
	
}
