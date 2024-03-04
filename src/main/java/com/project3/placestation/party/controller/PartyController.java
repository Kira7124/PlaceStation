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

import com.project3.placestation.biz.handler.exception.CustomLoginRestfulException;
import com.project3.placestation.biz.handler.exception.CustomRestfulException;
import com.project3.placestation.biz.model.util.BizDefine;
import com.project3.placestation.party.dto.ParcipationUserDto;
import com.project3.placestation.party.dto.PartyDto;
import com.project3.placestation.party.dto.PartyJoinReqDto;
import com.project3.placestation.repository.entity.Member;
import com.project3.placestation.repository.entity.Party;
import com.project3.placestation.repository.entity.PartyAnnouncement;
import com.project3.placestation.service.MemberService;
import com.project3.placestation.service.ParcipationPartyService;
import com.project3.placestation.service.PartyAnnouncementService;
import com.project3.placestation.service.PartyService;

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

	/**
	 * 모임 전체 조회 페이지
	 * 
	 * @param model
	 * @return
	 */
	@GetMapping("/main")
	public String partyMain(Model model) {

		List<Party> party = partyService.findAll();

		model.addAttribute("partyList", party);
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
		if (member == null || member.getToken() == null || member.getToken().isEmpty()) {
			validJoin = false;
		} else {
			validJoin = parcipationPartyService.validMemberJoin(parcipationParties, member.getUserno());
		}
		
		// 만약 시간이 지났다면
		boolean validDate = false;
		if(partyService.validJoinTime(party.getPurchaseDate(), party.getStartTime())) {
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
		// 멤버 받기
		Member member = (Member) httpSession.getAttribute("member");
		if (member == null || member.getToken() == null || member.getToken().isEmpty()) {
			throw new CustomLoginRestfulException(BizDefine.ACCOUNT_IS_NONE, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		// 유효성 검사
		if (dto.getPartyNo() == null) {
			throw new CustomRestfulException(BizDefine.INTERVAL_SERVER_ERROR, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		// 모임이 있는지 확인
		PartyDto party = partyService.findById(dto.getPartyNo());
		
		log.info(party.toString());
		if(party == null || party.getPartyNo() == null) {
			throw new CustomRestfulException(BizDefine.PARCIPATION_PARTY_NOTHING_FOUND, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		List<ParcipationUserDto> parcipationParties = parcipationPartyService.findAllById(dto.getPartyNo());
		// 모임의 자리 수 확인
		if(party.getPartyMaximumPeople() <= parcipationParties.size()) {
			throw new CustomRestfulException(BizDefine.NO_VALID_JOIN, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		// 만약 시간이 지났다면
		if(partyService.validJoinTime(party.getPurchaseDate(), party.getStartTime())) {
			throw new CustomRestfulException(BizDefine.NO_VALID_PARTY_DATE, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		// 모임 참가
		parcipationPartyService.save(dto.getPartyNo(), member.getUserno());
		
		return "redirect:/party/detail/" + dto.getPartyNo();
	}
	
	@DeleteMapping("/delete-join")
	public String partyDeleteJoin(PartyJoinReqDto dto) {
		log.info(dto.toString());
		// 멤버 받기
		Member member = (Member) httpSession.getAttribute("member");
		if (member == null || member.getToken() == null || member.getToken().isEmpty()) {
			throw new CustomLoginRestfulException(BizDefine.ACCOUNT_IS_NONE, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		// 유효성 검사
		if (dto.getPartyNo() == null) {
			throw new CustomRestfulException(BizDefine.INTERVAL_SERVER_ERROR, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		// 모임이 있는지 확인
		PartyDto party = partyService.findById(dto.getPartyNo());
		
		log.info(party.toString());
		if(party == null || party.getPartyNo() == null) {
			throw new CustomRestfulException(BizDefine.PARCIPATION_PARTY_NOTHING_FOUND, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		// 만약 시간이 지났다면
		if(partyService.validJoinTime(party.getPurchaseDate(), party.getStartTime())) {
			throw new CustomRestfulException(BizDefine.NO_VALID_PARTY_DATE, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		// 모임 불참가
		parcipationPartyService.deleteParty(dto.getPartyNo(), member.getUserno());
		return "redirect:/party/detail/" + dto.getPartyNo();
	}
}
