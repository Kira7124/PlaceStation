<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/css/cs.css">
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
				<div class="col-sm-8 col-sm-offset-1 ">
					<div class="post">
						<div class="comment-form">
							<h4 class="comment-form-title font-alt">공지사항</h4>
						</div>

						<div class="post-header font-alt"></div>
						<div class="search wow fadeIn">
							<!-- 검색 폼 -->
							<form role="form" action="/cs/notice/search" method="get">

								<div class="search-box ">
									<input type="hidden" name="categoryId" value="${categoryId}" />
									<input class="form-control" type="text" name="searchKeyword"
										placeholder="Search..." value="${searchKeyword}" />
									<button class="search-btn" type="submit">
										<i class="fa fa-search"></i>
									</button>
								</div>
							</form>
						</div>
					</div>
					<div class="comments wow fadeIn">
						<h5 class="button-container">
							<form action="/cs/notice/search">
								<input type="hidden" name="categoryId" value="0" />
								<button class="btn btn-border-d btn-round"
									style="padding: 5px 20px" type="submit">일반</button>
							</form>
							<form action="/cs/notice/search">
								<input type="hidden" name="categoryId" value="1" />
								<button class="btn btn-d btn-round" style="padding: 5px 20px; background-color: #219ebc; border-color: #666;'"
									type="submit">사업자</button>

							</form>
						</h5>
					</div>
					<!-- 공지사항 목록 전체 div -->
					<div>
						<div class="panel panel-default wow fadeIn">

							<c:forEach var="noticeList" items="${noticeList}">
								<div class="panel-heading">
									<h4 class="panel-title font-alt">
										<a class="collapsed" data-toggle="collapse"
											data-parent="#accordion" href="#support${noticeList.nbno}">
											${noticeList.ntitle} </a>
									</h4>
								</div>
								<div class="panel-collapse collapse"
									id="support${noticeList.nbno}">
									<div class="panel-body">${noticeList.ncontent}</div>
								</div>
							</c:forEach>

						</div>
					</div>
					<!-- 공지사항 목록 전체 div -->
					<div class="pagination font-alt wow fadeIn" style="display: flex">
						<c:choose>
							<c:when test="${currentPage > 0}">
								<form action="/cs/notice/search">
									<a
										href="/cs/notice/search?page=${currentPage - 1}&searchKeyword=${searchKeyword}&categoryId=${categoryId}"><i
										class="fa fa-angle-left"></i></a>
								</form>
							</c:when>
							<c:otherwise>
								<a href=""><i class="fa fa-angle-left"></i></a>
							</c:otherwise>
						</c:choose>

						<c:forEach var="i" begin="0"
							end="${totalPages == 0 ? 0  : totalPages - 1}">
							<li class="page-item"><a class="page-link"
								href="/cs/notice/search?categoryId=${categoryId}&page=${i}&searchKeyword=${searchKeyword}">${i + 1}</a>
							</li>
						</c:forEach>

						<c:choose>
							<c:when test="${currentPage < totalPages - 1}">
								<a
									href="/cs/notice/search?page=${currentPage + 1}&searchKeyword=${searchKeyword}&categoryId=${categoryId}"><i
									class="fa fa-angle-right"></i></a>
							</c:when>
							<c:otherwise>
								<a href=""><i class="fa fa-angle-right"></i></a>

							</c:otherwise>
						</c:choose>
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