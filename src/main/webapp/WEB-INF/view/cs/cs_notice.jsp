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
				<div class="col-sm-8 col-sm-offset-1">
					<div class="post">
						<div class="comment-form">
							<h4 class="comment-form-title font-alt">공지사항</h4>
						</div>
						<div class="post-header font-alt"></div>
						<div class="search">
							<!-- 검색 폼 -->
							<form role="form" action="/cs/notice/search" method="get">
								<div class="search-box">
									<input class="form-control" type="text" name="searchKeyword"
										placeholder="Search..." />
									<button class="search-btn" type="submit">
										<i class="fa fa-search"></i>
									</button>
								</div>
							</form>
						</div>
					</div>
					<div class="comments">
						<h5 class="button-container">
							<form action="/cs/notice/search">
								<input type="hidden" name="categoryId" value="0" />
								<input type="hidden" name="searchKeyword" value="" />
								<button class="btn btn-border-d btn-round" style="padding: 5px 20px" type="submit">일반</button>
							</form>
							<form action="/cs/notice/search">
								<input type="hidden" name="categoryId" value="1" />
								<input type="hidden" name="searchKeyword" value="" />
								<button class="btn btn-d btn-round" style="padding: 5px 20px" type="submit">사업자</button>
							</form>
						</h5>
					</div>
					<!-- 공지사항 목록 전체 div -->
					<div>
						<div class="panel panel-default">
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
					<div class="pagination font-alt">
						<c:if test="${pageVO.prev}">
							<a href="/cs/notice?page=${pageVO.startPage - 1}"><i
								class="fa fa-angle-left"></i></a>
						</c:if>

						<c:forEach var="i" begin="${pageVO.startPage}"
							end="${pageVO.endPage}" step="1">
							<c:set var="isActive" value="${pageVO.cri.page == i}" />
							<li class="page-item ${isActive ? 'active' : ''}"><a
								class="page-link"
								href="/cs/notice/category?categoryid=${categoryid}&page=${i}">${i}</a>
							</li>
						</c:forEach>

						<c:if test="${pageVO.next}">
							<a href="/cs/notice?page=${pageVO.endPage + 1}"><i
								class="fa fa-angle-right"></i></a>
						</c:if>
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