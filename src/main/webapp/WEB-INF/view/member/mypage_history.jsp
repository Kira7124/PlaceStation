<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/member/layout/header.jsp"%>
<!-- history content 시작 -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/boxicons/2.1.0/css/boxicons.min.css"
	integrity="sha512-pVCM5+SN2+qwj36KonHToF2p1oIvoU3bsqxphdOIWMYmgr4ZqD3t5DjKvvetKhXGc/ZG5REYTT6ltKfExEei/Q=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/MaterialDesign-Webfont/5.3.45/css/materialdesignicons.css"
	integrity="sha256-NAxhqDvtY0l4xn+YVa6WjAcmd94NNfttjNsDmNatFVc="
	crossorigin="anonymous" />
<style>
body {
	margin-top: 20px;
	background-color: #eee;
}

.project-list-table {
	border-collapse: separate;
	border-spacing: 0 12px
}

.project-list-table tr {
	background-color: #fff
}

.table-nowrap td, .table-nowrap th {
	white-space: nowrap;
}

.table-borderless>:not(caption)>*>* {
	border-bottom-width: 0;
}

.table>:not(caption)>*>* {
	padding: 0.75rem 0.75rem;
	background-color: var(--bs-table-bg);
	border-bottom-width: 1px;
	box-shadow: inset 0 0 0 9999px var(--bs-table-accent-bg);
}

.avatar-sm {
	height: 2rem;
	width: 2rem;
}

.rounded-circle {
	border-radius: 50% !important;
}

.me-2 {
	margin-right: 0.5rem !important;
}

img, svg {
	vertical-align: middle;
}

a {
	color: #3b76e1;
	text-decoration: none;
}

.badge-soft-danger {
	color: #f56e6e !important;
	background-color: rgba(245, 110, 110, .1);
}

.badge-soft-success {
	color: #63ad6f !important;
	background-color: rgba(99, 173, 111, .1);
}

.badge-soft-primary {
	color: #3b76e1 !important;
	background-color: rgba(59, 118, 225, .1);
}

.badge-soft-info {
	color: #57c9eb !important;
	background-color: rgba(87, 201, 235, .1);
}

.avatar-title {
	align-items: center;
	background-color: #3b76e1;
	color: #fff;
	display: flex;
	font-weight: 500;
	height: 100%;
	justify-content: center;
	width: 100%;
}

.bg-soft-primary {
	background-color: rgba(59, 118, 225, .25) !important;
}
</style>
<!--  프로필 content 시작  -->
<section class="module"
	style="align-items: center; align-content: space-between; flex-wrap: nowrap; flex-direction: row-reverse; justify-content: flex-start;">
	<div class="container rounded bg-white mt-5 mb-5"
		style="display: flex; align-content: space-between; flex-wrap: wrap; flex-direction: row; align-items: baseline;">
		<div class="row" style="flex-direction: column;">

			<div class="col-md-10 border-right"
				style="display: flex; justify-content: space-between;">
				<div class="col-md-2 border-right"
					style="margin-top: 5%; display: inline-block; width: 250px;">
					<div>
						<div
							class="d-flex flex-column align-items-center text-center p-3 py-5"
							style="position: relative;">
							<img class="rounded-circle mt-5" width="150px"
								src="https://st3.depositphotos.com/15648834/17930/v/600/depositphotos_179308454-stock-illustration-unknown-person-silhouette-glasses-profile.jpg">
							<span class="font-weight-bold"
								style="border: solid 2px #a1a1a1; border-radius: 10px; width: 100px; height: 30px; display: inline-block;">
								change photo</span>
						</div>
					</div>
					<br> <br>
					<%@ include file="/WEB-INF/view/layout/myPageAside.jsp"%>
				</div>
				<!-- 리스트 start -->
				<div class="container"
					style="display: flex; flex-direction: column; justify-content: space-between;">
					<div class="row align-items-center">
						<div class="col-md-6">
							<div class="mb-3">
								<h2 class="card-title">결제내역</h2>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-lg-12">
							<div class="">
								<div class="table-responsive">
									<table
										class="table project-list-table table-nowrap align-middle table-borderless">
										<thead>
											<tr>

												<th scope="col">거래 번호</th>
												<th scope="col">예약된 시간</th>
												<th scope="col">예약 가격</th>
												<th scope="col">거래 날짜</th>
												<th scope="col" style="width: 200px;">환불신청</th>
											</tr>
										</thead>
										<tbody>

											<c:forEach items="${history}" var="his">
												<form action="/payment/reservation-management/user/refund"
													method="post">
													<input type="hidden" name="reason" value="거래 환불 요청" /> <input
														type="hidden" name="merchantUid" value="${his.adminHisNo}" />
													<input type="hidden" name="adminHisCreatedAt"
														value="${his.adminHisCreatedAt}" /> <input type="hidden"
														name="adminHisSellerId" value="${his.adminHisSellerId}" />
													<input type="hidden" name="purchaseDate"
														value="${his.purchaseDate}" /> <input type="hidden"
														name="adminHisPrice" value="${his.adminHisPrice}" /> <input
														type="hidden" name="adminHisCharge"
														value="${his.adminHisCharge}" /> <input type="hidden"
														name="adminHisSavePoint" value="${his.adminHisSavePoint}" />
													<input type="hidden" name="adminHisUsePoint"
														value="${his.adminHisUsePoint}" /> <input type="hidden"
														name="adminHisDiscount" value="${his.adminHisDiscount}" />
													<tr>
														<td><img
															src="https://bootdey.com/img/Content/avatar/avatar1.png"
															alt="" class="avatar-sm rounded-circle me-2" /><a
															href="#" class="text-body">${his.adminHisNo}</a></td>
														<td><span class="badge badge-soft-success mb-0">
																${his.purchaseDate}&nbsp;${his.startTime}시&nbsp;~&nbsp;${his.endTime}시
														</span></td>
														<td>${his.adminHisPrice + his.adminHisCharge}</td>
														<td>${his.adminHisCreatedAt}</td>
														<td>
															<ul class="list-inline mb-0">
																<c:choose>
																	<c:when test="${his.cancelYn == 'N'}">
																		<button class="list-inline-item">
																			<i class="bx bx-trash-alt font-size-18"></i>
																		</button>
																	</c:when>
																	<c:otherwise>
																		<button class="list-inline-item btn btn-secondary">
																			환불완료</button>
																	</c:otherwise>
																</c:choose>

															</ul>
														</td>
													</tr>
												</form>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
					<div class="row g-0 align-items-center pb-4">
						<div class="col-sm-6">
							<div class="float-sm-end">
								<ul class="pagination mb-sm-0">
									<c:choose>
										<c:when test="${currentPage > 0}">
											<li class="page-item"><a
												href="/user/mypage/history?page=${currentPage - 1}"
												class="page-link"> <i class="mdi mdi-chevron-left"></i>
											</a></li>
										</c:when>
										<c:otherwise>
											<li class="page-item"><a href=""
												class="page-link"> <i class="mdi mdi-chevron-left"></i>
											</a></li>
										</c:otherwise>
									</c:choose>
									<c:forEach begin="0" end="${totalPages == 0 ? 0 : totalPages - 1}" var="page">
										<li class="page-item"><a href="/user/mypage/history?page=${page}" class="page-link">${page + 1}</a></li>
									</c:forEach>
									
									<c:choose>
										<c:when test="${currentPage < totalPages - 1}">
										<li class="page-item"><a href="/user/mypage/history?page=${currentPage + 1}" class="page-link"><i
											class="mdi mdi-chevron-right"></i></a></li>
										</c:when>
										<c:otherwise>
										<li class="page-item"><a href="" class="page-link"><i
											class="mdi mdi-chevron-right"></i></a></li>
										</c:otherwise>
									</c:choose>
									
								</ul>
							</div>
						</div>
					</div>
				</div>
				<!-- 리스트 end -->
			</div>
		</div>
	</div>
</section>
<!--  프로필 content 끝 -->
</div>
</div>
<%@ include file="/WEB-INF/view/member/layout/footer.jsp"%>