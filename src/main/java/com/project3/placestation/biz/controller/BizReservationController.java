package com.project3.placestation.biz.controller;

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
import com.project3.placestation.biz.model.dto.BizHistoryDto;
import com.project3.placestation.biz.model.dto.ReqBizHistoryRefundDto;
import com.project3.placestation.biz.model.util.BizDefine;
import com.project3.placestation.biz.model.util.PageReq;
import com.project3.placestation.biz.model.util.PageRes;
import com.project3.placestation.payment.model.common.PaymentDaySince;
import com.project3.placestation.payment.model.dto.PaymentDto;
import com.project3.placestation.payment.model.dto.PaymentFortOneKeyDto;
import com.project3.placestation.payment.model.dto.ReqMemberHistoryRefundDto;
import com.project3.placestation.repository.entity.Company;
import com.project3.placestation.repository.entity.Member;
import com.project3.placestation.service.AdminProdHistoryService;
import com.project3.placestation.service.BizService;
import com.project3.placestation.service.CompanyService;
import com.project3.placestation.service.PaymentService;
import com.project3.placestation.service.ProductService;

import jakarta.servlet.http.HttpSession;
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
	
	@Autowired
	HttpSession httpSession;
	

	// http://localhost/biz/reservation-management
	@GetMapping("/reservation-management")
	public String reservationManagementForm(Model model, 
			@RequestParam(value="page" , defaultValue = "0") int page,
			@RequestParam(value="size" , defaultValue = "16") int size ,
			@RequestParam(value = "text" ,defaultValue = "") String text
			) {

		log.info("page = " + page);
		log.info("size = " + size);
		log.info("text = " + text);
		
		// 유효성 검사
		Member member = (Member) httpSession.getAttribute("member"); 

		if(member == null || member.getToken() == null || member.getToken().isEmpty()) {
			throw new CustomLoginRestfulException(BizDefine.ACCOUNT_IS_NONE, HttpStatus.INTERNAL_SERVER_ERROR);
		}

		PageReq pageReq = new PageReq(page,size);
		PageRes<BizHistoryDto> pageRes = adminProdHistoryService.findByBizId(member.getUserno(), pageReq , text);

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
	 *  사업자가 환불
	 * @param bizHistoryRefundDto
	 * @return
	 */
	@PostMapping("/reservation-management/refund") 
	public String refund(ReqBizHistoryRefundDto bizHistoryRefundDto) {
		
		// 유효성 검사
		Member member = (Member) httpSession.getAttribute("member"); 

		if(member == null || member.getToken() == null || member.getToken().isEmpty()) {
			throw new CustomLoginRestfulException(BizDefine.ACCOUNT_IS_NONE, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		log.info(bizHistoryRefundDto.toString());
		if(bizHistoryRefundDto.getReason() == null || bizHistoryRefundDto.getReason().isEmpty()) {
			throw new CustomRestfulException(BizDefine.PLEASE_WRITE_REFUND_REASON, HttpStatus.BAD_REQUEST);
		}
		if(bizHistoryRefundDto.getReason().length() >= 1000) {
			throw new CustomRestfulException(BizDefine.PLEASE_WRITE_REFUND_REASON_LESS_THAN_THOUSAND, HttpStatus.BAD_REQUEST);
		}
		if(bizHistoryRefundDto.getMerchantUid() == null || bizHistoryRefundDto.getMerchantUid().isEmpty()) {
			throw new CustomRestfulException(BizDefine.NO_VALID_IMP_UID, HttpStatus.BAD_REQUEST);
		}
		if(bizHistoryRefundDto.getAdminHisCreatedAt() == null || bizHistoryRefundDto.getAdminHisCreatedAt().isEmpty()) {
			throw new CustomRestfulException(BizDefine.NO_VALID_HISTORY_DATE, HttpStatus.BAD_REQUEST);
		}
		if(bizHistoryRefundDto.getPurchaseDate() == null || bizHistoryRefundDto.getPurchaseDate().isEmpty()) {
			throw new CustomRestfulException(BizDefine.NO_VALID_TARGET_HISTORY_DATE, HttpStatus.BAD_REQUEST);
		}
		if(bizHistoryRefundDto.getAdminHisPrice() < 0) {
			throw new CustomRestfulException(BizDefine.NO_VALID_AMOUNT_HISTORY_DATE, HttpStatus.BAD_REQUEST);
		}
		
		// 사업자 No 값으로 상세 조회 - impUid 값 필요 
		PaymentFortOneKeyDto fortOne = bizService.findFortOneKeyByBizNo(bizHistoryRefundDto.getAdminHisSellerId());
		if(fortOne.getImpUid() == null | fortOne.getImpUid().isEmpty()) {
			throw new CustomRestfulException(BizDefine.NO_VALID_IMP_UID, HttpStatus.BAD_REQUEST);
		}
		if(fortOne.getImpKey() == null | fortOne.getImpKey().isEmpty()) {
			throw new CustomRestfulException(BizDefine.NO_VALID_IMP_KEY, HttpStatus.BAD_REQUEST);
		}
		if(fortOne.getImpSecret() == null | fortOne.getImpSecret().isEmpty()) {
			throw new CustomRestfulException(BizDefine.NO_VALID_IMP_SECRET, HttpStatus.BAD_REQUEST);
		}
		String merchantUid = bizHistoryRefundDto.getMerchantUid();
		String reason =  bizHistoryRefundDto.getReason();
		int amount = bizHistoryRefundDto.getAdminHisPrice() + bizHistoryRefundDto.getAdminHisCharge();
		
		// merchantUid 값으로 정보 - token 조회

		PaymentDto dto = new PaymentDto();
		dto.setMerchantUid(merchantUid);
		String token = paymentService.paymentGetToken(dto, fortOne);
		if(token == null || token.isEmpty()) {
			throw new CustomRestfulException(BizDefine.SERVER_ERROR, HttpStatus.BAD_REQUEST);
		}
		
		// 환불 전에 몇일 지났는지 확인 ( 사업자 x , 유저 입장에서 해야함 )
//		int since = paymentService.validRefundDate(bizHistoryRefundDto.getAdminHisCreatedAt());
		

//		log.info("지난 일수 : " + since);
		
		// 환불 금액
		double cancelAmount = 0;
		double chargeAmount = 0;
		
		cancelAmount = paymentService.calRefundAmount(amount, PaymentDaySince.ZERO);
		chargeAmount = paymentService.calRefundAmount(bizHistoryRefundDto.getAdminHisCharge(), PaymentDaySince.ZERO);
		paymentService.refund(token, merchantUid, fortOne.getImpUid(), reason,  cancelAmount);
		
		// 시간 일자 별로 환불 신청
		// 지난 일수가 7일 이면 
		// 실질적인 환불 신청
//		switch (since) {
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
//		case 4 : {
//			cancelAmount = paymentService.calRefundAmount(amount, PaymentDaySince.TWENTY);
//			chargeAmount = paymentService.calRefundAmount(bizHistoryRefundDto.getAdminHisCharge(), PaymentDaySince.TWENTY);
//			paymentService.refund(token, merchantUid, fortOne.getImpUid(), reason,  cancelAmount);
//			break;
//		}
//		
//		case 3 : {
//			cancelAmount = paymentService.calRefundAmount(amount, PaymentDaySince.TWENTY);
//			chargeAmount = paymentService.calRefundAmount(bizHistoryRefundDto.getAdminHisCharge(), PaymentDaySince.TWENTY);
//			paymentService.refund(token, merchantUid, fortOne.getImpUid(), reason,  cancelAmount);
//			break;
//		}
//		
//		case 2 : {
//			cancelAmount = paymentService.calRefundAmount(amount, PaymentDaySince.ZERO);
//			chargeAmount = paymentService.calRefundAmount(bizHistoryRefundDto.getAdminHisCharge(), PaymentDaySince.ZERO);
//			paymentService.refund(token, merchantUid, fortOne.getImpUid(), reason,  cancelAmount);
//			break;
//		}
//		
//		case 1 : {
//			cancelAmount = paymentService.calRefundAmount(amount, PaymentDaySince.ZERO);
//			chargeAmount = paymentService.calRefundAmount(bizHistoryRefundDto.getAdminHisCharge(), PaymentDaySince.ZERO);
//			paymentService.refund(token, merchantUid, fortOne.getImpUid(), reason,  cancelAmount);
//			break;
//		}
//		case 0 : {
//			cancelAmount = paymentService.calRefundAmount(amount, PaymentDaySince.ZERO);
//			chargeAmount = paymentService.calRefundAmount(bizHistoryRefundDto.getAdminHisCharge(), PaymentDaySince.ZERO);
//			paymentService.refund(token, merchantUid, fortOne.getImpUid(), reason,  cancelAmount);
//			break;
//		}
//		default:
//			throw new CustomRestfulException(BizDefine.SERVER_ERROR_TO_REFUND, HttpStatus.INTERNAL_SERVER_ERROR);
//		}
		
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
	
	

}

