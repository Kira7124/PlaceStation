package com.project3.placestation.biz.controller.restController;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.project3.placestation.biz.model.dto.ReqPassword;
import com.project3.placestation.biz.model.dto.ResPassword;
import com.project3.placestation.biz.model.util.BizDefine;
import com.project3.placestation.repository.entity.Member;
import com.project3.placestation.service.MemberService;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
@RequestMapping("/biz")
public class BizAccountRestController {

	@Autowired
	MemberService memberService;

	@Autowired
	HttpSession httpSession;
	
	@Autowired
	PasswordEncoder encoder;
	
	@PostMapping("/account/password-check")
	public ResponseEntity<?> passwordCheck(@RequestBody ReqPassword currentPassword) {
		try {
			
			// 멤버 받기
			Member member = (Member) httpSession.getAttribute("member"); 
			if(member == null) {
				return new ResponseEntity<>(false , HttpStatus.BAD_REQUEST);
			}
			
			// 우효성 검사
			log.info(currentPassword.toString());
			if(currentPassword.getPassword() == null || currentPassword.getPassword().isEmpty()) {
				return new ResponseEntity<>(BizDefine.DATA_IS_NOTHING ,HttpStatus.BAD_REQUEST);
			}
			
			// 서버에서 정보 받기
			int bizId = member.getUserno();
			ResPassword dbPassword = memberService.BizFindCurrentPassword(bizId);
			log.info(dbPassword.toString());
			
			if(encoder.matches(currentPassword.getPassword() , dbPassword.getPassword())) {
				return new ResponseEntity<>(true,HttpStatus.ACCEPTED);
			}
			return new ResponseEntity<>(false,HttpStatus.BAD_REQUEST);
		} catch (Exception e) {
			return new ResponseEntity<>(false , HttpStatus.BAD_REQUEST);
		}
	}
}
