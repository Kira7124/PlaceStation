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
				<c:if test="${not empty User}">

					<div class="col-md-2 border-right"
						style="margin-top: 5%; display: inline-block; width: 250px;">

						<%@ include file="/WEB-INF/view/layout/myPageAside.jsp"%>
					</div>

					<div class="col-md-8 border-right" style="margin-top: 0%;">



						<div class="p-3 py-5">
							<div
								class="d-flex justify-content-between align-items-center mb-3">

								<!-- 이 폼으로 유저 데이터 업데이트 가능 -->
								<form action="/member/userUpdate" id="form" class="form" method="post">
									<h4 class="text-center" style="font-size: xx-large;">Profile
										Settings</h4>
									<p>ssssss: ${User}</p>
									<br> <br> <input type="hidden" value="${User.userno}"
										name="userno" id="hiddenuserNo" />
									<div class="row mt-2">
										<div class="col-md-6">
											<label class="labels">Name</label><input type="text"
												class="form-control" name="upname" placeholder="name"
												value="${User.username }">
										</div>
										<div class="col-md-6">
											<label class="labels">password</label><input type="password"
												class="form-control" name="uppass" placeholder="surname"
												readonly>

										</div>
									</div>
									<div class="row mt-3">
										<div class="col-md-12">
											<label class="labels">Email</label><input type="text"
												class="form-control" placeholder="enter email"
												value="${User.userid }" name="upemail">

										</div>
										<div class="col-md-12">
											<div style="display: flex; flex-direction: column;">
												<div class="register-form">
													<label for="name">Address</label> <input type="text"
														class="form-control" name="zip" id="zip"
														placeholder="Enter Adress" value="${User.useraddress}"
														onclick="zipcode()" readonly /> <span class="msgZip"></span>
													<div>
														<input type="text" class="form-control" name="addr1"
															id="addr1" size="50" placeholder="Search Address"
															readonly />
													</div>
													<div>
														<input type="text" class="form-control" name="addr2"
															id="addr2" size="50" placeholder="Address Detail" />
													</div>
												</div>
											</div>
										</div>
										<div class="col-md-12">
											<label class="labels">gender</label><input type="text"
												class="form-control" placeholder="enter address line 2"
												value="${User.gender == 'M' ? '남성' : '여성'}" readonly>
										</div>
										<div class="col-md-12">
											<label class="labels">hp</label><input type="text"
												class="form-control" placeholder="enter address line 2"
												name="uphp" value="${User.userhp }">

										</div>
										<div class="col-md-12">
											<label class="labels">Join date</label><input type="text"
												class="form-control" placeholder="education"
												value="${User.joinat}" readonly>
										</div>
									</div>
									<div class="row mt-3">
										<div class="col-md-6">
											<label class="labels">등급</label><input type="text"
												class="form-control" value="${User.grade }" readonly>
										</div>
										<div class="col-md-6">
											<label class="labels">포인트</label><input type="text"
												class="form-control" value="${User.userpoint }" readonly>
										</div>
									</div>
									<br> <br> <br>
									<button class="btn btn-primary profile-button"
										 type="submit"
										style="background-color: #111; border-color: #111;">Save
										Profile</button>
								</form>
							</div>
						</div>
					</div>

				</c:if>
			</div>
		</div>
	</div>
	</div>
</section>
<!--  프로필 content 끝 -->
</div>
</div>

<%@ include file="/WEB-INF/view/member/layout/footer.jsp"%>