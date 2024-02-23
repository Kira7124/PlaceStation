package com.project3.placestation.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/member")
@Controller
public class memberController {

	
	@GetMapping("/login")
	public String login() {
		
		return "/member/login";
	}
	
	
}
