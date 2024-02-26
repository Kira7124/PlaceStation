package com.project3.placestation.payment.controller;

import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.HttpStatusCode;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.project3.placestation.payment.model.common.MemberGrade;
import com.project3.placestation.payment.model.dto.AdminHisPointDto;
import com.project3.placestation.payment.model.dto.PaymentDto;
import com.project3.placestation.payment.model.dto.PaymentFortOneKeyDto;
import com.project3.placestation.payment.model.dto.PaymentMemberDto;
import com.project3.placestation.payment.model.dto.PaymentReqDto;
import com.project3.placestation.product.dto.ProductInvalidDateDto;
import com.project3.placestation.repository.entity.Charge;
import com.project3.placestation.repository.entity.Company;
import com.project3.placestation.repository.entity.Grade;
import com.project3.placestation.service.AdminProdHistoryService;
import com.project3.placestation.service.BizService;
import com.project3.placestation.service.ChargeService;
import com.project3.placestation.service.CompanyService;
import com.project3.placestation.service.GradeService;
import com.project3.placestation.service.MemberService;
import com.project3.placestation.service.PaymentService;

import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
@RequestMapping("/payment")
public class PaymentRestController {

	@Autowired
	PaymentService paymentService;

	@Autowired
	AdminProdHistoryService adminProdHistoryService;

	@Autowired
	BizService bizService;

	@Autowired
	MemberService memberService;

	@Autowired
	GradeService gradeService;

	@Autowired
	ChargeService chargeService;

	@Autowired
	CompanyService companyService;

	/**
	 * 정보 저장하기 ( 수 정 필 요 ) 1. 포트원 결제 - 사후 처리 2. 서버 저장
	 * 
	 * @param paymentDto
	 * @return
	 */
	@PostMapping("/save")
	public ResponseEntity<?> paymentController(@RequestBody PaymentDto paymentDto) {
		try {

			// 사업자 포트원 키 가져오기
			PaymentFortOneKeyDto fortOne = bizService.findFortOneKeyByBizNo(paymentDto.getSellerId());
			if (fortOne.getImpKey() == null || fortOne.getImpKey().isEmpty()) {
				return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
			}
			if (fortOne.getImpSecret() == null || fortOne.getImpSecret().isEmpty()) {
				return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
			}
			if (fortOne.getImpUid() == null || fortOne.getImpUid().isEmpty()) {
				return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
			}

			// 포트원 결제 - 1. 토큰 정보 가져오기
			String token = paymentService.paymentGetToken(paymentDto, fortOne);
			// 포트원 결제 토큰 정보가 없다면
			if (token == null) {
				// 환불
				paymentService.refund(token, paymentDto.getMerchantUid(), fortOne.getImpUid(), "저장 중 서버 에러");
				return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
			}
			// 포트원 결제 - 2. 사후 검증하기
			PaymentReqDto result = paymentService.paymentInformationInquiry(paymentDto, token, fortOne);
			// 만약 사후 검증에 아무런 정보가 없다면
			if (result == null) {
				// 환불
				paymentService.refund(token, paymentDto.getMerchantUid(), fortOne.getImpUid(), "저장 중 서버 에러");
				return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
			}

			// 결제 후 예약이 먼저 되었는지 확인
			// 먼저 리스트를 불러온다.
			List<ProductInvalidDateDto> dateDtos = adminProdHistoryService
					.findProductInvalidByProdNo(paymentDto.getProdNo(), paymentDto.getPurchaseDate());

			// 시간 배열을 가져온다.
			int[] arrayOrder = adminProdHistoryService.conversionTime(paymentDto.getPurchaseDate(), dateDtos);

			// 시간이 중복되었는지 확인
			boolean validTime = adminProdHistoryService.validTime(arrayOrder, paymentDto.getStartTime(),
					paymentDto.getEndTime());

			// 만약 결제 도중 중복이 발생했다면
			if (validTime) {
				// 환불
				paymentService.refund(token, paymentDto.getMerchantUid(), fortOne.getImpUid(), "저장 시 서버 에러");
				return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
			}

			log.info("시간 중복 확인 DB 데이터 : " + Arrays.toString(arrayOrder));
			log.info("시간 중복 확인 ORDER 데이터 : " + paymentDto.getStartTime() + "시 ~ " + paymentDto.getEndTime() + "시");
			log.info("시간 중복 되면 Y , 안되면 N : " + validTime);

			// --------------------------------------------------------------------------

			// 서버에 저장 ( 수정 필요 )
			// 세개의 값을 구해야한다.

			// 유저 정보 ( 수정 필요 )
			int userNo = 1;
			PaymentMemberDto member = memberService.findMemberById(userNo);

			// 유저 등급별 discount (수정 필요)
			// grade 별 discount , savePoint 객체 불러오기
			Grade getGrade = gradeService.findByGradeName(member.getUserGrade());
			Charge getCharge = chargeService.findChPercent();

			int discount = getGrade.getGradeDiscount();
			int savePoint = getGrade.getGradeSavepoint();
			int charge = getCharge.getChPercent();

			// savePoint 계산
			int dbSavePoint = adminProdHistoryService.calPercentage(paymentDto.getAmount(), savePoint,
					paymentDto.getPeopleCount());
			// 할인율 계산
			int dbDiscount = adminProdHistoryService.calPercentage(paymentDto.getAmount(), discount,
					paymentDto.getPeopleCount());
			// 수수료 계산
			int dbCharge = adminProdHistoryService.calPercentage(paymentDto.getAmount(), charge,
					paymentDto.getPeopleCount());

			// 최종 금액 : 원래 금액 - (할인 금액 + 수수료 + 포인트)
			paymentDto.setAfterAmount(paymentDto.getAfterAmount() - dbCharge);

			// 거래 내역 DB 저장
			int dbResult = adminProdHistoryService.save(paymentDto.getMerchantUid(), paymentDto.getProdNo(),
					paymentDto.getAmount(), paymentDto.getAfterAmount(), paymentDto.getUsePoint(), dbSavePoint,
					dbDiscount, dbCharge, paymentDto.getProdName(), paymentDto.getSellerId(), paymentDto.getBuyerId(),
					result.getResponse().getPgProvider(), paymentDto.getStartTime(), paymentDto.getEndTime(),
					paymentDto.getPeopleCount(), paymentDto.getPurchaseDate(), token);

			if (dbResult == 0) {
				paymentService.refund(token, paymentDto.getMerchantUid(), fortOne.getImpUid(), "저장 시 서버 에러");
				return new ResponseEntity<>("결제 실패", HttpStatus.INTERNAL_SERVER_ERROR);
			}

			// 회사 balance 추가
			Company company = companyService.findCompany();
			log.info(company.toString());
			if (company == null) {
				paymentService.refund(token, paymentDto.getMerchantUid(), fortOne.getImpUid(), "저장 시 서버 에러");
				return new ResponseEntity<>("회사 balance 수정 실패 문의하세요.", HttpStatus.INTERNAL_SERVER_ERROR);
			}

			// 회사 balance 수정
			int resultCompany = companyService.updateSumCompanyBalance(company.getBalance(), dbCharge);
			if (resultCompany == 0) {
				paymentService.refund(token, paymentDto.getMerchantUid(), fortOne.getImpUid(), "저장 시 서버 에러");
				return new ResponseEntity<>("회사 balance 수정 실패 문의하세요.", HttpStatus.INTERNAL_SERVER_ERROR);
			}

			// 유저 정보 변경 - 포인트 정보 변경
			PaymentMemberDto memberDto = memberService.findMemberById(paymentDto.getBuyerId());

			// 유저의 포인트 게산
			int userPoint = memberService.calUserPoint(memberDto.getUserPoint(), dbSavePoint);

			// 유저 정보 변경 - 포인트 정보 변경
			AdminHisPointDto adminHisPointDto = adminProdHistoryService.findUserPointByBuyerId(paymentDto.getBuyerId());
			int setPoint = adminHisPointDto.getUserSavePoint() + userPoint;
			adminHisPointDto.setUserSavePoint(setPoint);

			// 등급 정보 가져오기
			List<Grade> listGrade = gradeService.findAll();

			log.info(adminHisPointDto.toString());
			// 없다는 것은 저장이 안됬다는 뜻
			if (adminHisPointDto == null) {
				paymentService.refund(token, paymentDto.getMerchantUid(), fortOne.getImpUid(), "저장 시 서버 에러");
				return new ResponseEntity<>("포인트는 관리자에게 문의하세요.", HttpStatus.INTERNAL_SERVER_ERROR);
			}
			// 없다는 것은 이전 저장이 잘못되었다는 것
			if (adminHisPointDto.getAdminHisBuyerId() == null || adminHisPointDto.getUserSavePoint() == null) {
				paymentService.refund(token, paymentDto.getMerchantUid(), fortOne.getImpUid(), "저장 시 서버 에러");
				return new ResponseEntity<>("포인트는 관리자에게 문의하세요.", HttpStatus.INTERNAL_SERVER_ERROR);
			}
			if (listGrade == null || listGrade.isEmpty()) {
				paymentService.refund(token, paymentDto.getMerchantUid(), fortOne.getImpUid(), "저장 시 서버 에러");
				return new ResponseEntity<>("포인트는 관리자에게 문의하세요.", HttpStatus.INTERNAL_SERVER_ERROR);
			}

			// 저장 데이터
			int resultGrade = 0;
			// min 값
			int gradeMinPrice = 0;
			for (Grade grade : listGrade) {
				// 유저의 포인트에 따라 차등 분류
				// 1. 브론즈
				if (grade.getGradeName().equals(MemberGrade.BRONZE.toString())) {
					log.info(MemberGrade.BRONZE.toString());
					log.info("gradeMinPrice" + gradeMinPrice);
					log.info("gradeMaxPrice" + grade.getGradeMaxprice());
					log.info("유저 포인트" + adminHisPointDto.getUserSavePoint());
					if (adminHisPointDto.getUserSavePoint() >= gradeMinPrice
							&& adminHisPointDto.getUserSavePoint() < grade.getGradeMaxprice()) {
						// 일반적인 브론즈 등급
						resultGrade = memberService.updateUserPoint(userPoint, MemberGrade.BRONZE,
								paymentDto.getBuyerId());
						// 리턴
						break;
					}
				}
				// 2. 실버
				else if (grade.getGradeName().equals(MemberGrade.SILVER.toString())) {
					log.info(MemberGrade.SILVER.toString());
					log.info("gradeMinPrice" + gradeMinPrice);
					log.info("gradeMaxPrice" + grade.getGradeMaxprice());
					log.info("유저 포인트" + adminHisPointDto.getUserSavePoint());
					if (adminHisPointDto.getUserSavePoint() >= gradeMinPrice
							&& adminHisPointDto.getUserSavePoint() < grade.getGradeMaxprice()) {
						// 일반적인 실버 등급
						resultGrade = memberService.updateUserPoint(userPoint, MemberGrade.SILVER,
								paymentDto.getBuyerId());
						// 리턴
						break;
					}
				}
				// 3. 골드
				else if (grade.getGradeName().equals(MemberGrade.GOLD.toString())) {
					log.info(MemberGrade.GOLD.toString());
					log.info("gradeMinPrice" + gradeMinPrice);
					log.info("gradeMaxPrice" + grade.getGradeMaxprice());
					log.info("유저 포인트" + adminHisPointDto.getUserSavePoint());
					if (adminHisPointDto.getUserSavePoint() >= gradeMinPrice) {
						// 일반적인 골드 등급
						resultGrade = memberService.updateUserPoint(userPoint, MemberGrade.GOLD,
								paymentDto.getBuyerId());
						// 리턴
						break;
					}
				}
				// 이전 GradeMaxPrice 는 다음의 gradeMinPrice 값
				gradeMinPrice = grade.getGradeMaxprice();
			}

			if (resultGrade == 0) {
				// 결제 완료인지 아닌지 판단.. (검증)
				paymentService.refund(token, paymentDto.getMerchantUid(), fortOne.getImpUid(), "저장 시 서버 에러");
				return new ResponseEntity<>("포인트는 관리자에게 문의하세요.", HttpStatus.INTERNAL_SERVER_ERROR);
			}

			// 결제 완료인지 아닌지 판단.. (검증)
			return new ResponseEntity<>("결제 완료", HttpStatus.OK);
		} catch (Exception e) {
			log.info(e.getMessage());
			return new ResponseEntity<>("결제 실패", HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	@PostMapping("/valid-time")
	public ResponseEntity<?> validTime(@RequestBody PaymentDto paymentDto) {
		try {
			// 결제 후 예약이 먼저 되었는지 확인
			// 먼저 리스트를 불러온다.
			List<ProductInvalidDateDto> dateDtos = adminProdHistoryService
					.findProductInvalidByProdNo(paymentDto.getProdNo(), paymentDto.getPurchaseDate());

			// 시간 배열을 가져온다.
			int[] arrayOrder = adminProdHistoryService.conversionTime(paymentDto.getPurchaseDate(), dateDtos);

			// 시간이 중복되었는지 확인
			boolean validTime = adminProdHistoryService.validTime(arrayOrder, paymentDto.getStartTime(),
					paymentDto.getEndTime());

			// 만약 결제 도중 중복이 발생했다면
			if (validTime) {
				return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
			}

			log.info("시간 중복 확인 DB 데이터 : " + Arrays.toString(arrayOrder));
			log.info("시간 중복 확인 ORDER 데이터 : " + paymentDto.getStartTime() + "시 ~ " + paymentDto.getEndTime() + "시");
			log.info("시간 중복 되면 Y , 안되면 N : " + validTime);
			return new ResponseEntity<>(HttpStatus.OK);
		} catch (Exception e) {
			log.info(e.getMessage());
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
	}

}
