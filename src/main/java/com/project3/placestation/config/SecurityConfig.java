package com.project3.placestation.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityCustomizer;
import org.springframework.security.config.annotation.web.configurers.HeadersConfigurer;
import org.springframework.security.config.annotation.web.configurers.oauth2.client.OAuth2LoginConfigurer.UserInfoEndpointConfig;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.oauth2.client.registration.ClientRegistration;
import org.springframework.security.oauth2.client.registration.ClientRegistrationRepository;
import org.springframework.security.oauth2.client.registration.InMemoryClientRegistrationRepository;
import org.springframework.security.oauth2.core.AuthorizationGrantType;
import org.springframework.security.oauth2.core.ClientAuthenticationMethod;
import org.springframework.security.oauth2.core.oidc.IdTokenClaimNames;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.firewall.DefaultHttpFirewall;
import org.springframework.security.web.firewall.HttpFirewall;

import com.project3.placestation.config.jwt.UserDetailsServiceImpl;
import com.project3.placestation.config.oauth2.Oauth2Service;

@Configuration // configuration 클래스로 등록하기 위한 annotation
@EnableWebSecurity // spring security 에서도 관리되게 된다.
public class SecurityConfig {

	@Autowired
	UserDetailsServiceImpl userDetailsService; // DB 조회 함수 객체

	private final Oauth2Service oauth2Service;

	public SecurityConfig(Oauth2Service oauth2Service) {
		this.oauth2Service = oauth2Service;
	}

	// 카카오 Rest Key
	@Value("${spring.security.oauth2.client.registration.kakao.client-id}")
	private String KakaoRestKey;

	// 카카오 리다이렉트 uri
	@Value("${spring.security.oauth2.client.registration.kakao.redirect-uri}")
	private String KakaoRedirectUri;




	@Bean
	public DaoAuthenticationProvider authenticationProvider() {
		// db에서 가져온 정보와 리액트에서 전송한 유저 정보를 비교하는 객체
		DaoAuthenticationProvider authProvider = new DaoAuthenticationProvider();

		authProvider.setUserDetailsService(userDetailsService); // DB 유저 조회 함수 객체
		authProvider.setPasswordEncoder(bCryptPasswordEncoder()); // 암호 적용된 페스워드

		return authProvider;
	}

	// 비밀번호 암호화
	@Bean
	public BCryptPasswordEncoder bCryptPasswordEncoder() {
		return new BCryptPasswordEncoder();
	}

	/*
	 * 스프링 시큐리티 룰을 무시하게 하는 Url 규칙(여기 등록하면 규칙 적용하지 않음)
	 */
	@Bean
	public WebSecurityCustomizer webSecurityCustomizer() {
		return (web) -> web.ignoring().requestMatchers("assets/**", "/js/**", "/images/**", "/css/**");
	}

	@Bean
	public SecurityFilterChain securityFilter(HttpSecurity http) throws Exception {
		http.csrf((auth) -> auth.disable());

		http
				// SpringBoot 3.1버전 부터 람다식으로 작성 해야한다.
				.authorizeHttpRequests((auth) -> auth
						// .requestMatchers("/member/main").hasRole("USER")
						.requestMatchers("/**").permitAll().anyRequest().permitAll() // 본인 requsetMapping
																						// 하위로 경로 열기/
				);

		http
				// X-Frame-Options 비활성화 h2를 열기 위해 설정
				.headers(header -> header.frameOptions(HeadersConfigurer.FrameOptionsConfig::disable));


		// 적용
		http.formLogin((auth) -> auth.loginPage("/member/login").loginProcessingUrl("/loginProc")
				.defaultSuccessUrl("/member/main", true).failureUrl("/member/sregister").usernameParameter("RuserId")
				.passwordParameter("userPassword").permitAll());

		http.logout((auth) -> auth.logoutUrl("/member/logout").invalidateHttpSession(true).clearAuthentication(true)
				.logoutSuccessUrl("/member/login").permitAll());

		// 자동 로그인 설정
		http.rememberMe(remember -> remember.rememberMeParameter("remember").alwaysRemember(false)
				.tokenValiditySeconds(60 * 60 * 24 * 30 * 3).key("rememberMe").userDetailsService(userDetailsService));

		// 소셜 로그인 설정
		http.oauth2Login((oauth2) -> oauth2.loginPage("/member/login")
				//.userInfoEndpoint(userInfo -> userInfo.userService(oauth2Service))  // 데이터를 받을 수 있는 데이터를 받을 수 있는
				.userInfoEndpoint((UserInfoEndpointConfig) -> UserInfoEndpointConfig.userService(oauth2Service))
				.clientRegistrationRepository(clientRegistrationRepository()).defaultSuccessUrl("/member/social/register", true)
				.failureUrl("/login?success=403").permitAll());
		
		// 토큰 유지기간 1년
		http.rememberMe(
				(auth) -> auth.key("userId").rememberMeParameter("rememberMe").tokenValiditySeconds(3600 * 24 * 365) 
				
						.userDetailsService(userDetailsService));

		// http.exceptionHandling().authenticationEntryPoint(authenticationEntryPoint());

		// 사용자 인증처리 컴포넌트 등록
		http.userDetailsService(userDetailsService);

		return http.build(); // HttpSecurity를 빌더 타입으로 리턴 해준다.
	}

	// 소셜 로그인 등록
	@Bean
	public ClientRegistrationRepository clientRegistrationRepository() {
		return new InMemoryClientRegistrationRepository(kakaoClientRegistration(), googleClientRegistration(),
				naverClientRegistration());
	}

	// 카카오 소셜 로그인
	private ClientRegistration kakaoClientRegistration() {
		return ClientRegistration.withRegistrationId("kakao").clientId(KakaoRestKey).clientSecret(null)
				.redirectUri(KakaoRedirectUri).authorizationUri("https://kauth.kakao.com/oauth/authorize")
				.tokenUri("https://kauth.kakao.com/oauth/token").userInfoUri("https://kapi.kakao.com/v2/user/me")
				.userNameAttributeName("id").authorizationGrantType(AuthorizationGrantType.AUTHORIZATION_CODE)
				.clientName("Kakao").build();
	}

	// 구글 소셜 로그인
	private ClientRegistration googleClientRegistration() {
		return ClientRegistration.withRegistrationId("google")
				.clientId("1018594598230-o4oh4kjhp788hci4s4oh8n0ueoedio21.apps.googleusercontent.com")
				.clientSecret("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")
				.redirectUri("http://localhost/login/oauth2/code/google").scope("profile", "email")
				.authorizationUri("https://accounts.google.com/o/oauth2/auth")
				.tokenUri("https://www.googleapis.com/oauth2/v4/token")
				.userInfoUri("https://www.googleapis.com/oauth2/v3/userinfo")
				.authorizationGrantType(AuthorizationGrantType.AUTHORIZATION_CODE)
				.userNameAttributeName(IdTokenClaimNames.SUB).clientName("Google").build();
	}

	// 네이버 소셜 로그인
	// 네이버 소셜 로그인
	private ClientRegistration naverClientRegistration() {
		return ClientRegistration.withRegistrationId("naver").clientId("OoIwslayQE_qOrByEI0U")
				.clientSecret("Ij6j_GrSZd").clientAuthenticationMethod(ClientAuthenticationMethod.CLIENT_SECRET_POST)
				.authorizationGrantType(AuthorizationGrantType.AUTHORIZATION_CODE)
				.redirectUri("http://localhost/login/oauth2/code/naver").scope("profile")
				.authorizationUri("https://nid.naver.com/oauth2.0/authorize")
				.tokenUri("https://nid.naver.com/oauth2.0/token").userInfoUri("https://openapi.naver.com/v1/nid/me")
				.userNameAttributeName("response").clientName("Naver").build();
	}

	// HttpFirewall 적용
	public void configure(WebSecurity web) throws Exception {
		web.httpFirewall(defaultHttpFirewall());
	}

	// 더블 슬래시 url 허용
	@Bean
	public HttpFirewall defaultHttpFirewall() {
		return new DefaultHttpFirewall();
	}

}
