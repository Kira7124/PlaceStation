package com.project3.placestation.party.controller;

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
import com.project3.placestation.biz.model.util.BizDefine;
import com.project3.placestation.filedb.service.FiledbService;
import com.project3.placestation.party.dto.CreatePartyAnnouncementReqDto;
import com.project3.placestation.party.dto.PartyDto;
import com.project3.placestation.repository.entity.Member;
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
public class PartyAnnouncementController {

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

	// 모임 공지사항 페이지
	@GetMapping("/announcement/{announcementNo}")
	public String partyAnnouncement(@PathVariable(value = "announcementNo") Integer announcementNo, Model model) {

		// 1.유효성 검사
		Member member = (Member) httpSession.getAttribute("member");
		if (member == null || member.getToken() == null || member.getToken().isEmpty()) {
			throw new CustomLoginRestfulException(BizDefine.ACCOUNT_IS_NONE, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		// 해당 공지사항의 접근권한
		// 공지사항
		PartyAnnouncement announcement = announcementService.findById(announcementNo);

		if (announcement == null) {
			throw new CustomRestfulException(BizDefine.NO_SEARCH_ANNOUNCEMENT, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		PartyDto party = partyService.findById(announcement.getPartyNo());
		int result = parcipationPartyService.validByUserNoAndPartyNo(announcement.getPartyNo(), member.getUserno());
		if (result == 0 && party.getPartyHost() != member.getUserno()) {
			throw new CustomRestfulException(BizDefine.VALID_PARCIPATION_PARTY, HttpStatus.BAD_REQUEST);
		}

		model.addAttribute("announcement", announcement);
		model.addAttribute("party", party);
		return "party/party_announcement";

	}

	// 공지사항 작성 페이지
	@GetMapping("/announcement/create")
	public String partyAnnouncementCreateForm(@RequestParam(value = "party-no") Integer partyNo, Model model) {
		// 1.유효성 검사
		Member member = (Member) httpSession.getAttribute("member");
		if (member == null || member.getToken() == null || member.getToken().isEmpty()) {
			throw new CustomLoginRestfulException(BizDefine.ACCOUNT_IS_NONE, HttpStatus.INTERNAL_SERVER_ERROR);
		}

		PartyDto party = partyService.findById(partyNo);
		if (party.getPartyHost() != member.getUserno()) {
			throw new CustomRestfulException(BizDefine.NO_AUTHORITY, HttpStatus.BAD_REQUEST);
		}

		model.addAttribute("party", party);
		return "party/party_announcement_create";
	}

	// 공지사항 저장
	@PostMapping("/announcement/create")
	public String partyAnnouncementCreate(CreatePartyAnnouncementReqDto announcementReqDto) {

		// 1.유효성 검사
		Member member = (Member) httpSession.getAttribute("member");
		if (member == null || member.getToken() == null || member.getToken().isEmpty()) {
			throw new CustomLoginRestfulException(BizDefine.ACCOUNT_IS_NONE, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if (announcementReqDto.getPartyAnnouncementTitle() == null
				|| announcementReqDto.getPartyAnnouncementTitle().isEmpty()) {
			throw new CustomRestfulException(BizDefine.PLEASE_WRITE_TITLE, HttpStatus.BAD_REQUEST);
		}
		if (announcementReqDto.getPartyAnnouncementTitle() == null
				|| announcementReqDto.getPartyAnnouncementTitle().isEmpty()) {
			throw new CustomRestfulException(BizDefine.PLEASE_WRITE_DESCRIPTION, HttpStatus.BAD_REQUEST);
		}
		// 호스트 와 같은지 확인
		PartyDto party = partyService.findById(announcementReqDto.getPartyNo());
		if (party.getPartyHost() != member.getUserno()) {
			throw new CustomRestfulException(BizDefine.NO_AUTHORITY, HttpStatus.BAD_REQUEST);
		}

		// 공지사항 저장
		PartyAnnouncement announcement = PartyAnnouncement.builder().partyNo(announcementReqDto.getPartyNo())
				.partyAnnouncementTitle(announcementReqDto.getPartyAnnouncementTitle())
				.partyAnnouncementDescription(announcementReqDto.getPartyAnnouncementDescription()).build();
		announcementService.save(announcement);

		return "redirect:/party/detail/" + announcementReqDto.getPartyNo();
	}

	// 공지사항 수정 폼 이동
	@GetMapping("/announcement/update")
	public String partyAnnouncementUpdateForm(@RequestParam(value = "announcement-no") Integer announcementNo,
			Model model) {
		// 1.유효성 검사
		Member member = (Member) httpSession.getAttribute("member");
		if (member == null || member.getToken() == null || member.getToken().isEmpty()) {
			throw new CustomLoginRestfulException(BizDefine.ACCOUNT_IS_NONE, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		PartyAnnouncement announcement = announcementService.findById(announcementNo);
		if (announcement == null) {
			throw new CustomRestfulException(BizDefine.NO_SEARCH_ANNOUNCEMENT, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		PartyDto party = partyService.findById(announcement.getPartyNo());
		if (party.getPartyHost() != member.getUserno()) {
			throw new CustomRestfulException(BizDefine.NO_AUTHORITY, HttpStatus.BAD_REQUEST);
		}

		model.addAttribute("announcement", announcement);
		return "party/party_announcement_update";
	}

	// 공지사항 수정
	@PutMapping("/announcement/update")
	public String partyAnnouncementUpdate(CreatePartyAnnouncementReqDto announcementReqDto) {

		// 1.유효성 검사
		Member member = (Member) httpSession.getAttribute("member");
		if (member == null || member.getToken() == null || member.getToken().isEmpty()) {
			throw new CustomLoginRestfulException(BizDefine.ACCOUNT_IS_NONE, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if (announcementReqDto.getPartyAnnouncementNo() == null || announcementReqDto.getPartyAnnouncementNo() < 1) {
			throw new CustomRestfulException(BizDefine.INTERVAL_SERVER_ERROR, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if (announcementReqDto.getPartyAnnouncementTitle() == null
				|| announcementReqDto.getPartyAnnouncementTitle().isEmpty()) {
			throw new CustomRestfulException(BizDefine.PLEASE_WRITE_TITLE, HttpStatus.BAD_REQUEST);
		}
		if (announcementReqDto.getPartyAnnouncementTitle() == null
				|| announcementReqDto.getPartyAnnouncementTitle().isEmpty()) {
			throw new CustomRestfulException(BizDefine.PLEASE_WRITE_DESCRIPTION, HttpStatus.BAD_REQUEST);
		}
		PartyAnnouncement announcementEntity = announcementService.findById(announcementReqDto.partyAnnouncementNo);
		if (announcementEntity == null) {
			throw new CustomRestfulException(BizDefine.NO_SEARCH_ANNOUNCEMENT, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		PartyDto party = partyService.findById(announcementEntity.getPartyNo());
		if (party.getPartyHost() != member.getUserno()) {
			throw new CustomRestfulException(BizDefine.NO_AUTHORITY, HttpStatus.BAD_REQUEST);
		}

		// 수정
		PartyAnnouncement announcement = PartyAnnouncement.builder()
				.partyAnnouncementNo(announcementReqDto.getPartyAnnouncementNo())
				.partyAnnouncementTitle(announcementReqDto.getPartyAnnouncementTitle())
				.partyAnnouncementDescription(announcementReqDto.getPartyAnnouncementDescription()).build();

		announcementService.update(announcement);

		return "redirect:/party/announcement/" + announcement.getPartyAnnouncementNo();
	}

	@DeleteMapping("/announcement/delete/{announcementNo}")
	public String partyAnnouncementDelete(@PathVariable(value = "announcementNo") Integer announcementNo) {
		// 1.유효성 검사
		Member member = (Member) httpSession.getAttribute("member");
		if (member == null || member.getToken() == null || member.getToken().isEmpty()) {
			throw new CustomLoginRestfulException(BizDefine.ACCOUNT_IS_NONE, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if (announcementNo == null || announcementNo < 1) {
			throw new CustomRestfulException(BizDefine.INTERVAL_SERVER_ERROR, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		PartyAnnouncement announcementEntity = announcementService.findById(announcementNo);
		if (announcementEntity == null) {
			throw new CustomRestfulException(BizDefine.NO_SEARCH_ANNOUNCEMENT, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		PartyDto party = partyService.findById(announcementEntity.getPartyNo());
		if (party.getPartyHost() != member.getUserno()) {
			throw new CustomRestfulException(BizDefine.NO_AUTHORITY, HttpStatus.BAD_REQUEST);
		}

		// 공지사항 삭제
		announcementService.delete(announcementNo);

		return "redirect:/party/detail/" + announcementEntity.getPartyNo();

	}
}
