<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/layout/header.jsp"%>
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
					<%@ include file="/WEB-INF/view/layout/myPageAside.jsp"%>
				</div>
				<!-- 메인 섹션 시작 -->
					<div class="container">
						<div class="post-columns">
							<h2>여기서 모임을 볼 수 있습니다.</h2>
							<ul>
								<li>1. 자신이 만든 모임 내역</li>
							</ul>
							<c:forEach items="${partyList}" var="party">
								<div class="col-sm-6 col-md-4 col-lg-4">
									<div class="post">
										<div class="post-thumbnail">
											<a
												href="/party/create?adminHisNo=${party.adminHisNo}&prodNo=${party.prodNo}"><img
												src="${party.filePath[0]}" alt="Blog-post Thumbnail" /></a>
										</div>
										<div class="post-header font-alt">
											<h2 class="post-title">
												<a
													href="/party/create?adminHisNo=${party.adminHisNo}&prodNo=${party.prodNo}">${party.prodTitle}</a>
											</h2>
											<div class="post-meta">
												예약 일자&nbsp;<a href="#"></a>&nbsp;| ${party.purchaseDate}
											</div>
										</div>
										<div class="post-entry">
											<p>위치 : ${party.prodFullAddress}</p>
											<p>모임 최대 인원 : ${party.peopleCount}</p>
										</div>
										<div class="post-more">
											<a class="more-link" href="#">${party.mainCategory}</a> <a
												class="more-link" href="#">${party.subcategory}</a>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
				<!-- 메인 섹션 종료 -->
			</div>
		</div>
	</div>
</section>
<!--  프로필 content 끝 -->
</div>
</div>
<%@ include file="/WEB-INF/view/layout/footer.jsp"%>