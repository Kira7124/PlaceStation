package com.project3.placestation.member.controller;

import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.project3.placestation.member.dto.RequestEmailDTO;
import com.project3.placestation.member.dto.ResoponseEmailDto;
import com.project3.placestation.service.MemberService;

import jakarta.mail.MessagingException;
import lombok.extern.log4j.Log4j2;


@Log4j2
@RequestMapping("/user/email")
@RestController
public class mailController {

	@Autowired
	private MemberService service;


    
	// 이메일 인증 코드 생성 메서드
	public String generateVerificationCode() {
		// 6자리의 인증 코드 생성
		int codeLength = 6;
		StringBuilder sb = new StringBuilder();
		Random random = new Random();
		for (int i = 0; i < codeLength; i++) {
			// 0부터 9까지의 숫자 중에서 랜덤으로 선택하여 문자열에 추가
			sb.append(random.nextInt(10));
		}
		return sb.toString();
	}
    
    
    
    
    @PostMapping("/authEmail")
    public ResoponseEmailDto sendEamil(@RequestBody RequestEmailDTO dto){

    	System.out.println("컨트롤러 난수 요청 이메일 디티오 투스트링: "+dto.toString());
    	System.out.println("컨트롤러 난수 요청 이메일 디티오 투스트링: "+dto.getEmail());
    	
    	ResoponseEmailDto resEDto = new ResoponseEmailDto();
    	
    	
    	int result = service.validEmail(dto.getEmail());
    	
    	System.out.println("컨트롤러 난수 요청 이메일 리절트값!!!!!: "+result);
    		
    	
    	resEDto.setResult(result);
    	
    	System.out.println("컨트롤러 난수 요청 이메일 DTO 리절트값!!!!!: "+resEDto.getResult());
    	
    	
    	String auth = generateVerificationCode();
    	
    	System.out.println("오스이메일 인증 컨트롤러: " + dto.toString());
    	//String auth = random.generateVerificationCode();
        String to = dto.getEmail(); 				
        String subject = "PlaceStation 회원가입 이메일 인증 입니다.";
        String text = "인증번호 < " + auth + " > 인증 번호를 입력해 주세요";

        System.out.println("이메일 인증 호출 랜덤킴 생성: " + auth);
        
            
        	try {
				
        		System.out.println("트라이 탔음 좋아연 !!!!!!!!!!!!!!!!!!!!!!!!!!");
        		System.out.println("트라이 탔음 좋아연 !!!");
        		resEDto.setStatus(1);
        		System.out.println("트라이타고 셋 스테이터스 확인이요: " + resEDto.getStatus());
        		service.sendEmail(to, subject, text);
        		
			} catch (MessagingException e) {
				
				System.out.println("캣치 탔음 이게 뭐누?");
				System.out.println("캣치 탔음 이게 뭐누?");
				resEDto.setStatus(0);
				e.printStackTrace();
			}

        	
        	
        	System.out.println("대체왜 이메일 전송 서비스만 만나면 status 값이 0으로 초기화 되는거임?: " + resEDto.getStatus());
        	
        	
        	System.out.println("메일 컨트롤러 이거 그대로 셋 되면 1일듯: " + resEDto.getStatus());
        	resEDto.setCode(auth);
          
            System.out.println("이메일 컨트롤러 리스폰스 디티오 투스트링: " +  resEDto.toString());
     
		
        return resEDto;

    }
    
    @PostMapping("/emailCheck")
    @ResponseBody
    public int confirmEmail(@RequestParam("code") String code) {
    	
    	System.out.println("이메일 컨트롤러 code148io21u4902174829104092184902184");
    	System.out.println("이메일 컨트롤러 code: "+ code);
    	int result = service.confirmCodeByMail(code);
    	
    	System.out.println("result 이메일 컨트롤러: "+result);
    	
    	return result;
    }
    
    
    
    
}
