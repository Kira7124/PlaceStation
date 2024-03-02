package com.project3.placestation.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.project3.placestation.service.MemberService;

import lombok.extern.log4j.Log4j2;

@Log4j2
@RestController
@RequestMapping("/member/check")
public class memberChekcController {

	  	@Autowired
	    private MemberService memberService;

	  	// 유저 아이디
	    @GetMapping("/uid/{uid}")
	    public int checkUid(@PathVariable("uid") String uid){
	    	int isUid = memberService.validUid(uid);
	    	
	    	System.out.println("isUid 검증 컨트롤러: "+isUid);
	    	
	        return isUid;
	    }

	    // 유저 전화번호
	    @GetMapping("/hp/{hp}")
	    public int checkHp(@PathVariable("hp") String hp){
	        log.info("hp : "+hp);
	        log.info("hp : "+memberService.validHp(hp));
	        return memberService.validHp(hp);
	    }
	    
	    // 사업자 전화번호
	    @GetMapping("/managerHp/{managerHp}")
	    public int checkManagerHp(@PathVariable("managerHp") String managerHp){
	        int result = memberService.validManagerHp(managerHp);
	        return result;
	    }
	
}
