<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- Modal -->
<div class="modal fade" id="exampleModalPassword" tabindex="-1"
	role="dialog" aria-labelledby="exampleModalCenterTitle"
	aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLongTitle">비밀번호 변경</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<!-- 이메일 변경 내용을 입력하는 폼 -->
				<form action="/your-email-change-action" method="post">
					<div style="display: flex; flex-direction: column;">
						<div class="register-form">
							<label for="password">Password</label> <input type="password"
								name="pass1" id="password" placeholder="Enter password">
							<span class="msgPass1">영문, 숫자, 특수문자를 조합하여 8~12자까지 설정해 주세요.</span>
						</div>
						<div class="register-form">
							<label for="password">Confirm Password</label> <input
								type="password" name="userPassword" id="userPassword"
								placeholder="Enter password again"> <span
								class="msgPass2">비밀번호 재입력</span>
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