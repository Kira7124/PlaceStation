package com.project3.placestation.config.oauth2;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;


import lombok.Builder;
import lombok.Getter;
import lombok.ToString;
import lombok.extern.slf4j.Slf4j;

@ToString
@Slf4j
@Getter
public class Oauth2Attributes {

	
	private Map<String, Object> attributes;
    private String nameAttributeKey;
    private String username;
    private String password;
    private String nickname;
    private String email;
    private String phone;
    
    @Builder
    public Oauth2Attributes(Map<String, Object> attributes, String nameAttributeKey, 
    						String username,String nickname, String email, String password, String phone) {
        this.attributes = attributes;
        this.nameAttributeKey = nameAttributeKey;
        this.username = username;
        this.password = password;
        this.nickname = nickname;
        this.email = email;
        this.phone = phone;
    }
    
    // 소셜 구분 및 정보 분배
    public static Oauth2Attributes of(String registrationId, String userNameAttributeName,Map<String, Object> attributes) {
        if ("kakao".equals(registrationId)) {
            return ofKakao(userNameAttributeName, attributes);
        }
        if ("naver".equals(registrationId)) {
        	return ofNaver(userNameAttributeName, attributes);
        }
        if ("google".equals(registrationId)) {
        	return ofGoogle(userNameAttributeName, attributes);
        }
        return null;
    }
    
    // kakao 데이터
    private static Oauth2Attributes ofKakao(String userNameAttributeName,Map<String, Object> attributes) {
    	
    	log.info("=========== OAuthAttributes ===========");
    	log.info("OAuthAttributes attributes id : "+attributes);
		log.info("OAuthAttributes attributes id : "+attributes.get("id"));
		log.info("OAuthAttributes attributes kakao_account : "+attributes.get("kakao_account"));
		log.info("=========== end ===========");
		
		Map<String, Object> kakaoAccount = (Map<String, Object>) attributes.get("kakao_account");
	    Map<String, Object> profile = (Map<String, Object>) kakaoAccount.get("profile");
	    
	    log.info("=========== kakaoAccount,profile  ===========");
	    log.info("kakaoAccount :"+kakaoAccount);
	    log.info("profile :"+profile);
	    log.info("=========== end ===========");
		
	    String nickname = (String) profile.get("nickname");
        String email = (String) kakaoAccount.get("email");
        String username = "kakao_" + email;
        String password = "asd13242342";
        
        
        
        log.info("=========== kakaoAccount,profile  ===========");
	    log.info("nickname :"+nickname);
	    log.info("email :"+email);
	    log.info("username :"+username);
	    log.info("=========== end ===========");

        return Oauth2Attributes.builder()
                .nickname(nickname)
                .email(email)
                .username(username)
                .password(password)
                .attributes(attributes)
                .nameAttributeKey(userNameAttributeName)
                .build();
    }
    
    // naver 데이터
    private static Oauth2Attributes ofNaver(String userNameAttributeName, Map<String, Object> attributes) {
        log.info("=========== OAuthAttributes ===========");
        log.info("OAuthAttributes attributes id : " + attributes);
        log.info("=========== end ===========");
        
        Map<String, Object> response = (Map<String, Object>) attributes.get("response");
        
        log.info("=========== response  ===========");
	    log.info("response :"+response);
	    log.info("=========== end ===========");
        
        String email = (String) response.get("email");
        String name = (String) response.get("name");
        String phone = (String) response.get("mobile");

        String username = "naver_" + email;
        String password = "asd13242342"; // 임시 패스워드 설정

        log.info("=========== naver data  ===========");
	    log.info("email :"+email);
	    log.info("name :"+name);
	    log.info("phone :"+phone);
	    log.info("username :"+username);
	    log.info("password :"+password);
	    log.info("=========== end ===========");
        
        
		  return Oauth2Attributes.builder()
				  .email(email)
				  .nickname(name)
				  .username(username) 
				  .password(password) 
				  .attributes(attributes)
				  .nameAttributeKey(userNameAttributeName)
				  .phone(phone) 
				  .build();
		 
    }
    
    // google 데이터
    private static Oauth2Attributes ofGoogle(String userNameAttributeName, Map<String, Object> attributes) {
        
    	String email = (String) attributes.get("email");
        String name = (String) attributes.get("name");
    	
        log.info("=========== naver data  ===========");
	    log.info("email :"+email);
	    log.info("name :"+name);
	    log.info("=========== end ===========");
        
    	String username = "google_" + email;
        String password = "asd13242342"; // 임시 패스워드 설정
        
        return Oauth2Attributes.builder()
               .nickname(name)
               .email(email)
               .username(username)
               .password(password)
               .attributes(attributes)
               .nameAttributeKey(userNameAttributeName)
               .build();
		 
    }
}
