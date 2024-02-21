<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/view/layout/header.jsp"%>
	</div>
	</nav>
	<div class="main">
		<section class="module-small">
			<div class="container">
				<div class="row">

					<!-- aside bar 시작 -->
					<div class="col-sm-4 col-md-3 sidebar">
						<div class="widget">
							<h5 class="widget-title font-alt">고객센터</h5>
							<ul class="icon-list">
								<li><a href="#">고객센터 홈</a></li>
								<li><a href="#">공지사항</a></li>
								<li><a href="#">1:1 문의</a></li>
								<li><a href="#">FAQ</a></li>
							</ul>
						</div>
					</div>
					<!-- aside bar 끝 -->
					<!-- 메인 시작 -->
					<div class="col-sm-8 col-sm-offset-1">
						<div class="comment-form">
							<h4 class="comment-form-title font-alt">고객센터 글 작성</h4>
							<form method="post">
								<div class="form-group">
									<label class="sr-only" for="name">Name</label> <select
										name="categories" id="cate">
										<option value="">공지사항</option>
										<option value="">FAQ</option>
									</select>
								</div>
								<div class="form-group">
									<label class="sr-only" for="name">Name</label> <input
										class="form-control" id="name" type="text" name="name"
										placeholder="Name" />
								</div>
								<div class="form-group">
									<label class="sr-only" for="email">Name</label> <input
										class="form-control" id="email" type="text" name="email"
										placeholder="E-mail" />
								</div>
								<div class="form-group">
									<textarea class="form-control" id="comment" name="comment"
										rows="10" placeholder="Comment"></textarea>
								</div>
								<button class="btn btn-round btn-d" type="submit">등록</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</section>

		<hr class="divider-d">
		<!-- 하단 작은 푸터 시작 -->
		<footer class="footer bg-dark">
			<div class="container">
				<div class="row">
					<h3>PlaceStation</h3>
					<hr class="divider-d">
					<div class="col-sm-6">
						<p>대표 김진수</p>
						<p>주소 부산광역시 부산진구 중앙대로 749, 범향빌딩 4층</p>
						<p>전화번호 051-912-1000</p>
						<p>© 2024 PlaceStation, All Rights Reserved</p>
					</div>
				</div>
			</div>
		</footer>
		<!-- 하단 작은 푸터 끝-->
	</div>
	<div class="scroll-up">
		<a href="#totop"><i class="fa fa-angle-double-up"></i></a>
	</div>
	</main>
	<!--  
    JavaScripts
    =============================================
    -->
    
    
	<script src="/assets/lib/jquery/dist/jquery.js"></script>
	<script src="/assets/lib/bootstrap/dist/js/bootstrap.min.js"></script>
	<script src="/assets/lib/wow/dist/wow.js"></script>
	<script src="/assets/lib/jquery.mb.ytplayer/dist/jquery.mb.YTPlayer.js"></script>
	<script src="/assets/lib/isotope/dist/isotope.pkgd.js"></script>
	<script src="/assets/lib/imagesloaded/imagesloaded.pkgd.js"></script>
	<script src="/assets/lib/flexslider/jquery.flexslider.js"></script>
	<script src="/assets/lib/owl.carousel/dist/owl.carousel.min.js"></script>
	<script src="/assets/lib/smoothscroll.js"></script>
	<script src="/assets/lib/magnific-popup/dist/jquery.magnific-popup.js"></script>
	<script src="/assets/lib/simple-text-rotator/jquery.simple-text-rotator.min.js"></script>
	<script src="/assets/js/plugins.js"></script>
	<script src="/assets/js/main.js"></script>
</body>
</html>