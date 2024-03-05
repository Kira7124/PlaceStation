package com.project3.placestation.payment.controller;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project3.placestation.biz.handler.exception.CustomLoginRestfulException;
import com.project3.placestation.biz.handler.exception.CustomRestfulException;
import com.project3.placestation.biz.model.dto.ResProductDto;
import com.project3.placestation.biz.model.util.BizDefine;
import com.project3.placestation.payment.model.common.PaymentDaySince;
import com.project3.placestation.payment.model.dto.PaymentDto;
import com.project3.placestation.payment.model.dto.PaymentFortOneKeyDto;
import com.project3.placestation.payment.model.dto.PaymentMemberDto;
import com.project3.placestation.payment.model.dto.ReqMemberHistoryRefundDto;
import com.project3.placestation.payment.model.dto.ReqPaymentPageDto;
import com.project3.placestation.product.dto.ProductInvalidDateDto;
import com.project3.placestation.repository.entity.Company;
import com.project3.placestation.repository.entity.Grade;
import com.project3.placestation.repository.entity.Member;
import com.project3.placestation.service.AdminProdHistoryService;
import com.project3.placestation.service.BizService;
import com.project3.placestation.service.CompanyService;
import com.project3.placestation.service.GradeService;
import com.project3.placestation.service.MemberService;
import com.project3.placestation.service.PaymentService;
import com.project3.placestation.service.ProductService;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/payment")
public class PaymentController {

	@Autowired
	AdminProdHistoryService adminProdHistoryService;

	@Autowired
	ProductService productService;

	@Autowired
	MemberService memberService;

	@Autowired
	BizService bizService;
	
	@Autowired
	GradeService gradeService;
	
	@Autowired
	PaymentService paymentService;
	
	@Autowired
	CompanyService companyService;
	
	@Autowired
	HttpSession httpSession;

	/**
	 * payment 메인 폼 넘어가기
	 * 
	 * @param dto
	 * @return
	 */
	@GetMapping("/main")
	public String paymentForm(@RequestParam(value = "prodNo") Integer prodNo,
			@RequestParam(value = "people") Integer people, @RequestParam(value = "date") String date,
			@RequestParam(value = "startTime", defaultValue = "0") Integer startTime,
			@RequestParam(value = "endTime", defaultValue = "0") Integer endTime, Model model) {
		// 1. 유효성 검사
		if (prodNo < 1) {
			throw new CustomRestfulException(BizDefine.WRONG_REQUEST, HttpStatus.BAD_REQUEST);
		}
		ResProductDto product = productService.findById(prodNo);
		if (product == null) {
			throw new CustomRestfulException(BizDefine.NO_SEARCH_PRODUCT, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if (people < 1 || people > product.getProdMaximumPeople()) {
			throw new CustomRestfulException(BizDefine.NO_VALID_PEOPLE, HttpStatus.BAD_REQUEST);
		}
		if (startTime == endTime || startTime > endTime) {
			throw new CustomRestfulException(BizDefine.NO_VALID_TIME, HttpStatus.BAD_REQUEST);
		}
		if (startTime == 0 || endTime == 0) {
			throw new CustomRestfulException(BizDefine.NO_VALID_TIME, HttpStatus.BAD_REQUEST);
		}
		if (startTime < product.getProdStartTime() || endTime > product.getProdEndTime()) {
			throw new CustomRestfulException(BizDefine.NO_VALID_TIME, HttpStatus.BAD_REQUEST);
		}
		if (date == null || date.isEmpty()) {
			throw new CustomRestfulException(BizDefine.NO_VALID_DATE, HttpStatus.BAD_REQUEST);
		}
		if (startTime < product.getProdStartTime() || endTime > product.getProdEndTime()) {
			throw new CustomRestfulException(BizDefine.NO_VALID_TIME, HttpStatus.BAD_REQUEST);
		}
		String dateAndTime = date + " " + startTime;
		if(validDate(dateAndTime)) {
			throw new CustomRestfulException(BizDefine.NO_VALID_DATE, HttpStatus.BAD_REQUEST);
		}

		// date 값과 같은 날짜인 start_time 과 end_time을 받아옵니다.
		List<ProductInvalidDateDto> list = adminProdHistoryService.findProductInvalidByProdNo(prodNo, date);
		log.info(list.toString());

		// 시간 배열으로 변환합니다.
		int[] resArray = adminProdHistoryService.conversionTime(date, list);
		log.info(Arrays.toString(resArray));

		// 시간이 중복되었는지 확인
		boolean validTime = adminProdHistoryService.validTime(resArray, startTime,
				endTime);
		if(validTime) {
			throw new CustomRestfulException(BizDefine.DUPLICATED_TIME, HttpStatus.INTERNAL_SERVER_ERROR);
		}

		// 유효성 검사
		Member member = (Member) httpSession.getAttribute("member"); 

		if(member == null || member.getToken() == null || member.getToken().isEmpty()) {
			throw new CustomLoginRestfulException(BizDefine.ACCOUNT_IS_NONE, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		PaymentMemberDto memberDto = memberService.findMemberById(member.getUserno());

		// 상품 writerNo 값으로 포트원 키 찾기
		PaymentFortOneKeyDto fortOneKeyDto = bizService.findFortOneKeyByBizNo(product.getProdWriterNo());

		// 유저 등급별 discount (수정 필요)
		Grade grade = gradeService.findByGradeName(memberDto.getUserGrade());
		
		int discountPercent = grade.getGradeDiscount();
		// 총합 계산
		int amount = adminProdHistoryService.calAmount(product.getProdPrice(), people, startTime, endTime);
		// 할인 계산
		int discountAmount = adminProdHistoryService.calPercentage(amount, discountPercent, 100);

		// 주문 정보
		ReqPaymentPageDto order = ReqPaymentPageDto.builder().prodNo(prodNo).people(people).startTime(startTime)
				.endTime(endTime).date(date).amount(amount).discountAmount(discountAmount)
				.discountPercent(discountPercent).build();

		// 2. 데이터 넘겨주기
		model.addAttribute("product", product);
		model.addAttribute("order", order);
		model.addAttribute("member", memberDto);
		model.addAttribute("fortOneKey", fortOneKeyDto);

		return "payment/paymentMain";
	}
	
	/**
	 *  유저가 환불
	 * @param bizHistoryRefundDto
	 * @return
	 */
	@PostMapping("/reservation-management/user/refund") 
	public String refund(ReqMemberHistoryRefundDto memberHistoryRefundDto) {
		
		
		// 유효성 검사
		Member member = (Member) httpSession.getAttribute("member"); 

		if(member == null || member.getToken() == null || member.getToken().isEmpty()) {
			throw new CustomLoginRestfulException(BizDefine.ACCOUNT_IS_NONE, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		log.info(memberHistoryRefundDto.toString());
		if(memberHistoryRefundDto.getReason() == null || memberHistoryRefundDto.getReason().isEmpty()) {
			throw new CustomRestfulException(BizDefine.PLEASE_WRITE_REFUND_REASON, HttpStatus.BAD_REQUEST);
		}
		if(memberHistoryRefundDto.getReason().length() >= 1000) {
			throw new CustomRestfulException(BizDefine.PLEASE_WRITE_REFUND_REASON_LESS_THAN_THOUSAND, HttpStatus.BAD_REQUEST);
		}
		if(memberHistoryRefundDto.getMerchantUid() == null || memberHistoryRefundDto.getMerchantUid().isEmpty()) {
			throw new CustomRestfulException(BizDefine.NO_VALID_IMP_UID, HttpStatus.BAD_REQUEST);
		}
		if(memberHistoryRefundDto.getAdminHisCreatedAt() == null || memberHistoryRefundDto.getAdminHisCreatedAt().isEmpty()) {
			throw new CustomRestfulException(BizDefine.NO_VALID_HISTORY_DATE, HttpStatus.BAD_REQUEST);
		}
		if(memberHistoryRefundDto.getPurchaseDate() == null || memberHistoryRefundDto.getPurchaseDate().isEmpty()) {
			throw new CustomRestfulException(BizDefine.NO_VALID_TARGET_HISTORY_DATE, HttpStatus.BAD_REQUEST);
		}
		if(memberHistoryRefundDto.getAdminHisPrice() < 0) {
			throw new CustomRestfulException(BizDefine.NO_VALID_AMOUNT_HISTORY_DATE, HttpStatus.BAD_REQUEST);
		}
		
		// 사업자 No 값으로 상세 조회 - impUid 값 필요 
		PaymentFortOneKeyDto fortOne = bizService.findFortOneKeyByBizNo(memberHistoryRefundDto.getAdminHisSellerId());
		if(fortOne.getImpUid() == null | fortOne.getImpUid().isEmpty()) {
			throw new CustomRestfulException(BizDefine.NO_VALID_IMP_UID, HttpStatus.BAD_REQUEST);
		}
		if(fortOne.getImpKey() == null | fortOne.getImpKey().isEmpty()) {
			throw new CustomRestfulException(BizDefine.NO_VALID_IMP_KEY, HttpStatus.BAD_REQUEST);
		}
		if(fortOne.getImpSecret() == null | fortOne.getImpSecret().isEmpty()) {
			throw new CustomRestfulException(BizDefine.NO_VALID_IMP_SECRET, HttpStatus.BAD_REQUEST);
		}
		String merchantUid = memberHistoryRefundDto.getMerchantUid();
		String reason =  memberHistoryRefundDto.getReason();
		int amount = memberHistoryRefundDto.getAdminHisPrice() + memberHistoryRefundDto.getAdminHisCharge();
		
		// merchantUid 값으로 정보 - token 조회

		PaymentDto dto = new PaymentDto();
		dto.setMerchantUid(merchantUid);
		String token = paymentService.paymentGetToken(dto, fortOne);
		if(token == null || token.isEmpty()) {
			throw new CustomRestfulException(BizDefine.SERVER_ERROR, HttpStatus.BAD_REQUEST);
		}
		
		// 환불 전에 몇일 지났는지 확인 ( 사업자 x , 유저 입장에서 해야함 )
		int since = paymentService.validRefundDate(memberHistoryRefundDto.getAdminHisCreatedAt());
		

		log.info("지난 일수 : " + since);
		
		// 환불 금액
		double cancelAmount = 0;
		double chargeAmount = 0;
		
		// 시간 일자 별로 환불 신청
		// 지난 일수가 7일 이면 
		// 실질적인 환불 신청
		switch (since) {
//		case 7 : {
//			cancelAmount = paymentService.calRefundAmount(amount, PaymentDaySince.HUNDRED);
//			chargeAmount = paymentService.calRefundAmount(bizHistoryRefundDto.getAdminHisCharge(), PaymentDaySince.HUNDRED);
//			paymentService.refund(token, merchantUid, fortOne.getImpUid(), reason,  cancelAmount);
//			break;
//		}
//		case 6 : {
//			cancelAmount = paymentService.calRefundAmount(amount, PaymentDaySince.HUNDRED);
//			chargeAmount = paymentService.calRefundAmount(bizHistoryRefundDto.getAdminHisCharge(), PaymentDaySince.HUNDRED);
//			paymentService.refund(token, merchantUid, fortOne.getImpUid(), reason,  cancelAmount);
//			break;
//		}
//		
//		case 5 : {
//			cancelAmount = paymentService.calRefundAmount(amount, PaymentDaySince.HUNDRED);
//			chargeAmount = paymentService.calRefundAmount(bizHistoryRefundDto.getAdminHisCharge(), PaymentDaySince.HUNDRED);
//			paymentService.refund(token, merchantUid, fortOne.getImpUid(), reason,  cancelAmount);
//			break;
//		}
		case 4 : {
			cancelAmount = paymentService.calRefundAmount(amount, PaymentDaySince.TWENTY);
			chargeAmount = paymentService.calRefundAmount(memberHistoryRefundDto.getAdminHisCharge(), PaymentDaySince.TWENTY);
			paymentService.refund(token, merchantUid, fortOne.getImpUid(), reason,  cancelAmount);
			break;
		}
		
		case 3 : {
			cancelAmount = paymentService.calRefundAmount(amount, PaymentDaySince.TWENTY);
			chargeAmount = paymentService.calRefundAmount(memberHistoryRefundDto.getAdminHisCharge(), PaymentDaySince.TWENTY);
			paymentService.refund(token, merchantUid, fortOne.getImpUid(), reason,  cancelAmount);
			break;
		}
		
		case 2 : {
			cancelAmount = paymentService.calRefundAmount(amount, PaymentDaySince.ZERO);
			chargeAmount = paymentService.calRefundAmount(memberHistoryRefundDto.getAdminHisCharge(), PaymentDaySince.ZERO);
			paymentService.refund(token, merchantUid, fortOne.getImpUid(), reason,  cancelAmount);
			break;
		}
		
		case 1 : {
			cancelAmount = paymentService.calRefundAmount(amount, PaymentDaySince.ZERO);
			chargeAmount = paymentService.calRefundAmount(memberHistoryRefundDto.getAdminHisCharge(), PaymentDaySince.ZERO);
			paymentService.refund(token, merchantUid, fortOne.getImpUid(), reason,  cancelAmount);
			break;
		}
		case 0 : {
			cancelAmount = paymentService.calRefundAmount(amount, PaymentDaySince.ZERO);
			chargeAmount = paymentService.calRefundAmount(memberHistoryRefundDto.getAdminHisCharge(), PaymentDaySince.ZERO);
			paymentService.refund(token, merchantUid, fortOne.getImpUid(), reason,  cancelAmount);
			break;
		}
		default:
			throw new CustomRestfulException(BizDefine.SERVER_ERROR_TO_REFUND, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		// 거래내역 환불로 바꾸기
		int result = adminProdHistoryService.updateCancel(merchantUid , cancelAmount);
		if(result == 0) {
			throw new CustomRestfulException(BizDefine.SERVER_ERROR_TO_REFUND, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		// 회사 
		Company company = companyService.findCompany();
		int res = companyService.updateMinCompanyBalance((int) chargeAmount, company.getBalance());
		if(res == 0) {
			throw new CustomRestfulException(BizDefine.SERVER_ERROR_TO_REFUND, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return "redirect:/biz/reservation-management";
	}

	public boolean validDate(String dateString) {
		// 오늘 날짜
		Date today = new Date();
	
		// String을 Date로 변환
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH");
		Date comparisonDate = null;
		try {
			comparisonDate = dateFormat.parse(dateString);

		} catch (ParseException e) {
			e.printStackTrace();
		}

		// 비교
		if (comparisonDate != null && comparisonDate.before(today)) {
			// 오늘보다 날짜가 낮으면
			return true;
		} else {
			// 오늘보다 날짜가 크면
			return false;
		}
	}

}
