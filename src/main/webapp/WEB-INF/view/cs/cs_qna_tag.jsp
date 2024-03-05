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
				<%@ include file="/WEB-INF/view/cs/cs_aside.jsp"%>
				<!-- aside bar 끝 -->
				<!-- 메인 시작 -->
				<div class="col-sm-8 col-sm-offset-1">
					<div class="post">
						<div class="comment-form">
							<h4 class="comment-form-title font-alt">1:1 문의</h4>

						</div>
						<div class="post-header font-alt"></div>

						<!-- 카테고리 섹션 -->
						<section class="module">
							<div>
								<div class="panel ">
									<div class="container">
										<ul
											class="works-grid works-grid-gut works-grid-3 works-hover-w col-md-7"
											id="works-grid">
											<c:forEach var="tag" items="${tag}">
												<li class="work-item illustration webdesign"><a
													href="/cs/qna/qna-write/${tag.categoryId}">
														<div class="work-image">
															<img src="${tag.filePath}" alt="Portfolio Item" style="width:75%; height: 75%;" />
														</div>
														<div class="work-caption font-alt">
															<h3 class="work-title">${tag.categoryName}</h3>
															<div class="work-descr">${tag.categoryDescription}</div>
														</div>
												</a></li>
											</c:forEach>
										</ul>
									</div>
								</div>
							</div>
						</section>
						<!-- 카테고리 섹션 종료 -->

						<div></div>
					</div>
				</div>
				<!-- 메인 끝 -->
			</div>
		</div>
	</section>

	<%@ include file="/WEB-INF/view/layout/footer.jsp"%>
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
	<script
		src="/assets/lib/simple-text-rotator/jquery.simple-text-rotator.min.js"></script>
	<script src="/assets/js/plugins.js"></script>
	<script src="/assets/js/main.js"></script>
	</body>
	</html>