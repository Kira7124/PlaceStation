package com.project3.placestation.biz.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project3.placestation.biz.handler.exception.CustomRestfulException;
import com.project3.placestation.biz.model.dto.BizHistoryDto;
import com.project3.placestation.biz.model.dto.DbToken;
import com.project3.placestation.biz.model.dto.ReqBizHistoryRefundDto;
import com.project3.placestation.biz.model.util.PageReq;
import com.project3.placestation.biz.model.util.PageRes;
import com.project3.placestation.payment.model.common.PaymentDaySince;
import com.project3.placestation.payment.model.dto.PaymentDto;
import com.project3.placestation.payment.model.dto.PaymentFortOneKeyDto;
import com.project3.placestation.repository.entity.Company;
import com.project3.placestation.service.AdminProdHistoryService;
import com.project3.placestation.service.BizService;
import com.project3.placestation.service.CompanyService;
import com.project3.placestation.service.PaymentService;
import com.project3.placestation.service.ProductService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/biz")
public class BizReservationController {
	
	@Autowired
	ProductService bizProductService;
	
	@Autowired
	BizService bizService;

	@Autowired
	AdminProdHistoryService adminProdHistoryService;
	
	@Autowired
	PaymentService paymentService;
	
	@Autowired
	CompanyService companyService;
	
	// http://localhost/biz/reservation-management
	@GetMapping("/reservation-management")
	public String reservationManagementForm(Model model, 
			@RequestParam(value="page" , defaultValue = "0") int page,
			@RequestParam(value="size" , defaultValue = "8") int size ,
			@RequestParam(value = "text" ,defaultValue = "") String text
			) {

		log.info("page = " + page);
		log.info("size = " + size);
		log.info("text = " + text);
		
		int userId = 1;

		PageReq pageReq = new PageReq(page,size);
		PageRes<BizHistoryDto> pageRes = adminProdHistoryService.findByBizId(userId, pageReq , text);

		log.info(pageRes.toString());
		

		log.info(pageRes.getContent().toString());
        model.addAttribute("history",pageRes.getContent()); // 컨텐츠 배열
        model.addAttribute("currentPage",pageRes.getNumber()); // 컨텐츠 배열
        model.addAttribute("totalPages",pageRes.getTotalElements()); // 컨텐츠 배열
        model.addAttribute("totalItems",pageRes.getSize()); // 컨텐츠 배열
        model.addAttribute("startPage",pageRes.getStartPage()); // 컨텐츠 배열
        model.addAttribute("endPage",pageRes.getEndPage()); // 컨텐츠 배열
        model.addAttribute("text",text); // 컨텐츠 배열
        model.addAttribute("size",size); // 컨텐츠 배열

		return "biz/reservation/biz_reservation_management";
	}
	
	/**
	 *  사업자가 환불 ( 수 정 필 요 )
	 * @param bizHistoryRefundDto
	 * @return
	 */
	@PostMapping("/reservation-management/refund") 
	public String refund(ReqBizHistoryRefundDto bizHistoryRefundDto) {
		
		log.info(bizHistoryRefundDto.toString());
		if(bizHistoryRefundDto.getReason() == null || bizHistoryRefundDto.getReason().isEmpty()) {
			throw new CustomRestfulException("환불 사유를 적어주세요", HttpStatus.BAD_REQUEST);
		}
		if(bizHistoryRefundDto.getReason().length() >= 1000) {
			throw new CustomRestfulException("환불 사유는 1000자 미만입니다.", HttpStatus.BAD_REQUEST);
		}
		if(bizHistoryRefundDto.getMerchantUid() == null || bizHistoryRefundDto.getMerchantUid().isEmpty()) {
			throw new CustomRestfulException("포트원 기본키 누락", HttpStatus.BAD_REQUEST);
		}
		if(bizHistoryRefundDto.getAdminHisCreatedAt() == null || bizHistoryRefundDto.getAdminHisCreatedAt().isEmpty()) {
			throw new CustomRestfulException("거래 내역 날짜 누락", HttpStatus.BAD_REQUEST);
		}
		if(bizHistoryRefundDto.getPurchaseDate() == null || bizHistoryRefundDto.getPurchaseDate().isEmpty()) {
			throw new CustomRestfulException("거래 대상 날짜 누락", HttpStatus.BAD_REQUEST);
		}
		if(bizHistoryRefundDto.getAdminHisPrice() < 0) {
			throw new CustomRestfulException("거래 가격 날짜 누락", HttpStatus.BAD_REQUEST);
		}
		
		// 사업자 No 값으로 상세 조회 - impUid 값 필요 ( 수 정 필 요 )
		int userNo = 1;
		PaymentFortOneKeyDto fortOne = bizService.findFortOneKeyByBizNo(userNo);
		if(fortOne.getImpUid() == null | fortOne.getImpUid().isEmpty()) {
			throw new CustomRestfulException("Imp_UID 누락", HttpStatus.BAD_REQUEST);
		}
		if(fortOne.getImpKey() == null | fortOne.getImpKey().isEmpty()) {
			throw new CustomRestfulException("IMP_KEY 누락", HttpStatus.BAD_REQUEST);
		}
		if(fortOne.getImpSecret() == null | fortOne.getImpSecret().isEmpty()) {
			throw new CustomRestfulException("IMP_SECRET 누락", HttpStatus.BAD_REQUEST);
		}
		String merchantUid = bizHistoryRefundDto.getMerchantUid();
		String reason =  bizHistoryRefundDto.getReason();
		int amount = bizHistoryRefundDto.getAdminHisPrice();
		
		// merchantUid 값으로 정보 - token 조회
		PaymentDto paymentDto = new PaymentDto();
		paymentDto.setMerchantUid(merchantUid);
		String token = paymentService.paymentGetToken(paymentDto, fortOne);
		if(token == null || token.isEmpty()) {
			throw new CustomRestfulException("토큰 누락", HttpStatus.BAD_REQUEST);
		}
		
		// 환불 전에 몇일 지났는지 확인
		int since = paymentService.validRefundDate(bizHistoryRefundDto.getAdminHisCreatedAt());
		
		log.info("몇일이 지났나요 ? : " + since);
		
		double cancelAmount = 0;
		
		// 시간 일자 별로 환불 신청
		switch (since) {
		case 7 : {
			paymentService.refund(token, merchantUid, fortOne.getImpUid(), reason,  amount, PaymentDaySince.ONE);
			cancelAmount = paymentService.calRefundAmount(amount, PaymentDaySince.ONE);
			break;
		}
		case 6 : {
			paymentService.refund(token, merchantUid, fortOne.getImpUid(), reason,  amount, PaymentDaySince.TWO);
			cancelAmount = paymentService.calRefundAmount(amount, PaymentDaySince.TWO);
			break;
		}
		
		case 5 : {
			paymentService.refund(token, merchantUid, fortOne.getImpUid(), reason,  amount, PaymentDaySince.THREE);
			cancelAmount = paymentService.calRefundAmount(amount, PaymentDaySince.THREE);
			break;
		}
		
		case 4 : {
			paymentService.refund(token, merchantUid, fortOne.getImpUid(), reason,  amount, PaymentDaySince.FOUR);
			cancelAmount = paymentService.calRefundAmount(amount, PaymentDaySince.FOUR);
			break;
		}
		
		case 3 : {
			paymentService.refund(token, merchantUid, fortOne.getImpUid(), reason,  amount, PaymentDaySince.FIVE);
			cancelAmount = paymentService.calRefundAmount(amount, PaymentDaySince.FIVE);
			break;
		}
		
		case 2 : {
			paymentService.refund(token, merchantUid, fortOne.getImpUid(), reason,  amount, PaymentDaySince.SIX);
			cancelAmount = paymentService.calRefundAmount(amount, PaymentDaySince.SIX);
			break;
		}
		
		case 1 : {
			paymentService.refund(token, merchantUid, fortOne.getImpUid(), reason,  amount, PaymentDaySince.SEVEN);
			cancelAmount = paymentService.calRefundAmount(amount, PaymentDaySince.SEVEN);
			break;
		}
		case 0 : {
			paymentService.refund(token, merchantUid, fortOne.getImpUid(), reason,  amount, PaymentDaySince.SEVEN);
			cancelAmount = paymentService.calRefundAmount(amount, PaymentDaySince.SEVEN);
			break;
		}
		default:
			throw new CustomRestfulException("환불할 수 없는 날짜이거나 서버 에러가 발생하였습니다.", HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		// 거래내역 환불로 바꾸기
		int result = adminProdHistoryService.updateCancel(merchantUid , cancelAmount);
		if(result == 0) {
			throw new CustomRestfulException("환불에 실패하셨습니다.", HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		// 회사 
		Company company = companyService.findCompany();
		int res = companyService.updateMinCompanyBalance(bizHistoryRefundDto.getAdminHisCharge(), company.getBalance());
		if(res == 0) {
			throw new CustomRestfulException("회사 돈 안빠져나감.", HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return "redirect:/biz/reservation-management";
	}
}

