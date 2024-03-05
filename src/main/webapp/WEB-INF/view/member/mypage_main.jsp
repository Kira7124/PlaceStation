<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/layout/header.jsp"%>

<!-- mypage content 시작 -->

<!--  프로필 content 시작  -->
<section class="module"
	style="align-items: center; align-content: space-between; flex-wrap: nowrap; flex-direction: row-reverse; justify-content: flex-start;">
	<div class="container rounded bg-white mt-5 mb-5"
		style="display: flex; align-content: space-between; flex-wrap: wrap; flex-direction: row; align-items: baseline; margin-top: 7%;">
		<div class="row" style="flex-direction: column;">

			<div class="col-md-10 border-right"
				style="display: flex; justify-content: space-between;">
				<div class="col-md-2 border-right"
					style="margin-top: 5%; display: inline-block; width: 250px;">
					<div>
						<div
							class="d-flex flex-column align-items-center text-center p-3 py-5"
							style="position: relative;">
							<img class="rounded-circle mt-5" id="profileImage"
								style="border-radius: 50%; /* 이 값은 원의 반지름을 결정합니다. 50%는 이미지를 완전한 원 모양으로 만듭니다. */ overflow: hidden; /* border-radius를 사용할 때 이미지의 경계를 제대로 처리하기 위해 필요합니다. */ width: 200px; /* 이미지의 너비 */ height: 200px; /"
								src="http://localhost/filedb/get-file/1d1e60d9470e4d39827b7ee5f4ff296b">

							<input type="file" id="fileInput" style="display: none;" />

						</div>
					</div>
					<br> <br>
					<%@ include file="/WEB-INF/view/layout/myPageAside.jsp"%>
				</div>

				<div class="col-md-8 border-right" style="margin-top: 0%;">
					
				

					<div class="p-3 py-5">
						<div
							class="d-flex justify-content-between align-items-center mb-3">
							<form action="/mypage/userUpdate" id="form" class="form"
								method="post">
								<!-- 이 폼으로 유저 데이터 업데이트 가능 -->
								<c:if test="${not empty User}">
										<h4 class="text-center" style="font-size: xx-large;">Profile
											Settings</h4>
										<p>ssssss: ${User}</p>
										<br>
										<br>
										<input type="hidden" value="${User.userno}" name="userNo"
											id="hiddenuserNo" />
										<div class="row mt-2">
											<div class="col-md-6">
												<label class="labels">Name</label><input type="text"
													class="form-control" name="userName" placeholder="name"
													value="${User.username }">
											</div>
											<div class="col-md-6">
												<label class="labels">password</label><input type="password"
													class="form-control" name="upassword" placeholder="surname"
													readonly>
												<button class="col-md-2 terms-btn"
													style="padding: 3px !important; float: right; color: #fff; width: 38%;"
													type="button" data-toggle="modal"
													data-target="#exampleModalPassword">비밀번호 변경</button>
											</div>
										</div>
										<br>
										<br>
										<br>
										<div class="mt-5 text-center">
											<button class="btn btn-primary profile-button"
												name="profile-button" type="submit"
												style="background-color: #111; border-color: #111;">Save
												Profile</button>
										</div>
									</c:if>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!--  프로필 content 끝 -->
</div>
</div>

<%@ include file="/WEB-INF/view/layout/myPageUpdatePasswordModal.jsp"%>
<%@ include file="/WEB-INF/view/layout/myPageUpdateEmailModal.jsp"%>
<%@ include file="/WEB-INF/view/layout/myPageUpdateAddressModal.jsp"%>
<%@ include file="/WEB-INF/view/member/layout/footer.jsp"%>