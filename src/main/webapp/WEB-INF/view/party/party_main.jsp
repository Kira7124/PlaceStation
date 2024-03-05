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
	<form action="/party/main">
		<section class="module">
			<div class="container">
				<div class="search-box col-md-6 col-md-offset-4">
					<input class="form-control" type="text" name="partyTitle"
						placeholder="Search..." />
					<button class="search-btn" type="submit"
						style="margin-right: 10px;">
						<i class="fa fa-search"></i>
					</button>
				</div>
			</div>
		</section>
		<!-- selected box 종료 -->=
	</form>
	<!-- 메인 섹션 시작 -->
	<section class="module">
		<div class="container">
			<div class="post-columns">

				<c:forEach items="${partyList}" var="party">
					<div class="col-sm-6 col-md-4 col-lg-4">
						<div class="post">
							<div class="post-thumbnail">
								<a href="/party/detail/${party.partyNo}"><img
									src="${party.filePath}" alt="Blog-post Thumbnail" /></a>
							</div>
							<div class="post-header font-alt">
								<h2 class="post-title">
									<a href="#">${party.partyTitle}</a>
								</h2>
								<div class="post-meta">
									생성일자&nbsp;<a href="#"></a>&nbsp;| ${party.partyCreatedAt}
								</div>
							</div>
							<div class="post-entry">
								<p>${party.partyDescription}</p>
							</div>
							<div class="post-more">
								<a class="more-link" href="#">${party.partyMaximumPeople} 명</a>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</section>
	<!-- 메인 섹션 종료 -->
	<section class="container">

		<ul class="pagination font-alt">
			<li class="page-item"><c:choose>
					<c:when test="${currentPage > 0}">
						<a class="page-link"
							href="/party/main?page=${currentPage - 1}&partyTitle=${partyTitle}"
							aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
						</a>

					</c:when>

					<c:otherwise>
						<a class="page-link" href="" aria-label="Previous"> <span
							aria-hidden="true">&laquo;</span>
						</a>
					</c:otherwise>
				</c:choose></li>

			<c:forEach begin="${0}" end="${totalPages == 0 ? 0 : totalPages - 1}"
				var="var">
				<li class="page-item"><a class="page-link"
					href="/party/main?page=${var}&partyTitle=${partyTitle}">${var + 1}</a></li>

			</c:forEach>


			<li class="page-item"><c:choose>
					<c:when test="${currentPage < totalPages - 1}">
						<a class="page-link"
							href="/party/main?page=${currentPage + 1}&tpartyTitle=${partyTitle}"
							aria-label="Next"> <span aria-hidden="true">&raquo;</span>
						</a>

					</c:when>
					<c:otherwise>
						<a class="page-link" href="" aria-label="Next"> <span
							aria-hidden="true">&raquo;</span>
						</a>
					</c:otherwise>
				</c:choose></li>
		</ul>


	</section>

</div>


<!-- jquery cdn -->
<script src="https://code.jquery.com/jquery-3.7.1.min.js"
	integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
	crossorigin="anonymous"></script>


<!-- include.jsp -->
<%@ include file="/WEB-INF/view/layout/footer.jsp"%>