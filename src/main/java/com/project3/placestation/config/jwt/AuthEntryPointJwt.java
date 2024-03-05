package com.project3.placestation.config.jwt;

import org.springframework.http.MediaType;
import org.springframework.security.web.AuthenticationEntryPoint;
import org.springframework.stereotype.Component;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.extern.slf4j.Slf4j;

//인증/인가가 되지않은 유저가 요청을 했을때 동작하는 클래스
//REST API 이므로 MAP 자료구조를 body에 담아 클라이언트로 전송
@Slf4j
@Component
public class AuthEntryPointJwt implements AuthenticationEntryPoint {

//private static final Logger logger = LoggerFactory.getLogger(AuthEntryPointJwt.class);

	@Override
	public void commence(HttpServletRequest request, HttpServletResponse response,
			org.springframework.security.core.AuthenticationException authException)
			throws java.io.IOException, ServletException {
		log.error("Unauthorized error: {}", authException.getMessage());

		response.setContentType(MediaType.APPLICATION_JSON_VALUE);
		response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);

		// 에러 처리
		response.sendError(HttpServletResponse.SC_UNAUTHORIZED, authException.getMessage());
	}

}