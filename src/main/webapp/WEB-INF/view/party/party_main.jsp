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
		<div class="container">
			<form class="row">
				<div class="col-sm-4 mb-sm-20">
					<select class="form-control">
						<option selected="selected" value="">대분류</option>
						<option>Popular</option>
						<option>Latest</option>
					</select>
				</div>
				<div class="col-sm-2 mb-sm-20">
					<select class="form-control">
						<option selected="selected">소분류</option>
						<option>Man</option>
					</select>
				</div>
				<div class="col-sm-3 mb-sm-20">
					<select class="form-control">
						<option selected="selected">가격</option>
						<option>1000 ~ 5000</option>
						<option>1000 ~ 10000</option>
						<option>10000 ~ 50000</option>
						<option>50000 ~ 100000</option>
					</select>
				</div>
				<div class="col-sm-3">
					<button class="btn btn-block btn-round btn-g" type="submit">조회</button>
				</div>
			</form>
		</div>
	</section>
	<!-- selected box 종료 -->

	<!-- 메인 섹션 시작 -->
	<section class="module">
		<div class="container">
			<div class="post-columns">

				<c:forEach items="${partyList}" var="party">
					<div class="col-sm-6 col-md-4 col-lg-4">
						<div class="post">
							<div class="post-thumbnail">
								<a href="/party/detail/${party.partyNo}"><img src="/assets/images/product/image2.jpg"
									alt="Blog-post Thumbnail" /></a>
							</div>
							<div class="post-header font-alt">
								<h2 class="post-title">
									<a href="#">${party.partyTitle}</a>
								</h2>
								<div class="post-meta">
									생성일자&nbsp;<a href="#"></a>&nbsp;|
									${party.partyCreatedAt}
								</div>
							</div>
							<div class="post-entry">
								<p>${party.partyDescription}</p>
							</div>
							<div class="post-more">
								<a class="more-link" href="#">Read more</a>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</section>
	<!-- 메인 섹션 종료 -->
	<section class="container">
		<div class="pagination font-alt">
			<a href="#"><i class="fa fa-angle-left"></i></a><a class="active"
				href="#">1</a><a href="#">2</a><a href="#">3</a><a href="#">4</a><a
				href="#"><i class="fa fa-angle-right"></i></a>
		</div>
	</section>
</div>


<!-- jquery cdn -->
<script src="https://code.jquery.com/jquery-3.7.1.min.js"
	integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
	crossorigin="anonymous"></script>


<!-- include.jsp -->
<%@ include file="/WEB-INF/view/layout/footer.jsp"%>