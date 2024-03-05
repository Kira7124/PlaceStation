<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- include.jsp -->
<%@ include file="/WEB-INF/view/layout/header.jsp"%>
<style>
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

.post-thumbnail:hover img {
	transform: scale(1.05); /* Enlarge image on hover */
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
<div class="main">

	<!-- 배너 섹션 시작 -->
	<section class="module bg-dark-60 shop-page-header"
		data-background="/assets/images/product/image2.jpg">
		<div class="container">
			<div class="row">
				<div class="col-sm-6 col-sm-offset-3">
					<h2 class="module-title font-alt">배너 이미지</h2>
					<div class="module-subtitle font-serif">A wonderful serenity
						has taken possession of my entire soul, like these sweet mornings
						of spring which I enjoy with my whole heart.</div>
				</div>
			</div>
		</div>
	</section>
	<!-- 배너 섹션 종료 -->

	<!-- selected box 시작 -->
	<section class="module-small">
		<!-- 공지사항 작성 -->
		<div class="row">
			<div class="col-sm-6 col-sm-offset-3">
				<div class="post">
					<div class="comment-form">
						<h4 class="comment-form-title font-alt">공지사항</h4>
						<p>공지 날짜 : ${announcement.partyAnnouncementCreatedAt}</p>
					</div>
					<!-- 공지사항 제목 -->
					<div class="post-header font-alt">

						<h3>제목 : ${announcement.partyAnnouncementTitle}</h3>

					</div>

					<div class="post-quote"
						style="white-space: pre-line; text-align: left;">
						<h4>${announcement.partyAnnouncementDescription}</h4>
					</div>
				</div>
				<div class="row">
					<!-- <div style="text-align: right;"> -->
					<div style="display: flex; justify-content: flex-end; ">
						<c:if test="${member.userno == party.partyHost}">
							<a class="btn btn-success" style="margin-right: 10px" 
								href="/party/announcement/update?announcement-no=${announcement.partyAnnouncementNo}">수정하기</a>

							<form
								action="/party/announcement/delete/${announcement.partyAnnouncementNo}"

								method="post">
								<input type="hidden" name="_method" value="delete" />
								<button class="btn btn-danger" type="submit" >삭제하기</button>
							</form>

						</c:if>
					</div>
				</div>
			</div>
		</div>

	</section>
	<!-- selected box 종료 -->


	<!-- 메인 섹션 시작 -->
	<section class="module">
		<div class="container">
			<div class="post-columns"></div>
		</div>
	</section>
	<!-- 메인 섹션 종료 -->
</div>


<!-- jquery cdn -->
<script src="https://code.jquery.com/jquery-3.7.1.min.js"
	integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
	crossorigin="anonymous"></script>


<!-- include.jsp -->
<%@ include file="/WEB-INF/view/layout/footer.jsp"%>