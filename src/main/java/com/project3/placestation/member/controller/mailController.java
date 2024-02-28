package com.project3.placestation.member.controller;

import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.project3.placestation.member.dto.RequestEmailDTO;
import com.project3.placestation.member.dto.ResponseEmailDTO;
import com.project3.placestation.service.MemberService;

import jakarta.mail.MessagingException;


@RequestMapping("/member/email")
@RestController
public class mailController {
    @Autowired
    private MemberService service;

    @Autowired
    private ResponseEmailDTO resDTO;
    
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
    public ResponseEmailDTO sendEamil(@RequestBody RequestEmailDTO dto, Model model){

    	int result = service.validEmail(dto.getEmail());
    	
    			
    	
    	resDTO.setResult(result);
    	
    	
    	
    	
    	String auth = generateVerificationCode();
    	
    	System.out.println("오스이메일 인증 컨트롤러: " + dto.toString());
    	//String auth = random.generateVerificationCode();
        String to = dto.getEmail(); 				
        String subject = "PlaceStation 회원가입 이메일 인증 입니다.";
        String text = "인증번호 < " + auth + " > 해당 6자리 숫자를 입력해 주세요";

        System.out.println("이메일 인증 호출 랜덤킴 생성: " + auth);
        
            
        	try {
				
        		service.sendEmail(to, subject, text);
        		
        		resDTO.setStatus(0);
        		
			} catch (MessagingException e) {

				e.printStackTrace();
				resDTO.setStatus(0);
			}

        	resDTO.setCode(auth);
          
            System.out.println("이메일 컨트롤러 리스폰스 디티오 투스트링: " +  resDTO.toString());
     
		
        return resDTO;

    }
    
    @PostMapping("/confirmEmail/{code}")
    public int confirmEmail(@PathVariable("code") String code) {
    	
    	System.out.println("이메일 컨트롤러 code: "+ code);
    	int result = service.confirmCodeByMail(code);
    	
    	System.out.println("result 이메일 컨트롤러: "+result);
    	
    	return result;
    }
    
    
    
    
}
