package com.project3.placestation.biz.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/biz/account")
public class BizAccountController {

	@GetMapping("/update-form")
	public String updateForm() {
		return "biz/account/biz_account_update";
	}
}
