package com.project3.placestation.party.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project3.placestation.biz.handler.exception.CustomLoginRestfulException;
import com.project3.placestation.biz.handler.exception.CustomRestfulException;
import com.project3.placestation.biz.model.dto.ResProductDto;
import com.project3.placestation.biz.model.util.BizDefine;
import com.project3.placestation.biz.model.util.PageReq;
import com.project3.placestation.biz.model.util.PageRes;
import com.project3.placestation.filedb.service.FiledbService;
import com.project3.placestation.party.dto.CreatePartyAnnouncementReqDto;
import com.project3.placestation.party.dto.CreatePartyReqDto;
import com.project3.placestation.party.dto.ParcipationUserDto;
import com.project3.placestation.party.dto.PartyDto;
import com.project3.placestation.party.dto.PartyJoinReqDto;
import com.project3.placestation.party.dto.ResCreatePartySelectDto;
import com.project3.placestation.party.dto.UpdatePartyReqDto;
import com.project3.placestation.repository.entity.AdminProdHistory;
import com.project3.placestation.repository.entity.Member;
import com.project3.placestation.repository.entity.Party;
import com.project3.placestation.repository.entity.PartyAnnouncement;
import com.project3.placestation.service.AdminProdHistoryService;
import com.project3.placestation.service.MemberService;
import com.project3.placestation.service.ParcipationPartyService;
import com.project3.placestation.service.PartyAnnouncementService;
import com.project3.placestation.service.PartyService;
import com.project3.placestation.service.ProductService;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/party")
public class PartyController {

	@Autowired
	PartyService partyService;

	@Autowired
	PartyAnnouncementService announcementService;

	@Autowired
	ParcipationPartyService parcipationPartyService;

	@Autowired
	MemberService memberService;

	@Autowired
	HttpSession httpSession;

	@Autowired
	AdminProdHistoryService adminProdHistoryService;

	@Autowired
	FiledbService filedbService;

	@Autowired
	ProductService productService;

	/**
	 * 모임 전체 조회 페이지
	 * 
	 * @param model
	 * @return
	 */
	@GetMapping("/main")
	public String partyMain(
			@RequestParam(value = "partyTitle" , defaultValue = "") String partyTitle,
			@RequestParam(value = "page" , defaultValue = "0") Integer page,
			@RequestParam(value = "size" , defaultValue = "16") Integer size,			
			Model model) {

		PageReq pageReq = new PageReq(page , size);
		
		// 전체 모임 배열
		List<Party> party = partyService.findAll(partyTitle , pageReq);
		// 전체 모임 카운트
		int count = partyService.countFindAll(partyTitle);
		PageRes<Party> pageRes = new PageRes<>(party , page , count , size);
		
		
		
		model.addAttribute("partyList", party);
		model.addAttribute("partyList", pageRes.getContent()); // 컨텐츠 배열
		model.addAttribute("currentPage", pageRes.getNumber()); // 현재 페이지
		model.addAttribute("totalPages", pageRes.getTotalPages()); // 전체 페이지 수
		model.addAttribute("totalItems", pageRes.getTotalElements()); // 전체 아이템 수
		model.addAttribute("startPage", pageRes.getStartPage()); // 시작 페이지
		model.addAttribute("endPage", pageRes.getEndPage()); // 종료 페이지 
		
		return "party/party_main";
	}

	@GetMapping("/detail/{partyNo}")
	public String partyDetail(@PathVariable(value = "partyNo") Integer partyNo, Model model) {

		PartyDto party = partyService.findById(partyNo);
		List<PartyAnnouncement> partyAnnouncement = announcementService.findAllJoinParty(partyNo);
		List<ParcipationUserDto> parcipationParties = parcipationPartyService.findAllById(partyNo);

		// 멤버 받기
		Member member = (Member) httpSession.getAttribute("member");
		boolean validJoin = false;
		if (member == null) {
			validJoin = false;
		} else {
			validJoin = parcipationPartyService.validMemberJoin(parcipationParties, member.getUserno());
		}

		// 만약 시간이 지났다면
		boolean validDate = false;
		if (partyService.validJoinTime(party.getPurchaseDate(), party.getStartTime())) {
			validDate = true;
		}

		model.addAttribute("party", party);
		model.addAttribute("partyAnnouncement", partyAnnouncement);
		model.addAttribute("parcipationParties", parcipationParties);
		model.addAttribute("validJoin", validJoin);
		model.addAttribute("validDate", validDate);
		return "party/party_detail";
	}

	@PostMapping("/join")
	public String partyJoin(PartyJoinReqDto dto) {

		log.info(dto.toString());
		// 1.유효성 검사
		Member member = (Member) httpSession.getAttribute("member");
		if (member == null) {
			throw new CustomLoginRestfulException(BizDefine.ACCOUNT_IS_NONE, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		// 유효성 검사
		if (dto.getPartyNo() == null) {
			throw new CustomRestfulException(BizDefine.INTERVAL_SERVER_ERROR, HttpStatus.INTERNAL_SERVER_ERROR);
		}

		// 모임이 있는지 확인
		PartyDto party = partyService.findById(dto.getPartyNo());

		log.info(party.toString());
		if (party == null || party.getPartyNo() == null) {
			throw new CustomRestfulException(BizDefine.PARCIPATION_PARTY_NOTHING_FOUND,
					HttpStatus.INTERNAL_SERVER_ERROR);
		}
		List<ParcipationUserDto> parcipationParties = parcipationPartyService.findAllById(dto.getPartyNo());
		// 모임의 자리 수 확인
		// -1은 자기 자신 (host) 제외
		if (party.getPartyMaximumPeople() <= parcipationParties.size() - 1) {
			throw new CustomRestfulException(BizDefine.NO_VALID_JOIN, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		// 만약 시간이 지났다면
		if (partyService.validJoinTime(party.getPurchaseDate(), party.getStartTime())) {
			throw new CustomRestfulException(BizDefine.NO_VALID_PARTY_DATE, HttpStatus.INTERNAL_SERVER_ERROR);
		}

		// 모임 참가
		parcipationPartyService.save(dto.getPartyNo(), member.getUserno());

		return "redirect:/party/detail/" + dto.getPartyNo();
	}

	@DeleteMapping("/delete-join")
	public String partyDeleteJoin(PartyJoinReqDto dto) {
		log.info(dto.toString());
		// 1.유효성 검사
		Member member = (Member) httpSession.getAttribute("member");
		if (member == null) {
			throw new CustomLoginRestfulException(BizDefine.ACCOUNT_IS_NONE, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		// 유효성 검사
		if (dto.getPartyNo() == null) {
			throw new CustomRestfulException(BizDefine.INTERVAL_SERVER_ERROR, HttpStatus.INTERNAL_SERVER_ERROR);
		}

		// 모임이 있는지 확인
		PartyDto party = partyService.findById(dto.getPartyNo());
		// 파티가 없다면
		log.info(party.toString());
		if (party == null || party.getPartyNo() == null) {
			throw new CustomRestfulException(BizDefine.PARCIPATION_PARTY_NOTHING_FOUND,
					HttpStatus.INTERNAL_SERVER_ERROR);
		}
		// 만약 시간이 지났다면
		if (partyService.validJoinTime(party.getPurchaseDate(), party.getStartTime())) {
			throw new CustomRestfulException(BizDefine.NO_VALID_PARTY_DATE, HttpStatus.INTERNAL_SERVER_ERROR);
		}

		// 모임 불참가
		parcipationPartyService.deleteParty(dto.getPartyNo(), member.getUserno());
		return "redirect:/party/detail/" + dto.getPartyNo();

	}

	// 모임 생성 페이지
	@GetMapping("/select-create")
	public String partySelectCreateForm(Model model, @RequestParam(value = "page", defaultValue = "0") int page,
			@RequestParam(value = "size", defaultValue = "16") int size,
			@RequestParam(value = "text", defaultValue = "") String text) {

		// 1.유효성 검사
		Member member = (Member) httpSession.getAttribute("member");
		if (member == null) {
			throw new CustomLoginRestfulException(BizDefine.ACCOUNT_IS_NONE, HttpStatus.INTERNAL_SERVER_ERROR);
		}

		// 페이징 처리 객체
		PageReq pageReq = new PageReq(page, size);
		// 모임 생성이 가능한 객체 배열
		List<ResCreatePartySelectDto> list = adminProdHistoryService.findAllByUserNo(member.getUserno(), text, pageReq);

		// 페이징 처리 카운트
		int count = adminProdHistoryService.countFindAllByUserNo(member.getUserno(), text);
		PageRes<ResCreatePartySelectDto> pageRes = new PageRes<>(list, page, count, size);

		log.info(list.toString());
		model.addAttribute("partyList", pageRes.getContent()); // 컨텐츠 배열
		model.addAttribute("currentPage", pageRes.getNumber()); // 컨텐츠 배열
		model.addAttribute("totalPages", pageRes.getTotalPages()); // 컨텐츠 배열
		model.addAttribute("totalItems", pageRes.getTotalElements()); // 컨텐츠 배열
		model.addAttribute("startPage", pageRes.getStartPage()); // 컨텐츠 배열
		model.addAttribute("endPage", pageRes.getEndPage()); // 컨텐츠 배열
		model.addAttribute("text", text); // 컨텐츠 배열
		model.addAttribute("size", size); // 컨텐츠 배열
		return "party/party_select_create";
	}

	// 모임 생성 페이지
	@GetMapping("/create")
	public String partyCreateForm(@RequestParam(value = "adminHisNo") String adminHisNo,
			@RequestParam(value = "prodNo") Integer prodNo, Model model) {
		// 1.유효성 검사
		Member member = (Member) httpSession.getAttribute("member");
		if (member == null) {
			throw new CustomLoginRestfulException(BizDefine.ACCOUNT_IS_NONE, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if (adminHisNo == null || adminHisNo.isEmpty()) {
			throw new CustomLoginRestfulException(BizDefine.SERVER_ERROR, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if (prodNo < 0 || prodNo == null) {
			throw new CustomLoginRestfulException(BizDefine.SERVER_ERROR, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		// 2. 유효성 검사
		// 거래 내역이 있는지
		// 상품이 아직 남아 있는지
		if (!adminProdHistoryService.existById(adminHisNo)) {
			throw new CustomLoginRestfulException(BizDefine.NO_VALID_PARTY_CREATE, HttpStatus.BAD_REQUEST);
		}
		int existProduct = productService.existById(prodNo);
		if (existProduct == 0) {
			throw new CustomLoginRestfulException(BizDefine.NO_SEARCH_PRODUCT, HttpStatus.BAD_REQUEST);
		}
		// 해당 모임이 있는지 확인
		if (partyService.existByUserNoAndProdNoAndAdminHisNo(member.getUserno(), prodNo, adminHisNo)) {
			throw new CustomLoginRestfulException(BizDefine.PARTY_CREATE_ALREADY_DONE, HttpStatus.BAD_REQUEST);
		}


		AdminProdHistory adminProdHistory = adminProdHistoryService.findByAdminHisNo(adminHisNo);
		ResProductDto product = productService.findById(prodNo);

		model.addAttribute("adminProdHistory", adminProdHistory);
		model.addAttribute("product", product);
		return "party/party_create";
	}

	@PostMapping("/create")
	public String createParty(CreatePartyReqDto createPartyReqDto) {
		log.info(createPartyReqDto.toString());

		// 1.유효성 검사
		Member member = (Member) httpSession.getAttribute("member");
		if (member == null) {
			throw new CustomLoginRestfulException(BizDefine.ACCOUNT_IS_NONE, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if (createPartyReqDto.getAdminHisNo() == null || createPartyReqDto.getAdminHisNo().isEmpty()) {
			throw new CustomRestfulException(BizDefine.SERVER_ERROR, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if (createPartyReqDto.getProductNo() < 0 || createPartyReqDto.getProductNo() == null) {
			throw new CustomRestfulException(BizDefine.SERVER_ERROR, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if (createPartyReqDto.getPartyTitle() == null || createPartyReqDto.getPartyTitle().isEmpty()) {
			throw new CustomRestfulException(BizDefine.PLEASE_WRITE_TITLE, HttpStatus.BAD_REQUEST);
		}
		if (createPartyReqDto.getPartyDescription() == null || createPartyReqDto.getPartyDescription().isEmpty()) {
			throw new CustomRestfulException(BizDefine.PLEASE_WRITE_DESCRIPTION, HttpStatus.BAD_REQUEST);
		}
		if (createPartyReqDto.getPartyMaximumPeople() == null || createPartyReqDto.getPartyMaximumPeople() < 1) {
			throw new CustomRestfulException(BizDefine.SERVER_ERROR, HttpStatus.BAD_REQUEST);
		}
		// 2. 유효성 검사
		// 거래 내역이 있는지
		// 상품이 아직 남아 있는지
		if (!adminProdHistoryService.existById(createPartyReqDto.getAdminHisNo())) {
			throw new CustomRestfulException(BizDefine.NO_VALID_PARTY_CREATE, HttpStatus.BAD_REQUEST);
		}
		int existProduct = productService.existById(createPartyReqDto.getProductNo());
		if (existProduct == 0) {
			throw new CustomLoginRestfulException(BizDefine.NO_SEARCH_PRODUCT, HttpStatus.BAD_REQUEST);
		}
		// 사람 인원 수가 넘지 않은지 검사
		AdminProdHistory adminProdHistory = adminProdHistoryService.findByAdminHisNo(createPartyReqDto.getAdminHisNo());
		if (adminProdHistory.getPeopleCount() < createPartyReqDto.getPartyMaximumPeople()) {
			throw new CustomRestfulException(BizDefine.NO_VALID_PEOPLE, HttpStatus.BAD_REQUEST);
		}
		// 해당 모임이 있는지 확인
		if (partyService.existByUserNoAndProdNoAndAdminHisNo(member.getUserno(), createPartyReqDto.getProductNo(),
				createPartyReqDto.getAdminHisNo())) {
			throw new CustomRestfulException(BizDefine.PARTY_CREATE_ALREADY_DONE, HttpStatus.BAD_REQUEST);
		}

		// 파일 저장
		String filePath = filedbService.saveFiles(createPartyReqDto.getFile());
		Party party = Party.builder().partyTitle(createPartyReqDto.getPartyTitle())
				.productNo(createPartyReqDto.getProductNo()).partyDescription(createPartyReqDto.getPartyDescription())
				.partyHost(member.getUserno()).partyMaximumPeople(createPartyReqDto.getPartyMaximumPeople())
				.filePath(filePath).adminHisNo(createPartyReqDto.getAdminHisNo()).build();
		// 모임 저장
		int result = partyService.save(party);
		if (result == 0) {
			throw new CustomRestfulException(BizDefine.SERVER_ERROR, HttpStatus.INTERNAL_SERVER_ERROR);
		}

		return "redirect:/party/main";
	}

	// 모임 업데이트 페이지
	@GetMapping("/update/{partyNo}")
	public String partyUpdateForm(@PathVariable(value = "partyNo") Integer partyNo, Model model) {
		// 1.유효성 검사
		Member member = (Member) httpSession.getAttribute("member");
		if (member == null) {
			throw new CustomLoginRestfulException(BizDefine.ACCOUNT_IS_NONE, HttpStatus.INTERNAL_SERVER_ERROR);
		}

		PartyDto dto = partyService.findById(partyNo);
		if (dto == null) {
			throw new CustomRestfulException(BizDefine.SERVER_ERROR, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if (dto.getPartyHost() != member.getUserno()) {
			throw new CustomRestfulException(BizDefine.NO_AUTHORITY, HttpStatus.BAD_REQUEST);
		}
		if(partyService.validJoinTime(dto.getPurchaseDate(), dto.getStartTime())) {
			throw new CustomRestfulException(BizDefine.WRONG_REQUEST, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		

		model.addAttribute("party", dto);
		return "party/party_update";
	}

	@PutMapping("/update")
	public String updateParty(UpdatePartyReqDto updatePartyReqDto) {
		log.info(updatePartyReqDto.toString());

		// 1.유효성 검사
		Member member = (Member) httpSession.getAttribute("member");
		if (member == null) {
			throw new CustomLoginRestfulException(BizDefine.ACCOUNT_IS_NONE, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if (updatePartyReqDto.getPartyTitle() == null || updatePartyReqDto.getPartyTitle().isEmpty()) {
			throw new CustomRestfulException(BizDefine.PLEASE_WRITE_TITLE, HttpStatus.BAD_REQUEST);
		}
		if (updatePartyReqDto.getPartyDescription() == null || updatePartyReqDto.getPartyDescription().isEmpty()) {
			throw new CustomRestfulException(BizDefine.PLEASE_WRITE_DESCRIPTION, HttpStatus.BAD_REQUEST);
		}
		if (updatePartyReqDto.getPartyMaximumPeople() == null || updatePartyReqDto.getPartyMaximumPeople() < 1) {
			throw new CustomRestfulException(BizDefine.SERVER_ERROR, HttpStatus.BAD_REQUEST);
		}
		PartyDto dto = partyService.findById(updatePartyReqDto.getPartyNo());
		if(partyService.validJoinTime(dto.getPurchaseDate(), dto.getStartTime())) {
			throw new CustomRestfulException(BizDefine.WRONG_REQUEST, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		// 사람 인원 수가 넘지 않은지 검사
		if (updatePartyReqDto.getPartyMaximumPeople() > dto.getPartyMaximumPeople()) {
			throw new CustomRestfulException(BizDefine.NO_VALID_PEOPLE, HttpStatus.BAD_REQUEST);
		}
		
		// 파일 저장
		String filePath = "";
		if (updatePartyReqDto.getIsFileChange().equals("true")) {
			filePath = filedbService.saveFiles(updatePartyReqDto.getFile());
		}

		Party party = Party.builder().partyNo(updatePartyReqDto.getPartyNo())
				.partyTitle(updatePartyReqDto.getPartyTitle()).partyDescription(updatePartyReqDto.getPartyDescription())
				.partyHost(member.getUserno()).partyMaximumPeople(updatePartyReqDto.getPartyMaximumPeople())
				.filePath(filePath).build();
		// 모임 수정
		int result = partyService.update(party, updatePartyReqDto.getIsFileChange());
		if (result == 0) {
			throw new CustomRestfulException(BizDefine.SERVER_ERROR, HttpStatus.INTERNAL_SERVER_ERROR);
		}

		return "redirect:/party/main";
	}

	@DeleteMapping("/delete/{partyNo}")
	public String deleteParty(@PathVariable(value = "partyNo") Integer partyNo) {
		// 1.유효성 검사
		Member member = (Member) httpSession.getAttribute("member");
		if (member == null) {
			throw new CustomLoginRestfulException(BizDefine.ACCOUNT_IS_NONE, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		PartyDto dto = partyService.findById(partyNo);
		if(dto == null) {
			throw new CustomRestfulException(BizDefine.NO_SEARCH_PARTY, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		if(member.getUserno() != dto.getUserno()) {
			throw new CustomRestfulException(BizDefine.NO_AUTHORITY, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(partyService.validJoinTime(dto.getPurchaseDate(), dto.getStartTime())) {
			throw new CustomRestfulException(BizDefine.WRONG_REQUEST, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		int result = partyService.delete(partyNo);
		if(result == 0) {
			throw new CustomRestfulException(BizDefine.INTERVAL_SERVER_ERROR, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return "redirect:/party/main";
	}
}
