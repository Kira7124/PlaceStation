<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- Modal -->
<div class="modal fade" id="exampleModalAddress" tabindex="-1"
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
				<label for="name">Address</label> <input type="text" name="zip"
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