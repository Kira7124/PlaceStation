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

.main {
	margin-top: 100px;
}
</style>

<div class="main">
	<section class="module-small">
		<div class="container">
			<div class="row">
				<!-- 사이드바 시작 -->
				<div class="col-sm-4 col-md-3 sidebar">
					<div class="widget">
						<form role="form">
							<div class="search-box">
								<input class="form-control" type="text" placeholder="Search..." />
								<button class="search-btn" type="submit">
									<i class="fa fa-search"></i>
								</button>
							</div>
						</form>
					</div>
					<div class="widget">
						<h5 class="widget-title font-alt">공지 사항</h5>
						<ul class="icon-list">
							<li><a href="#">Photography - 7</a></li>
							<li><a href="#">Web Design - 3</a></li>
							<li><a href="#">Illustration - 12</a></li>
							<li><a href="#">Marketing - 1</a></li>
							<li><a href="#">Wordpress - 16</a></li>
						</ul>
					</div>

					<div class="widget">
						<h5 class="widget-title font-alt">이런 모임은 어떠세요?</h5>
						<ul class="icon-list">
							<li>Maria on <a href="#">Designer Desk Essentials</a></li>
							<li>John on <a href="#">Realistic Business Card Mockup</a></li>
							<li>Andy on <a href="#">Eco bag Mockup</a></li>
							<li>Jack on <a href="#">Bottle Mockup</a></li>
							<li>Mark on <a href="#">Our trip to the Alps</a></li>
						</ul>
					</div>
				</div>
				<!-- 사이드바 종료 -->

				<!-- 본문 시작 -->
				<div class="col-sm-8 col-sm-offset-1">
					<div class="post">
						<div class="post-thumbnail">
							<img src="/assets/images/product/image2.jpg"
								alt="Blog Featured Image" />
						</div>
						<div class="post-header font-alt">
							<h1 class="post-title">${party.partyName}</h1>
							<div class="post-meta">
								By&nbsp;<a href="#">${party.partyHost}</a>&nbsp;| ${party.partyCreatedAt} |
							</div>
						</div>
						<div class="post-entry">
							<p>모임설명</p>
						</div>
					</div>
					<!-- 본문 종료 -->

					<!-- 사람 인원 칸 시작 -->
					<div class="comments">
						<h4 class="comment-title font-alt">모임 사람들</h4>
						<div class="comment clearfix">
							<div class="comment-avatar">
								<img
									src="https://s3.amazonaws.com/uifaces/faces/twitter/ryanbattles/128.jpg"
									alt="avatar" />
							</div>
							<div class="comment-content clearfix">
								<div class="comment-author font-alt">
									<a href="#">John Doe</a>
								</div>
								<div class="comment-body">
									<p>The European languages are members of the same family.
										Their separate existence is a myth. For science, music, sport,
										etc, Europe uses the same vocabulary. The European languages
										are members of the same family. Their separate existence is a
										myth.</p>
								</div>
								<div class="comment-meta font-alt">
									Today, 14:55 - <a href="#">Reply</a>
								</div>
							</div>
						</div>
					</div>
					<!-- 사람 인원 칸 종료 -->
				</div>
			</div>
	</section>
</div>
<!-- jquery cdn -->
<script src="https://code.jquery.com/jquery-3.7.1.min.js"
	integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
	crossorigin="anonymous"></script>


<!-- include.jsp -->
<%@ include file="/WEB-INF/view/layout/footer.jsp"%>