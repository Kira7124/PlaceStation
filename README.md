<img width="100%" height="170px" alt="logo jpg" src="https://github.com/Kira7124/PlaceStation/assets/89882482/4c950f89-5352-430e-bc5f-54195a9dfbc5">

# 🏙 프로젝트 개요
---
장소 공유 및 예약 관리서비스 플랫폼<br><br>

|Name|김진수|이산하|정영재|조유빈|김병준|
|---|---|---|---|---|---|
|**position**|팀장/관리자|결제/예약/사업자|유저|고객센터|상품관리|


- 프로젝트 기간: 총 15일 (02/13 ~ 03/05)

<br>
<br>

 # 📚기술스택


## <summary> 🕵️‍♂️Front_End</summary>
<div markdown="1">

- bootstrap : 4.6.2
- HTML5
- CSS3
- JavaScript : 1.16.1
- JQuery : 3.6.4
- Chart.js
</div>
</details>

<br>
<br>

## <summary> 🕵️‍♂️Back_End</summary>
<div markdown="1">
 
- springboot : 3.1.8
- H2 Database → MySQL : 8.0.32
- jdk : 11.0.17
- lombok
- MyBatis
- JSP
- BCrypt HASH
- Apache Tomcat : 9.0
</div>

<br>
<br>

## <summary> 📡API</summary>
<div markdown="1">
 
- 카카오/구글/네이버 소셜 로그인 API (OAuth 2.0 프로토콜)
- 포트원 API
- 이메일 전송 API (구글 SMTP 프로토콜)
- 카카오 맵 API
- DAUM 우편번호 찾기 API
</div>

<br>
<br>

<h2 tabindex="-1" dir="auto"><a id="user-content--my-stack" class="anchor" aria-hidden="true" tabindex="-1" href="#-my-stack"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path d="m7.775 3.275 1.25-1.25a3.5 3.5 0 1 1 4.95 4.95l-2.5 2.5a3.5 3.5 0 0 1-4.95 0 .751.751 0 0 1 .018-1.042.751.751 0 0 1 1.042-.018 1.998 1.998 0 0 0 2.83 0l2.5-2.5a2.002 2.002 0 0 0-2.83-2.83l-1.25 1.25a.751.751 0 0 1-1.042-.018.751.751 0 0 1-.018-1.042Zm-4.69 9.64a1.998 1.998 0 0 0 2.83 0l1.25-1.25a.751.751 0 0 1 1.042.018.751.751 0 0 1 .018 1.042l-1.25 1.25a3.5 3.5 0 1 1-4.95-4.95l2.5-2.5a3.5 3.5 0 0 1 4.95 0 .751.751 0 0 1-.018 1.042.751.751 0 0 1-1.042.018 1.998 1.998 0 0 0-2.83 0l-2.5 2.5a1.998 1.998 0 0 0 0 2.83Z"></path></svg></a>💻 My Stack</h2>
<div class= "container">
<img alt="JavaScript" src="https://camo.githubusercontent.com/0d61458680d0251da6e466fb5e30a5650d15d0239c68482920d00de83961daa4/68747470733a2f2f696d672e736869656c64732e696f2f62616467652f4a617661536372696970742d4637444631452e7376673f267374796c653d666f722d7468652d6261646765266c6f676f3d4a617661536372697074266c6f676f436f6c6f723d626c61636b" data-canonical-src="https://img.shields.io/badge/JavaScriipt-F7DF1E.svg?&amp;style=for-the-badge&amp;logo=JavaScript&amp;logoColor=black" style="max-width: 100%;">

<img src="https://img.shields.io/badge/h2-4479A1?style=for-the-badge&logo=mysql&logoColor=white">
<img src="https://img.shields.io/badge/spring-7FFF00?style=for-the-badge&logo=spring&logoColor=white">
<img src="https://img.shields.io/badge/springboot-006400?style=for-the-badge&logo=springboot&logoColor=white">
<img src="https://img.shields.io/badge/springsecurity-008B8B?style=for-the-badge&logo=springsecurity&logoColor=white"><br>
<img src="https://img.shields.io/badge/github-a9a9a9?style=for-the-badge&logo=github&logoColor=white">
<img src="https://img.shields.io/badge/javascript-4b0082?style=for-the-badge&logo=eclipseide&logoColor=white">
<img src="https://img.shields.io/badge/dbeaver-fffacd?style=for-the-badge&logo=dbeaver&logoColor=black">
<img src="https://img.shields.io/badge/bootstrap-ba55d3?style=for-the-badge&logo=bootstrap&logoColor=black">
<img src="https://img.shields.io/badge/html5-ffa07a?style=for-the-badge&logo=html5&logoColor=white">
<img src="https://img.shields.io/badge/css3-afeeee?style=for-the-badge&logo=html5&logoColor=white"><br>
<img src="https://img.shields.io/badge/gradle-ffa07a?style=for-the-badge&logo=amazonaws&logoColor=white">
<img src="https://img.shields.io/badge/jquery-4169e1?style=for-the-badge&logo=jquery&logoColor=white">




</div>

<br>
<br><br>
<br><br>



# ⚙ 의존성
---
	implementation 'org.apache.tomcat.embed:tomcat-embed-jasper'
	implementation group: 'org.glassfish.web', name: 'jakarta.servlet.jsp.jstl', version: '2.0.0'
	implementation 'org.mybatis.spring.boot:mybatis-spring-boot-starter:3.0.3'
	implementation 'com.itextpdf:itext7-core:7.2.1'
	implementation group: 'com.googlecode.json-simple', name: 'json-simple', version: '1.1.1'
	runtimeOnly 'com.mysql:mysql-connector-j'
	implementation 'org.springframework.boot:spring-boot-starter-web'
	compileOnly 'org.projectlombok:lombok'
	developmentOnly 'org.springframework.boot:spring-boot-devtools'
	runtimeOnly 'com.h2database:h2'
	annotationProcessor 'org.projectlombok:lombok'
	testImplementation 'org.springframework.boot:spring-boot-starter-test'
	implementation 'org.springframework.boot:spring-boot-starter-security'
	testImplementation 'org.springframework.security:spring-security-test'
	implementation 'org.springframework.boot:spring-boot-starter-validation'
	implementation 'org.springframework.boot:spring-boot-starter-mail'
	testImplementation 'org.springframework.boot:spring-boot-starter-test'
	implementation 'org.springframework.security:spring-security-taglibs:6.2.2'
	implementation 'io.jsonwebtoken:jjwt-api:0.11.2'
	implementation 'io.jsonwebtoken:jjwt-impl:0.11.2'
	implementation 'io.jsonwebtoken:jjwt-jackson:0.11.2'
	implementation 'org.springframework.boot:spring-boot-starter-mail'
	implementation 'org.springframework.boot:spring-boot-starter-oauth2-client:3.2.2'


<br>
<br><br>
<br><br>
<br><br>
<br>

# 1️⃣ 프로젝트 구조

```


📦src
 ┗ 📂main
   ┣ 📂java
   ┃ ┗ 📂com
   ┃   ┗ 📂project3
   ┃     ┗ 📂placestation
   ┃       ┣ 📂admin
   ┃       ┃ ┗ 📂controller
   ┃       ┃ ┗ 📂dto
   ┃       ┣ 📂biz
   ┃       ┃ ┗ 📂controller
   ┃       ┃ ┗ 📂handlr
   ┃       ┃ ┗ 📂model
   ┃       ┣ 📂config
   ┃       ┃ ┗ 📂error
   ┃       ┃ ┗ 📂jwt
   ┃       ┃ ┗ 📂oauth2
   ┃       ┣ 📂cs
   ┃       ┃ ┗ 📂controller
   ┃       ┃ ┗ 📂dto
   ┃       ┣ 📂fieldb
   ┃       ┃ ┗ 📂controller
   ┃       ┃ ┗ 📂model
   ┃       ┣ 📂member
   ┃       ┃ ┗ 📂controller
   ┃       ┃ ┗ 📂dto
   ┃       ┃ ┗ 📂sequenceInterface
   ┃       ┣ 📂handler
   ┃       ┃ ┗ 📂exception
   ┃       ┣ 📂party
   ┃       ┃ ┣ 📂controller
   ┃       ┃ ┗ 📂model
   ┃       ┣ 📂payment
   ┃       ┃ ┣ 📂controller
   ┃       ┃ ┗ 📂dto
   ┃       ┣ 📂product
   ┃       ┃ ┣ 📂controller
   ┃       ┃ ┗ 📂dto
   ┃       ┣ 📂repository
   ┃       ┃ ┣ 📂entity
   ┃       ┃ ┗ 📂interfaces
   ┃       ┣ 📂service
   ┃       ┗ 📂utils
   ┣ 📂resources
   ┃ ┣ 📂db
   ┃ ┣ 📂mapper
   ┃ ┗ 📂static
   ┃   ┣ 📂adimg
   ┃   ┣ 📂assets
   ┃   ┣ 📂banner
   ┃   ┣ 📂css
   ┃   ┣ 📂js
   ┃   ┣ 📂img
   ┃   ┣ 📂logo
   ┃   ┣ 📂favicons
   ┃   ┗ 📂policy
   ┗ 📂webapp
     ┗ 📂WEB-INF
       ┗ 📂view
	 ┣ 📂admin
	 ┣ 📂biz
         ┃ ┣ 📂account
         ┃ ┣ 📂common
         ┃ ┣ 📂product
         ┃ ┣ 📂reservation
	 ┣ 📂cs
	 ┣ 📂error
	 ┣ 📂layout
 	 ┣ 📂main
	 ┣ 📂member
	 ┣ 📂party
	 ┣ 📂patment
	 ┗ 📂product


  
  
```


<br>
<br><br>
<br><br>
<br><br>
<br>

# 2️⃣ 프로젝트 개요

- 편의와 취미를 공유할 수 있는 장소에 대한 예약 및 일정을 공유하여 함께 즐길 수 있도록 사이트를 구성
- 실제 운영중인 공간대여 서비스 플랫폼을 벤치 마킹 (아워플레이스, 스페이스 클라우드 등)


<br>
<br><br>
<br><br>
<br><br>
<br>

# 3️⃣ 기능 구분 

#### User
- 소셜 로그인, 상품 결제/환불
- 마이 페이지를 통한 개인 정보및 결제 정보 관리
- 모임 생성/참여 가능

#### Biz
- 상품 등록및 수정 삭제 가능
- 통계/일정 및 상품 관리/ 결제 및 예약 관리/ 문의 내역/ 사업자 계정 관리 가능(상세정보)
- 사업자 수익을 그래프화 해서 통계 확인 가능
- 달력을 통해 등록한 일정 확인 가능


#### Admin
- 관리자 페이지를 통한 회원수와 문의 건수 월간 매출액 확인 가능
- 관리자가 정한 최근 일정을 표시하여 최근 목록에 대해 관리 가능
- 1:1 문의 답변 및 관리 가능
- 유저의 정보를 수정 (탈퇴 및 수정) 가능
- 사업자 등록증 확인 가능
- 공지사항 등록/수정/삭제 가능
- 광고 배너 등록/수정/삭제 가능
- 구매 내역 확인 가능


#### CS
- 등록된 공지사항 확인 가능
- 자주 묻는 질문 확인 가능
- 카테고리를 통한 1:1 문의 세분화
- 

#### Product
- 평점 평균을 산출하여 별점으로 표현
- 해당 상품에 관한 리뷰 작성
- 찜하기
- 캘린더 형식으로 날짜를 선택하고 시간 단위로 예약/ 인원 설정 가능
- 부가 옵션등록 해당 위치 지도에 표시
- 포트원 결제를 통한 결제 가능
 

# 4️⃣ ERD & 테이블 명세서
![image](https://github.com/Kira7124/PlaceStation/assets/113073333/8ecb1e75-76db-4dbf-9a4c-dd85b999b6af)


<br>
<br><br>
<br><br>
<br><br>
<br>

# 5️⃣ SiteMap


<img src="https://github.com/Kira7124/PlaceStation/assets/136421992/41233a00-a93a-40c8-893d-eedd33762208">

<br>
<br><br>
<br><br>
<br><br>
<br>

# 6️⃣ 주요 기능


<p>
<img src="https://github.com/Kira7124/PlaceStation/assets/89882482/8008563a-b47b-43e8-b81a-a658cb97dc39">
</p>

<p>
<img src="https://github.com/Kira7124/PlaceStation/assets/89882482/d9a91885-eab8-4e57-b6ab-e954f5846e67">
</p>

<p>
<img src="https://github.com/Kira7124/PlaceStation/assets/89882482/2b65ad6b-519e-4633-bfaf-056b58887cb4">
</p>





### 유저

#### 회원가입
- 아이디/휴대폰/이메일 중복 확인
- Validation 체크 처리
- Daum 우편번호 찾기 API를 사용 하여 주소 입력
- smtp 이메일 인증을 통한 이메일 정보 확인

#### 로그인
- 카카오/구글/네이버 소셜 로그인 (OAuth 2.0 프로토콜)
- 일반 로그인
- 아이디/비밀번호 찾기(smtp 이메일 인증)

#### 회원정보
- 회원 정보 변경
- 비밀 번호 변경
- 프로필 사진 변경

#### 결제내역
- 결제된 상품에 대한 내역 확인 가능
- 결제된 상품에 대해 취소 및 환불 가능


#### 문의내역
- 본인이 작성한 문의 내역에 관해 확인 가능


#### 모임내역 관리
- 본인이 생성 또는 참여한 모임에 대해 확인 가능



#### 찜목록
- 찜을 한 상품에 대한 내역 확인 가능

<br><br><br><br>

<p>
<img src="https://github.com/Kira7124/PlaceStation/assets/89882482/3aa74f74-f3ef-4c48-aa7c-443bf9175a33">
</p>
<p>
<img src="https://github.com/Kira7124/PlaceStation/assets/89882482/af9a5b55-d87a-4b42-a118-c4ba6d48eae1">
</p>




---

### 상품 전체 조회 , 결제, 예약  이산하
#### 상품 전체 조회
- 상품 이름 , 주소 , 가격 , 태그 , 별점 검색 기능

#### 결제 기능
- 라이브러리 - fortOne
- 포트원을 활용한 카카오페이 , 페이팔  , 토스페이 , kg이니시스 결제 , 환불 기능
- 포트원 사전 처리 , 사후 처리를 설계하여 안정적인 구매가 가능

#### 예약 기능
- 해당 날짜 , 기간 을 설정하여 예약 가능
- 해당 예약 날짜와 기간을 검증

<p>
<img src="https://github.com/Kira7124/PlaceStation/assets/89882482/a3b9ebb9-0b17-4b66-a857-4b0094a8f9d5">
</p>

---

### 사업자  이산하
#### 통계 기능
- 라이브러리 - chart.js 
- 수수료 통계
- 연간 월간 주간 매출 통계

#### 일정 관리
- 라이브러리 - full calendar
- full calendar 를 활용하여 해당 예약 일자 , 시간을 한눈에 확인

#### 상품 관리
- 라이브러리 - kakao map 지도 , Daum 우편번호 찾기
- 예약 상품에 관련된 추가 , 변경 , 삭제
- Daum 우편번호 찾기 와 kakao map 을 활용하여 지도 검색 , 좌표 저장

#### 결제내역
- 라이브러리 - fortOne
- 결제에 관한 내역 확인 
- 결제된 내역에 대해 취소 및 전액 환불 기능

#### 유저 정보 관리
- 사업자의 유저 정보 관리

<p>
<img src="https://github.com/Kira7124/PlaceStation/assets/89882482/d0cba144-287b-4495-bf3d-c495fada4123">
</p>

---

### 모임 - 이산하
#### 모임 주최
- 모임을 생성 , 관리 , 삭제
- 모임 참여 기능
- 해당 모임 공지사항 관리

<p>
<img src="https://github.com/Kira7124/PlaceStation/assets/89882482/0576fb6a-4eab-404d-86bb-237f84008ebb">
</p>

---

### 상품등록/관리  김병준



### 관리자  김진수



### 고객센터 조유빈




<br>
<br><br>
<br><br>
<br><br>
<br>























