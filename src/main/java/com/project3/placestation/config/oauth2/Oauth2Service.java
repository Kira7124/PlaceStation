package com.project3.placestation.config.oauth2;

import java.util.Collections;

import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.oauth2.client.userinfo.DefaultOAuth2UserService;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserRequest;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserService;
import org.springframework.security.oauth2.core.OAuth2AuthenticationException;
import org.springframework.security.oauth2.core.user.DefaultOAuth2User;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Service;

import com.project3.placestation.repository.entity.Member;
import com.project3.placestation.repository.interfaces.MemberRepository;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Service
public class Oauth2Service implements OAuth2UserService<OAuth2UserRequest, OAuth2User> {

	private final HttpSession httpSession;
	private final MemberRepository memberRepository;


	
	@Override
	public OAuth2User loadUser(OAuth2UserRequest userRequest) throws OAuth2AuthenticationException {
		log.info("Oauth2UserService=================== start");

		// 인증자 데이터 출력
		OAuth2UserService<OAuth2UserRequest, OAuth2User> delegate = new DefaultOAuth2UserService();
		OAuth2User oAuth2User = delegate.loadUser(userRequest);
		log.info("1..oAuth2User : " + oAuth2User);

		// 어떤 소셜로 로그인 한건지 검증
		String registrationId = userRequest.getClientRegistration().getRegistrationId();
		log.info("2..registrationId : " + registrationId);


		String userNameAttributeName = userRequest.getClientRegistration().getProviderDetails().getUserInfoEndpoint()
				.getUserNameAttributeName();
		log.info("3..userNameAttributeName : " + userNameAttributeName);

		Oauth2Attributes attributes = Oauth2Attributes.of(registrationId, userNameAttributeName,
				oAuth2User.getAttributes());
		log.info("4..attributes : " + attributes);
		log.info("4..attributes : " + attributes.getNameAttributeKey());

		Member member = saveOrUpdate(attributes);
		log.info("5..user : " + member);

		

		
		httpSession.setAttribute("member", new SessionUser(member));
		log.info("66666666666..user 세션 저장 완료 : " + member);

		return new DefaultOAuth2User(Collections.singleton(new SimpleGrantedAuthority(member.getUserrole())),
				attributes.getAttributes(), attributes.getNameAttributeKey());

	}

	// 소셜 등록 or 조회
	private Member saveOrUpdate(Oauth2Attributes attributes) {
		Member memberEntity = new Member();
		log.info("saveOrUpdate - attributes : " + attributes.toString());
		log.info("saveOrUpdate - attributes : 222222222222222222222222222" + attributes.getUsername());
		Member SmemberEntity = memberRepository.selectByValidUserIdOauth(attributes.getUsername());
		
		
		if(SmemberEntity != null) {
		log.info("saveOrUpdate - attributes : 333333333333333333333333333333" + SmemberEntity);
		log.info("saveOrUpdate - attributes : 44444444444444444444444444444444" + SmemberEntity.toString());
		
		
		memberEntity.setUserid(attributes.getUsername());
		memberEntity.setUserpassword(attributes.getPassword());
		memberEntity.setUsername(attributes.getNickname());
		memberEntity.setUseremail(attributes.getEmail());
		//memberEntity.setUserhp(attributes.getPhone());
		memberEntity.setUserrole("ROLE_USER");
		}else if(SmemberEntity == null) {
			log.info("오밤중에 행복하네여 ^^;;");
			log.info("오밤중에 행복하네여 ^^;;"+ SmemberEntity);
			
			memberEntity.setUserid(attributes.getUsername());
			memberEntity.setUserpassword(attributes.getPassword());
			memberEntity.setUsername(attributes.getNickname());
			memberEntity.setUseremail(attributes.getEmail());
			//memberEntity.setUserhp(attributes.getPhone());
			memberEntity.setUserrole("ROLE_USER");
		}
		
	
		// 사용자를 등록한 후에 즉시 userEntity에 할당 memberRepository.insertUser(userEntity); }
		//log.info("saveOrUpdate user : " + memberEntity);
		log.info("이거 맞냐? 왜 안나오냐?");

		return memberEntity;

	}

}
