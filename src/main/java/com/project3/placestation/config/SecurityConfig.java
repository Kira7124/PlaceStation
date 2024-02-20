package com.project3.placestation.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configurers.HeadersConfigurer;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@Configuration //configuration 클래스로 등록하기 위한 annotation
@EnableWebSecurity // spring security 에서도 관리되게 된다.
public class SecurityConfig {
    
    // 비밀번호 암호화
    @Bean
    public BCryptPasswordEncoder bCryptPasswordEncoder() {
        
        return new BCryptPasswordEncoder();
    }
    
    
    @Bean
    public SecurityFilterChain securityFilter(HttpSecurity http)throws Exception{  
        
        http
                // SpringBoot 3.1버전 부터 람다식으로 작성 해야한다.
                .authorizeHttpRequests((auth) -> auth
                        .requestMatchers("/**").permitAll() // 본인 requsetMapping 하위로 경로 열기
                        .requestMatchers("/admin").hasRole("ADMIN") // 해당 페이지에 접근 가능한 role 설정
                        .requestMatchers("/biz").hasAnyRole("ADMIN","SELLER") //
                        .requestMatchers("/my/**").hasAnyRole("ADMIN","USER","SELLER") // my/ 뒤에 user아이디가 붙는다 가정 모든 아이디를 여기 적을수는 없기 때문에 와이드인 ** 를 사용해 설정해 준다.
                        .anyRequest().authenticated()    // anyRequest로 requestMatchers 에서 처리하지 못한 경로들에 대해 한번에 처리 가능. 
                );  
                
               /* 
                    * https://github.com/spring-projects/spring-security/releases
                    - authorizeHttpRequests 설정은 상단부터 순서대로 적용.
                    - hasRole과 hasAnyRole의 차이 hasRole은 해당 권한이 있으면 true를 반환, 클라이언트가 제공한 값이 ROLE_로 시작하지 않으면 ROLE_을 기본으로
                    추가해 준다. DefaultWebSecurityExpressionHandler에서 defaultRolePrefix를 수정하여 커스터마이즈 가능.
                    hasAnyRole은 경로로 접근하는 클라이언트가 ,로 분리된 권한중 하나라도 갖고 있다면 ture를 반환 나머지는 hasRole과 동일한 역할을 수행한다.
               
                    - 권한 없이 hasRole로 막혀있는 경로에 접근하면 403에러가 발생하며 config 파일에서 설정을 통해 403에러 발생시 로그인 화면으로 보내줄 수 있다.
                    로그인 form 설정이 없다면 403에러와 함께 거부만 된다.
                     
                    - 허용 종류
                    permitAll: 모든 사용자 에게 로그인 없이도 허용
                    hasRole: 특정 Role이 있어야 로그인 후에 해당 경로에 접근 가능
                    authenticated: 로그인 완료후 접근가능
                    denyAll: 로그인 여부와 관계 없이 접근 불가
               
                */

        http
             // X-Frame-Options 비활성화 h2를 열기 위해 설정
            .headers(header -> header
                .frameOptions(HeadersConfigurer.FrameOptionsConfig::disable));
              
        
        http
                .formLogin((auth) -> auth.loginPage("/member/login")
                        .loginProcessingUrl("/loginProc")
                        .defaultSuccessUrl("/member/main", true)
                        .failureUrl("/member/sregister")
                        .usernameParameter("username")
                        .passwordParameter("password")
                        .permitAll()
                ); 
        
                /*
                    - auth의 loginPage라는 메서드를 통해서 로그인 페이지 경로를 설정해 줄 수 있다.
                    로그인 페이지 설정이 완료되면 스프링 부트에서 자동으로 login 페이지로 보내준다.
                    
                    - loginProcessingUrl는 security가 login에서 날아오는 Form Action Url 요청에 대해 어디로 보낼 것인지 설정해 준다.
                    
                    - spring security는 가입된 아이디가 없어도 자동으로 한개의 id와 password를 생성해 준다. id는 user pw는 console창에 명시해준다.
                    
                    - form인증 관련 메서드 
                    https://velog.io/@gmtmoney2357/%EC%8A%A4%ED%94%84%EB%A7%81-%EC%8B%9C%ED%81%90%EB%A6%AC%ED%8B%B0-Form-Login-%EC%9D%B8%EC%A6%9D
                    
                    .successHandler( ...생략... ) // 로그인 성공 후 핸들러 핸들러에서 끌어와서 셋팅 하면 될듯
                    .failureHandler( ...생략... ) // 로그인 실패 후 핸들러
                */
                
        http
                .csrf((auth) -> auth.disable());
                /*
                    - csrf라는 사이트 위변조 방지 설정이 security에는 자동으로 설정 되어 있는데 이 csrf설정이 걸려 있을 때 post요청이 발생하면 
                    요청과 함께 csrf토큰도 함께 보내야 요청이 진행 된다.
                    
                    * 현재 개발 환경에서는 csrf 토큰에 관한 설정이 되어 있지 않기 때문에 csrf를 비활성화  시켜 놓았다.
                */
        
         
        
        
        
        return http.build(); // HttpSecurity를 빌더 타입으로 리턴 해준다.
    }
}
