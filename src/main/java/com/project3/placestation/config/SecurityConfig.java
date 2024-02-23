package com.project3.placestation.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configurers.HeadersConfigurer;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.security.web.firewall.DefaultHttpFirewall;
import org.springframework.security.web.firewall.HttpFirewall;

import com.project3.placestation.config.jwt.AuthEntryPointJwt;
import com.project3.placestation.config.jwt.AuthTokenFilter;
import com.project3.placestation.config.jwt.UserDetailsServiceImpl;

@Configuration //configuration 클래스로 등록하기 위한 annotation
@EnableWebSecurity // spring security 에서도 관리되게 된다.
public class SecurityConfig {

	
	
    @Autowired
    UserDetailsServiceImpl userDetailsService;  // DB 조회 함수 객체

    @Autowired
    private AuthEntryPointJwt unauthorizedHandler; // 비인증/권한체크 예외처리 객체
    
    
    //  JWT 토큰 필터 객체 생성
    @Bean
    public AuthTokenFilter authenticationJwtTokenFilter() {
        return new AuthTokenFilter();
    }
    
    //  DB 에서 가져온 정보와 input 된 정보를 비교하는 함수
    @Bean
    public DaoAuthenticationProvider authenticationProvider() {
        //  db에서 가져온 정보와 리액트에서 전송한 유저 정보를 비교하는 객체
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


    @Bean
    public SecurityFilterChain securityFilter(HttpSecurity http)throws Exception{
        http
        .csrf((auth) -> auth.disable());
        

        
        
        http
                // SpringBoot 3.1버전 부터 람다식으로 작성 해야한다.
                .authorizeHttpRequests((auth) -> auth
//                        .requestMatchers("/member/main").hasRole("USER")
                		.requestMatchers("/**").permitAll() // 본인 requsetMapping 하위로 경로 열기/
                        .anyRequest()
                        .authenticated()    // anyRequest로 requestMatchers 에서 처리하지 못한 경로들에 대해 한번에 처리 가능.
                );

        http.authenticationProvider(authenticationProvider()); // DB와 입력값(id, pwd) 비교

        http
             // X-Frame-Options 비활성화 h2를 열기 위해 설정
            .headers(header -> header
                .frameOptions(HeadersConfigurer.FrameOptionsConfig::disable));

        http
                .formLogin((auth) -> auth.loginPage("/member/login")
                        .loginProcessingUrl("/loginProc")
                        .defaultSuccessUrl("/member/main", true)
                        .failureUrl("/member/sregister")
                        .usernameParameter("userId")
                        .passwordParameter("userPassword")
                        .permitAll()
                );

        http
        		.logout((auth) -> auth.logoutUrl("/logout")
	        			.logoutSuccessUrl("/login?logout")
	        			.permitAll()
	        			);


      


        http.addFilterBefore(authenticationJwtTokenFilter(), UsernamePasswordAuthenticationFilter.class); // JWT 토큰 필터 적용


        return http.build(); // HttpSecurity를 빌더 타입으로 리턴 해준다.
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
