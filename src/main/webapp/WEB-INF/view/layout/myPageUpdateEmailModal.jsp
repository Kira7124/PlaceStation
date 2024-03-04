<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- Modal -->
<div class="modal fade" id="exampleModalEmail" tabindex="-1"
	role="dialog" aria-labelledby="exampleModalCenterTitle"
	aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLongTitle">이메일 변경</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<!-- 이메일 변경 내용을 입력하는 폼 -->
				<form action="/your-email-change-action" method="post">
						<div style="display: flex; flex-direction: column;">
					<div>
						<input type="text" name="email" id="lo_email1"
							placeholder="Enter email" style="max-width: 36%; float: left">
						<input type="text" name="email2" id="lo_email2"
							placeholder="도메인 입력" required style="max-width: 36%; float: left" />
						<select class="terms-btn" name="selectEmail" id="selectEmail"
							style="float: right; background-color: white; border: solid 1px #00000026; max-width: 28%; height: 50px; padding: 10px 0px !important;">
							<option value="1" selected>직접입력</option>
							<option value="naver.com">naver.com</option>
							<option value="daum.net">daum.net</option>
							<option value="hotmail.com">hotmail.com</option>
							<option value="nate.com">nate.com</option>
							<option value="yahoo.co.kr">yahoo.co.kr</option>
							<option value="empas.com">empas.com</option>
							<option value="dreamwiz.com">dreamwiz.com</option>
							<option value="freechal.com">freechal.com</option>
							<option value="lycos.co.kr">lycos.co.kr</option>
							<option value="korea.com">korea.com</option>
							<option value="gmail.com">gmail.com</option>
							<option value="hanmir.com">hanmir.com</option>
							<option value="paran.com">paran.com</option>
						</select> <span class="msgEmail">@없이 입력</span>
					</div>
					<br> <br> <br>
					<div>
						<span class="msgEmail"></span>
						<button class="terms-btn" type="button" id="btnEmailCode"
							style="float: left; max-width: 28%; color: white; max-height: 10%; padding: 10px 10px !important;">인증번호
							받기</button>
						<div class="auth">
							<input type="text" name="auth" placeholder="인증번호 입력" required />
							<span class="resultEmailForId"></span>
							<button class="terms-btn" type="button" id="btnEmailAuth"
								style="float: right; max-width: 28%; color: white; max-height: 10%; padding: 10px 10px !important;">확인</button>
						</div>
					</div>
				</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>
<script src="/js/member/authEmail.js"></script>