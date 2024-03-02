package com.project3.placestation.party.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project3.placestation.biz.handler.exception.CustomLoginRestfulException;
import com.project3.placestation.biz.handler.exception.CustomRestfulException;
import com.project3.placestation.biz.model.util.BizDefine;
import com.project3.placestation.party.dto.PartyDto;
import com.project3.placestation.party.dto.PartyJoinReqDto;
import com.project3.placestation.payment.model.dto.PaymentMemberDto;
import com.project3.placestation.repository.entity.Member;
import com.project3.placestation.repository.entity.Party;
import com.project3.placestation.repository.entity.PartyAnnouncement;
import com.project3.placestation.service.ExchangeService;
import com.project3.placestation.service.MemberService;
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

		PartyDto dto = partyService.findById(partyNo);
		List<PartyAnnouncement> partyAnnouncement = announcementService.findAllJoinParty(partyNo);

		ExchangeService<Integer> exchangeService = new ExchangeService<>();
		String[] strArray = exchangeService.exchangeToArrayFromString(dto.getParcipationUserNo());

		List<PaymentMemberDto> memberDtos = new ArrayList<>();
		for (String i : strArray) {
			PaymentMemberDto member = memberService.findMemberById(Integer.valueOf(i));
			memberDtos.add(member);
		}

		model.addAttribute("party", dto);
		model.addAttribute("partyAnnouncement", partyAnnouncement);
		model.addAttribute("memberList", memberDtos);
		return "party/party_detail";
	}

	@PutMapping("/join")
	public String partyJoin(PartyJoinReqDto dto) {

		log.info(dto.toString());
		// 멤버 받기
		Member member = (Member) httpSession.getAttribute("member");
		if (member == null || member.getToken() == null || member.getToken().isEmpty()) {
			throw new CustomLoginRestfulException(BizDefine.ACCOUNT_IS_NONE, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		// 유효성 검사
//		if (dto.getParcipationUserNo() == null || dto.getParcipationUserNo().isEmpty()) {
//			log.info("1번 에러");
//			throw new CustomRestfulException(BizDefine.INTERVAL_SERVER_ERROR, HttpStatus.INTERNAL_SERVER_ERROR);
//		}
		if (dto.getUserNo() == null) {
			throw new CustomRestfulException(BizDefine.INTERVAL_SERVER_ERROR, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if (dto.getPartyNo() == null) {
			throw new CustomRestfulException(BizDefine.INTERVAL_SERVER_ERROR, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		

		// 인원 체크
		PartyDto party = partyService.findById(dto.getPartyNo());
		String[] peopleNo = dto.getParcipationUserNo().split(",");
		
		if (party.getPeopleCount() < peopleNo.length) {
			throw new CustomRestfulException(BizDefine.NO_VALID_JOIN, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		// 자신이 들어있는 모임인지 확인
		if (peopleNo.length > 0) {
			boolean validPeopleNo = Arrays.asList(peopleNo).contains(member.getUserno());
			if (validPeopleNo) {
				throw new CustomRestfulException(BizDefine.NO_VALID_JOIN, HttpStatus.INTERNAL_SERVER_ERROR);
			}
		}

		String join = "";
		if (dto.getIsJoin().equals("Y")) {
			if(dto.getParcipationUserNo().isEmpty() || dto.getParcipationUserNo() == null) {
				join = String.valueOf(dto.getUserNo());
			} else {
				join = dto.getParcipationUserNo() + "," + dto.getUserNo();
			}
		} else {
			// 다시 하기
			log.info("8번 에러");
			for (String i : peopleNo) {
				if (i.equals(String.valueOf(member.getUserno()))) {
					continue;
				}
				join += i + ",";
			}
			// 마지막 따옴표 제거
			if (join.isEmpty() == false) {
				join = join.substring(0, join.length() - 1);
			}
		}

		// 업데이트
		Party party2 = Party.builder().partyNo(party.getPartyNo()).parcipationUserNo(join).build();
		partyService.updateParcipationUserNoById(party2);
		return "redirect:/party/detail/" + dto.getPartyNo();
	}
}
