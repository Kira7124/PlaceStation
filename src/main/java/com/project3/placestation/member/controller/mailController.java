package com.project3.placestation.member.controller;

import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.project3.placestation.member.dto.RequestEmailDTO;
import com.project3.placestation.service.MemberService;


@RequestMapping("/member/email")
@RestController
public class mailController {
    @Autowired
    private MemberService service;

    
	// 이메일 인증 코드 생성 메서드
	public String generateVerificationCode() {
		// 6자리의 인증 코드 생성
		int codeLength = 5;
		StringBuilder sb = new StringBuilder();
		Random random = new Random();
		for (int i = 0; i < codeLength; i++) {
			// 0부터 9까지의 숫자 중에서 랜덤으로 선택하여 문자열에 추가
			sb.append(random.nextInt(10));
		}
		return sb.toString();
	}
    
    
    
    
    @PostMapping("/authEmail")
    public String sendEamil(@RequestBody RequestEmailDTO dto, Model model){

    	if(dto.getEmail() == null) {
    		
    		dto.setError("이메일을 입력해주세요");
    		
    		return dto.getError();
    	}
    	
    	int isEmail = service.validEmail(dto.getEmail());
    	
    	if(isEmail >= 1) {
    		
    		dto.setError("이미 존재하는 이메일 입니다. 새로운 이메일을 입력해 주세요");
    		
    		return dto.getEmail();
    	}
    	
    	
    	
    	String auth = generateVerificationCode();
    	
    	System.out.println("오스이메일 인증 컨트롤러: " + dto.toString());
    	//String auth = random.generateVerificationCode();
        String to = dto.getEmail(); 				
        String subject = "PlaceStation 회원가입 이메일 인증 입니다.";
        String text = "난수 6자리 출력해서 보내기 !!!!" + auth + "6자리 숫자를 입력해 주세요";

        System.out.println("이메일 인증 호출 랜덤킴 생성: " + auth);
        try {
            
        	service.sendEmail(to, subject, text);
            model.addAttribute("random", auth);
            
            return auth;
            
        } catch (Exception e) {
            
        	return "Error sending email: " + e.getMessage();
        	
        }
		

    }
}
