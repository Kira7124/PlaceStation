package com.project3.placestation.party.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project3.placestation.party.dto.PartyDto;
import com.project3.placestation.repository.entity.Party;
import com.project3.placestation.service.PartyService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/party")
public class PartyController {

	@Autowired
	PartyService partyService;

	/**
	 * 모임 전체 조회 페이지
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
	public String partyDetail(@PathVariable(value = "partyNo") Integer partyNo , Model model) {
		
		PartyDto dto = partyService.findById(partyNo);
		
		model.addAttribute("party" , dto);
		return "party/party_detail";
	}
}
