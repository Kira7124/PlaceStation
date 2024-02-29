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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project3.placestation.biz.handler.exception.CustomRestfulException;
import com.project3.placestation.biz.model.dto.ResProductDto;
import com.project3.placestation.payment.model.dto.PaymentFortOneKeyDto;
import com.project3.placestation.payment.model.dto.PaymentMemberDto;
import com.project3.placestation.payment.model.dto.ReqPaymentPageDto;
import com.project3.placestation.product.dto.ProductInvalidDateDto;
import com.project3.placestation.repository.entity.Grade;
import com.project3.placestation.service.AdminProdHistoryService;
import com.project3.placestation.service.BizService;
import com.project3.placestation.service.GradeService;
import com.project3.placestation.service.MemberService;
import com.project3.placestation.service.ProductService;

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

	/**
	 * payment 메인 폼 넘어가기 (수정 필요)
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
		if (prodNo < 0) {
			throw new CustomRestfulException("잘못된 요청입니다.", HttpStatus.BAD_REQUEST);
		}

		ResProductDto product = productService.findById(prodNo);
		if (product == null) {
			throw new CustomRestfulException("상품 정보가 없습니다.", HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if (people < 0 || people > product.getProdMaximumPeople()) {
			throw new CustomRestfulException("1번 잘못된 요청입니다.", HttpStatus.BAD_REQUEST);
		}
		if (startTime == endTime || startTime > endTime) {
			throw new CustomRestfulException("2번 잘못된 요청입니다.", HttpStatus.BAD_REQUEST);
		}
		if (startTime == 0 || endTime == 0) {
			throw new CustomRestfulException("3번 잘못된 요청입니다.", HttpStatus.BAD_REQUEST);
		}
		if (startTime < product.getProdStartTime() || endTime > product.getProdEndTime()) {
			throw new CustomRestfulException("4번 잘못된 요청입니다.", HttpStatus.BAD_REQUEST);
		}
		if (date == null || date.isEmpty()) {
			throw new CustomRestfulException("5번 잘못된 요청입니다.", HttpStatus.BAD_REQUEST);
		}
		if (startTime < product.getProdStartTime() || endTime > product.getProdEndTime()) {
			throw new CustomRestfulException("입력하신 시작시간 또는 종료 시간이 잘못되었습니다.", HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(validDate(date)) {
			throw new CustomRestfulException("입력하신 날짜가 잘못되었습니다.", HttpStatus.INTERNAL_SERVER_ERROR);
		}

		// date 값과 같은 날짜인 start_time 과 end_time을 받아옵니다.
		List<ProductInvalidDateDto> list = adminProdHistoryService.findProductInvalidByProdNo(prodNo, date);
		log.info(list.toString());

		// 시간 배열으로 변환합니다.
		int[] resArray = adminProdHistoryService.conversionTime(date, list);
		log.info(Arrays.toString(resArray));

		// 시간이 중복되었는지 확인
		if (Arrays.asList(resArray).contains(startTime) || Arrays.asList(resArray).contains(endTime)) {
			throw new CustomRestfulException("시작시간 또는 종료 시간이 중복되었습니다.", HttpStatus.INTERNAL_SERVER_ERROR);
		}

		// 유저 정보 ( 수정 필요 )
		int userNo = 7;
		PaymentMemberDto member = memberService.findMemberById(userNo);

		// 상품 writerNo 값으로 포트원 키 찾기
		PaymentFortOneKeyDto fortOneKeyDto = bizService.findFortOneKeyByBizNo(product.getProdWriterNo());

		// 유저 등급별 discount (수정 필요)
		Grade grade = gradeService.findByGradeName(member.getUserGrade());
		
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
		model.addAttribute("member", member);
		model.addAttribute("fortOneKey", fortOneKeyDto);

		return "payment/paymentMain";
	}

	public boolean validDate(String dateString) {
		// 오늘 날짜
		Date today = new Date();

		// String을 Date로 변환
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
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
