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
								<h4 class="comment-form-title font-alt">자주 묻는 질문</h4>

							</div>
							<div class="post-header font-alt"></div>
							<div></div>
						</div>
						<div class="comments"></div>
						<div>
							<div class="panel panel-default">
							<c:forEach var="faqList" items="${faqList}">
								<div class="panel-heading">
									<h4 class="panel-title font-alt">
										<a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#support${faqList.fbno}">
											${faqList.ftitle}
										</a>
									</h4>
								</div>
								<div class="panel-collapse collapse" id="support${faqList.fbno}">
									<div class="panel-body">
										${faqList.fcontent}
									</div>
								</div>
								</c:forEach>
							</div>
						</div>
						<div class="pagination font-alt">
							<a href="#"><i class="fa fa-angle-left"></i></a><a class="active"
								href="#">1</a><a href="#">2</a><a href="#">3</a><a href="#">4</a><a
								href="#"><i class="fa fa-angle-right"></i></a>
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