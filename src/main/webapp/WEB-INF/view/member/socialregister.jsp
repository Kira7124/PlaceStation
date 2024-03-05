<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/member/layout/header.jsp"%>
<!--  
    Stylesheets
    =============================================
    
    -->
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Open+Sans&display=swap');

/* 로그인폼 스타일 */
* {
	box-sizing: border-box;
}

h2 {
	text-align: center;
	margin: 0 0 20px;
}

.sbody {
	display: block;
}

.form {
	padding: 30px 40px;
}

.register-form {
	margin-bottom: 10px;
	padding-bottom: 20px;
	position: relative;
}

.register-form label {
	color: #777;
	display: block;
}

.register-form input {
	border: 2px solid #f0f0f0;
	border-radius: 4px;
	display: block;
	width: 100%;
	padding: 10px;
	font-size: 14px;
}

.register-form input:focus {
	outline: 0;
	border-color: #777;
}

.register-form.success input {
	border-color: var(--success-color);
}

.register-form.error input {
	border-color: var(--error-color);
}

.register-form small {
	color: var(--error-color);
	position: absolute;
	bottom: 0;
	left: 0;
	visibility: hidden;
}

.register-form.error small {
	visibility: visible;
}

/* 라디오 버튼 */
.form_radio_btn {
	width: 47%;
	height: 45px;
	border: 1px solid #EAE7E7;
	border-radius: 10px;
	float: left;
}

.form_radio_btn input[type=radio] {
	display: none;
}

.form_radio_btn label {
	display: block;
	border-radius: 10px;
	margin: 0 auto;
	text-align: center;
	height: -webkit-fill-available;
	line-height: 45px;
}

/* Checked */
.form_radio_btn input[type=radio]:checked+label {
	background: #777;
	color: #fff;
}

/* Hover */
.form_radio_btn label:hover {
	color: #666;
}

/* Disabled */
.form_radio_btn input[type=radio]+label {
	background: #F9FAFC;
	color: #666;
}
</style>

<!--   회원가입 폼 시작 -->
<section class="module">
	<div class="container"
		style="background: #fff; border-radius: 5px; box-shadow: 0 2px 10px rgba(0, 0, 0, 0.3); width: 550px;">
		<form action="/member/social/register" id="form" class="form" method="post">
			<c:if test="${not empty principal}">
				<h2>Register With Us</h2>
				<p>
					principal :
					<sec:authentication property="principal" />
				</p>
				<p>=====================================</p>
				<p>Principal 정보: ${principal}</p>
				<div class="register-form" style="margin-bottom: 10px;">
					<label for="id">id</label> <input type="text" id="userId"
						placeholder="Enter id" name="userId" value="${principal.name}"
						readonly="readonly"/> <span class="msgId">영문, 숫자로
						6~12자까지 설정해 주세요.</span>
				</div>
				<div class="register-form">
					<label for="password">Confirm Password</label> <input
						type="password" name="userPassword" id="userPassword"
						placeholder="Enter password again" readonly="readonly"/> <span
						class="msgPass2">비밀번호 재입력</span>
				</div>
				<div class="register-form">
					<label for="email">Email</label>
					<div style="display: flex; flex-direction: column;">
						<div>
							<input type="text" name="email" id="lo_email1"
								placeholder="Enter email" style="max-width: 100%; float: left"
								value="${principal.email}" readonly="readonly"/>
						</div>
						<br>
					</div>
				</div>
				<div class="register-form">
					<label for="Address">Address</label> <input type="text" name="zip"
						id="zip" placeholder="Enter Adress" onclick="zipcode()" readonly />
					<span class="msgZip"></span>
					<div>
						<input type="text" name="addr1" id="addr1" size="50"
							placeholder="Search Address" readonly />
					</div>
					<div>
						<input type="text" name="addr2" id="addr2" size="50"
							placeholder="Address Detail" />
					</div>
				</div>
				<div class="register-form">
					<label for="name">name</label> <input type="text" name="userName"
						id="name" placeholder="Enter name" value="${principal.username }"
						readonly="readonly"/> <span class="msgName"></span>
				</div>
				<div class="register-form">
					<label for="userhp">hp</label> <input type="text" name="userHp"
						id="hp" placeholder="Enter hp"/> <span class="msgHp">
						- 포함 13자리를 입력하세요.</span>
					</td>
				</div>
				<div class="register-form">
					<div class="mb-3">
						<label for="userSex" class="form-label">성별</label>
						<div
							class="form_toggle row-vh d-flex flex-row justify-content-between">
							<div class="form_radio_btn radio_male">
								<input id="radio-1" type="radio" name="gender" value="M"
									checked> <label for="radio-1">남자</label>
							</div>

							<div class="form_radio_btn">
								<input id="radio-2" type="radio" name="gender" value="F">
								<label for="radio-2">여자</label>
							</div>
						</div>
					</div>
				</div>
				<br>
				<br>
				<br>
				<br>
				<button type="submit" class="terms-btn" id="socialRegister"
					name="socialRegister"
					style="margin: auto; display: block; color: white;">가입 하기</button>
			</c:if>
		</form>
	</div>
</section>
<!-- 회원가입 폼 종료 -->

<%@ include file="/WEB-INF/view/member/layout/footer.jsp"%>