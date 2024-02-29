/*
 * package com.project3.placestation.member.controller;
 * 
 * import org.springframework.http.HttpEntity; import
 * org.springframework.http.HttpHeaders; import
 * org.springframework.http.HttpMethod; import
 * org.springframework.http.ResponseEntity; import
 * org.springframework.stereotype.Controller; import
 * org.springframework.util.LinkedMultiValueMap; import
 * org.springframework.util.MultiValueMap; import
 * org.springframework.web.bind.annotation.GetMapping; import
 * org.springframework.web.bind.annotation.RequestParam; import
 * org.springframework.web.client.RestTemplate;
 * 
 * @Controller public class oauthController {
 * 
 * @RequestMapping("/user") 때문에 /user 가 달려있다. 카카오 디벨로퍼에서 redirect key 를 줄바꿈으로
 * 10개까지 등록 가능하다. 해서 http://localhost:80/user/kakao-callback?code="xxxxxxxxxx"
 * 처럼 만들어준다. 즉 /user대문을 달아도 요청 가능하게 해주자.
 * 
 * // http://localhost:80/user/kakao-callback?code="xxxxxxxxx" //@ResponseBody
 * // <-- 데이터를 반환 // 테스트 종료되어 view리졸버 타게 제거
 * 
 * @GetMapping("/kakao-callback") public String kakaoCallback(@RequestParam
 * String code) {
 * 
 * // POST 방식 , Header 구성, body 구성 System.out.println("code :  " + code);
 * 
 * RestTemplate rt1 = new RestTemplate(); // 헤더 구성 HttpHeaders headers1 = new
 * HttpHeaders(); headers1.add("Content-type",
 * "application/x-www-form-urlencoded;charset=utf-8"); // body 구성
 * MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
 * params.add("grant_type", "authorization_code"); params.add("client_id",
 * "aeff9f33b9d74346008005686767c513"); params.add("redirect_uri",
 * "http://localhost/user/kakao-callback"); params.add("code", code);
 * 
 * System.out.println("params:  "+params.toString());
 * 
 * 
 * // 헤더 + 바디 결합 HttpEntity<MultiValueMap<String, String>> reqMsg = new
 * HttpEntity<>(params, headers1);
 * 
 * System.out.println("reqMsg:   "+reqMsg.toString());
 * 
 * 
 * ResponseEntity<OAuthToken> response =
 * rt1.exchange("https://kauth.kakao.com/oauth/token", HttpMethod.POST, reqMsg,
 * OAuthToken.class);
 * 
 * System.out.println("response:  "+response.toString());
 * 
 * System.out.println("================================================");
 * 
 * 
 * // 다시 요청하기 -- 인증 토큰 -- 사용자 정보 요청 RestTemplate rt2 = new RestTemplate(); // 헤더
 * HttpHeaders headers2 = new HttpHeaders(); headers2.add("Authorization",
 * "Bearer " + response.getBody().getAccessToken());
 * headers2.add("Content-type",
 * "application/x-www-form-urlencoded;charset=utf-8"); // 바디 x // 결합
 * HttpEntity<MultiValueMap<String, String>> kakaoInfo = new
 * HttpEntity<>(headers2); ResponseEntity<KakaoProfile> response2 =
 * rt2.exchange("https://kapi.kakao.com/v2/user/me", HttpMethod.POST, kakaoInfo,
 * KakaoProfile.class);
 * 
 * System.out.println(response2.getBody());
 * 
 * 로그인 처리 단 최초 요청 사용자라면 회원 가입 처리 후 로그인 처리
 * 
 * 현재 로그인시 signUpFormDto와
 * 
 * 
 * 
 * // 최초 사용자 판단 여부 -- 사용자 username 존재 여부 확인 // 로컬의 유저네임과 카카오의 유저네임이 동일 할 수 있음(문제
 * 발생) KakaoProfile kakaoProfile = response2.getBody();
 * 
 * SignUpFormDto dto = SignUpFormDto.builder() .username("OAuth_" +
 * kakaoProfile.getProperties().getNickname()) .fullname("Kakao")
 * .password("asd1234").build(); //소셜 로그인시 모든 사용자의 비번이 같음 그래서 털리지 않게 관리 해야 하며 소셜
 * 로그인 유저는 비밀번호 변경이 불가 해야 한다.
 * 
 * 
 * User oldUser = userService.readUserByUserName(dto.getUsername());
 * 
 * 
 * 
 * 최초 가입이라면 oldUser에는 null이 담겨 있다. 해서 아래 두가지 처리
 * oldUser.setUsername(dto.getUsername());
 * oldUser.setFullname(dto.getFullname());
 *
 * 
 * if(oldUser == null) { userService.createUser(dto);
 * 
 * 
 * 267라인 oldUser가 null 값이 들어올 때 java.lang.NullPointerException Cannot invoke
 * "com.tenco.bank.repository.entity.User.setUsername(String)" because "oldUser"
 * is null
 * 
 * 
 * oldUser= new User();
 * 
 * oldUser.setUsername(dto.getUsername());
 * oldUser.setFullname(dto.getFullname()); }
 * 
 * oldUser.setPassword(null); // 보안적 이유로 password는 null로 내림
 * 
 * // 로그인 처리 httpSession.setAttribute(Define.PRINCIPAL, oldUser);
 * 
 * 
 * // 단 최초 요청 사용자라면 회원 가입 처리 후 로그인 처리 return "redirect:/account/list"; }
 * 
 * }
 */