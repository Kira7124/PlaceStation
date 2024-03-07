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



/* Add padding to product boxes */
img {
	border-radius: 10px;
}

* {
	padding: 0;
	margin: 0;
}

/* Hover Effects */
.post-thumbnail img {
	transition: transform 0.3s ease;
}


/* Transition Effects */
.post-header .post-title a {
	transition: color 0.3s ease;
}

.post-header .post-title a:hover {
	color: #ff9900; /* Change to your desired hover color */
}

/* Border and Box Shadow */
.post {
	border-radius: 10px;
	overflow: hidden;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
	transition: box-shadow 0.3s ease;
	padding: 20px; /* Add padding around the content */
}

.post:hover {
	box-shadow: 0 8px 12px rgba(0, 0, 0, 0.2);
}

/* Gradient Background */
.post {
	background: #fff; /* Fallback color */
	background: linear-gradient(to bottom, rgba(255, 255, 255, 0),
		rgba(255, 255, 255, 0.9));
}

/* Overlay on Images */
.imgBox {
	position: relative;
}

.imgBox::after {
	content: '';
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.2); /* Semi-transparent overlay */
	opacity: 0;
	transition: opacity 0.3s ease;
}

.imgBox:hover::after {
	opacity: 1;
}

/* Animated Loading */
.post-thumbnail img {
	transition: opacity 0.3s ease;
}

.post-thumbnail img.loading {
	opacity: 0.5;
}

/* Carousel */
.multi-columns-row {
	display: flex;
	overflow-x: auto;
	scroll-snap-type: x mandatory;
}

.item {
	flex: 0 0 auto;
	scroll-snap-align: start;
}

/* Adjustments for better readability */
.post-entry h5 {
	margin-bottom: 10px;
}

.post-entry h6 {
	margin-bottom: 5px;
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
					<section>
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
												href="/party/detail/${party.partyNo}"><img
												src="${party.filePath}" alt="Blog-post Thumbnail" /></a>
										</div>
										<div class="post-header font-alt">
											<h2 class="post-title">
												<a
													href="/party/create?adminHisNo=${party.adminHisNo}&prodNo=${party.productNo}">${party.partyTitle}</a>
											</h2>
											<div class="post-meta">
												예약 일자&nbsp;<a href="#"></a>&nbsp;| ${party.partyCreatedAt}
											</div>
										</div>
										<div class="post-entry">
											<p>위치 : ${party.partyDescription}</p>
											<p>모임 최대 인원 : ${party.partyMaximumPeople}</p>
										</div>
										<div class="post-more">
											<a class="more-link" href="#">${party.partyName}</a> <a
												class="more-link" href="#">${party.partyName}</a>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
					</section>
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