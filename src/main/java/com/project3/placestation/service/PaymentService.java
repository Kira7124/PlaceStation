package com.project3.placestation.service;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import com.project3.placestation.payment.model.common.PaymentDaySince;
import com.project3.placestation.payment.model.dto.PaymentDto;
import com.project3.placestation.payment.model.dto.PaymentFortOneKeyDto;
import com.project3.placestation.payment.model.dto.PaymentReqDto;
import com.project3.placestation.payment.model.dto.PaymentTokenDto;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
@RequiredArgsConstructor
public class PaymentService {

	public final static RestTemplate restTemplate = new RestTemplate();

	@Autowired
	AdminProdHistoryService historyService;

	/**
	 * 토큰 정보 가져오기
	 * 
	 * @param paymentDto
	 * @return
	 */
	public String paymentGetToken(PaymentDto paymentDto, PaymentFortOneKeyDto fortOne) {

//      1. 토큰 가져오기
//    Request Header 설정
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);

		// Request Body 설정
		JSONObject requestBody = new JSONObject();
		requestBody.put("imp_key", fortOne.getImpKey()); // Rest API 키
		requestBody.put("imp_secret", fortOne.getImpSecret()); // Rest API Secret
																// 키

//헤더 + 바디 결합
		HttpEntity entity = new HttpEntity(requestBody.toString(), headers);

//API 호출
		ResponseEntity<PaymentTokenDto> reqToken = restTemplate.exchange("https://api.iamport.kr/users/getToken",
				HttpMethod.POST, entity, PaymentTokenDto.class);

		String token = reqToken.getBody().getResponse().accessToken;

		if (token == null) {
			refund(token, paymentDto.getMerchantUid(), fortOne.getImpUid(), "저장 중 서버 에러");
			return null;
		}

		log.info("토큰 정보 : " + token);
		log.info(paymentDto.getMerchantUid());
		return token;
	}

	/**
	 * 포트원에 결제 정보 조회 == 결제 정보 사후 검증
	 * 
	 * @param paymentDto
	 * @param token
	 * @return
	 */
	public PaymentReqDto paymentInformationInquiry(PaymentDto paymentDto, String token, PaymentFortOneKeyDto fortOne) {
//	     2. 포트원에 결제 정보 조회 == 결제 정보 사후 검증하기
		// Request Header 설정
		HttpHeaders headers2 = new HttpHeaders();
		headers2.add("Authorization", token);

		// 헤더 + 바디 결합
		HttpEntity entity2 = new HttpEntity(headers2);

		// API 호출
		ResponseEntity<PaymentReqDto> reqData = restTemplate.exchange(
				"https://api.iamport.kr/payments/find/" + paymentDto.getMerchantUid(), HttpMethod.GET, entity2,
				PaymentReqDto.class);
		log.info("데이터 정보 : " + reqData.toString());

		// 사후 검증시 잘못됬다면 환불
		if (reqData.getBody() == null) {
			refund(token, paymentDto.getMerchantUid(), fortOne.getImpUid(), "저장 중 서버 에러");
		}

		return reqData.getBody();
	}

	/**
	 * 환불 정책
	 * 
	 * @param token
	 * @param merchant_uid
	 * @param impUid
	 * @param reason
	 * @return
	 */
	public boolean refund(String token, String merchantUid, String impUid, String reason) {
//      3. 검증 했다 치고 만약 검증이 잘못 됫다면 환불(취소)
//      네이버 페이 시 param 에 extra 넣어야 함 (나중에 추가할 수도)
//      파라미터 타입은 FormData
//      토큰이 필요한듯?

		// 포트원에 결제 정보 조회 == 결제 정보 사후 검증하기
		// Request Header 설정
		HttpHeaders headers3 = new HttpHeaders();
		headers3.setContentType(MediaType.APPLICATION_FORM_URLENCODED);
		headers3.add("Authorization", token);

		// Request Body 설정
		MultiValueMap<String, String> params3 = new LinkedMultiValueMap();
		params3.add("imp_uid", impUid); // 내 키 (주의) (필수)
		params3.add("merchant_uid", merchantUid); // 상품 넘버 (필수) -- 객체에서 가져오기
		params3.add("reason", reason); // 환불 사유 (선택)
		params3.add("refund_holder", ""); // 환불 계좌 예금주 (선택)
		params3.add("refund_bank", ""); // 환불 계좌 은행 코드 (부산은행) (선택)
		params3.add("refund_account", ""); // 환불 계좌 번호 (선택)
		params3.add("refund_tel", ""); // 환불 계좌 예금주 연락처 (선택)
//        params3.add("extra","");       // 네이버 페이 사용시 사용   (네이버페이 사용시 필수)

// 헤더 + 바디 결합
		HttpEntity<MultiValueMap<String, String>> entity3 = new HttpEntity<>(params3, headers3);

// API 호출
		ResponseEntity<String> refund = restTemplate.exchange("https://api.iamport.kr/payments/cancel", HttpMethod.POST,
				entity3, String.class);
		log.info("환불 신청 : " + refund);

//        Api 검증 
		if (refund.getBody() == null || refund.getBody().isEmpty()) {
			return false;
		}
		return true;
	}

	/**
	 * 환불 몇일이 지났는지 확인
	 * @param dateString
	 * @return
	 */
	public int validRefundDate(String dateString) {
        // 주어진 문자열을 LocalDate로 파싱
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDate givenDate = LocalDate.parse(dateString.substring(0, 10), formatter);
        LocalDate currentDate = LocalDate.now();
        return (int) ChronoUnit.DAYS.between(givenDate, currentDate);
	}
	
	/**
	 * 환불 정책 , Amount
	 * 
	 * @param token
	 * @param merchant_uid
	 * @param impUid
	 * @param reason
	 * @return
	 */
	public boolean refund(String token, String merchantUid, String impUid, String reason , int amount , int percent) {
//      3. 검증 했다 치고 만약 검증이 잘못 됫다면 환불(취소)
//      네이버 페이 시 param 에 extra 넣어야 함 (나중에 추가할 수도)
//      파라미터 타입은 FormData
//      토큰이 필요한듯?

		// 시간 차이에 amount 값 확인
		double resAmount = calRefundAmount(amount, percent);
		// 포트원에 결제 정보 조회 == 결제 정보 사후 검증하기
		// Request Header 설정
		HttpHeaders headers3 = new HttpHeaders();
		headers3.setContentType(MediaType.APPLICATION_FORM_URLENCODED);
		headers3.add("Authorization", token);

		// Request Body 설정
		MultiValueMap<String, String> params3 = new LinkedMultiValueMap();
		params3.add("imp_uid", impUid); // 내 키 (주의) (필수)
		params3.add("merchant_uid", merchantUid); // 상품 넘버 (필수) -- 객체에서 가져오기
		params3.add("reason", reason); // 환불 사유 (선택)
		params3.add("amount", String.valueOf(resAmount)); // 환불 계좌 예금주 (선택)
		params3.add("refund_holder", ""); // 환불 계좌 예금주 (선택)
		params3.add("refund_bank", ""); // 환불 계좌 은행 코드 (부산은행) (선택)
		params3.add("refund_account", ""); // 환불 계좌 번호 (선택)
		params3.add("refund_tel", ""); // 환불 계좌 예금주 연락처 (선택)
//        params3.add("extra","");       // 네이버 페이 사용시 사용   (네이버페이 사용시 필수)

// 헤더 + 바디 결합
		HttpEntity<MultiValueMap<String, String>> entity3 = new HttpEntity<>(params3, headers3);

// API 호출
		ResponseEntity<String> refund = restTemplate.exchange("https://api.iamport.kr/payments/cancel", HttpMethod.POST,
				entity3, String.class);
		log.info("환불 신청 : " + refund);

//        Api 검증 
		if (refund.getBody() == null || refund.getBody().isEmpty()) {
			return false;
		}
		return true;
	}
	
	public double calRefundAmount(int amount , int percent) {
		double result = amount * ((double) (100 - percent) / 100);
		return result;
	}
}
