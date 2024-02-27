<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- adminheader.jsp -->
<%@ include file="/WEB-INF/view/product/common/header.jsp"%>
<style>
img {
	border-radius: 10px;
}

* {
	padding: 0;
	margin: 0;
}

.star_rating {
	width: 100%;
	box-sizing: border-box;
	display: inline-flex;
	float: left;
	flex-direction: row;
	justify-content: flex-start;
}

.star_rating .star {
	width: 25px;
	height: 25px;
	margin-right: 10px;
	display: inline-block;
	background:
		url('https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FE2bww%2FbtsviSSBz4Q%2F5UYnwSWgTlFt6CEFZ1L3Q0%2Fimg.png')
		no-repeat;
	background-size: 100%;
	box-sizing: border-box;
}

.star_rating .star.on {
	width: 25px;
	height: 25px;
	margin-right: 10px;
	display: inline-block;
	background:
		url('https://blog.kakaocdn.net/dn/b2d6gV/btsvbDoal87/XH5b17uLeEJcBP3RV3FyDk/img.png')
		no-repeat;
	background-size: 100%;
	box-sizing: border-box;
}

.star_box {
	width: 400px;
	box-sizing: border-box;
	display: inline-block;
	margin: 15px 0;
	background: #F3F4F8;
	border: 0;
	border-radius: 10px;
	height: 100px;
	resize: none;
	padding: 15px;
	font-size: 13px;
	font-family: sans-serif;
}

.btn02 {
	display: block;
	width: 400px;
	font-weight: bold;
	border: 0;
	border-radius: 10px;
	max-height: 50px;
	padding: 15px 0;
	font-size: 1.1em;
	text-align: center;
	background: bisque;
}
</style>

<div class="main">
	<!-- 배너 섹션 -->
	<section class="module bg-dark-60 blog-page-header"
		data-background="assets/images/blog_bg.jpg">
		<div class="container">
			<div class="row">
				<div class="col-sm-6 col-sm-offset-3">
					<h2 class="module-title font-alt">배너 섹션</h2>
					<div class="module-subtitle font-serif">광고를 넣을 수 있는 공간입니다.</div>
				</div>
			</div>
		</div>
	</section>
	<!-- 배너 섹션 종료 -->



	<!-- 메인 섹션 시작 -->
	<section class="module">
		<div class="container">
			<div class="row">
				<!-- 사이드 바 시작 -->
				<div class="col-sm-4 col-md-3 col-md-offset-1 sidebar">
					<div class="widget">
					<button class="btn btn-info btn-round" type="button" style="width : 100%" onclick="onClickReset()">초기화</button>
						&nbsp;
						<div class="search-box">
							<input class="form-control" type="text" placeholder="Search..."
								id="search-text" />
							<button class="search-btn" onclick="onClickSideBar()">
								<i class="fa fa-search"></i>
							</button>
						</div>
						
					</div>



					<!-- 위젯 1번 - 카테고리 별 시작 -->
					<div class="widget">
						<h5 class="widget-title font-alt">카테고리 별</h5>
						<ul class="icon-list">
							<c:forEach items="${majorCategoryList}" var="major">
								<li><a href="#"
									onclick="onClickMajorCategory(${major.categoryId})">${major.mainCategoryName}</a>
									<ul class="icon-list">
										<c:forEach items="${subcategoryList}" var="sub">
											<c:if test="${major.categoryId == sub.mainCategoryId}">
												<li style="margin-left: 20px;"><a href="#"
													onclick="onClickSubcategory(${major.categoryId} , ${sub.categoryId})">${sub.subcategoryName}</a></li>
											</c:if>
										</c:forEach>
									</ul></li>
							</c:forEach>
						</ul>
					</div>
					<!-- 위젯 1번 - 카테고리 별 종료 -->


					<!-- 위젯 2번 - 별점 별 시작 -->
					<div class="widget">
						<h5 class="widget-title font-alt">별점 별</h5>
						<div class="star_rating">
							<span class="star on" value="1"> </span> <span class="star"
								value="2"> </span> <span class="star" value="3"> </span> <span
								class="star" value="4"> </span> <span class="star" value="5">
							</span>
						</div>
					</div>
					<!-- 위젯 2번 - 별점 별 종료 -->

					<!-- 위젯 3번 - 가격 별 시작 -->
					<div class="widget">
						<h5 class="widget-title font-alt">가격 별</h5>
						<div class="search-box">
							<input class="form-control" type="number"
								placeholder="가장 낮은 가격대를 입력해주세요.." id="search-min" step="1000" />
							<input class="form-control" type="number"
								placeholder="가장 높은 가격대를 입력해주세요.." id="search-max" step="1000" max="999999"/>
							<button class="search-btn" onclick="onClickSideBar()">
								<i class="fa fa-search"></i>
							</button>
						</div>
					</div>
					<!-- 위젯 3번 - 가격 별 종료 -->
				</div>
				<!-- 사이드 바 종료 -->

				<!-- 메인 상품 시작 -->
				<div class="col-sm-8">
					<!-- 상품 시작 -->
					<section>
						<div class="row multi-columns-row post-columns">
							<div class="col-md-6 col-lg-6">
								<div class="post">
									<div class="post-thumbnail">
										<a href="#"><img src="assets/images/post-1.jpg"
											alt="Blog-post Thumbnail" /></a>
									</div>
									<div class="post-header font-alt">
										<h2 class="post-title">
											<a href="#">Our trip to the Alps</a>
										</h2>
										<div class="post-meta">
											By&nbsp;<a href="#">Mark Stone</a>&nbsp;| 23 November | 3
											Comments
										</div>
									</div>
									<div class="post-entry">
										<p>A wonderful serenity has taken possession of my entire
											soul, like these sweet mornings of spring which I enjoy with
											my whole heart.</p>
									</div>
									<div class="post-more">
										<a class="more-link" href="#">Read more</a>
									</div>
								</div>
							</div>
							<div class="col-md-6 col-lg-6">
								<div class="post">
									<div class="post-thumbnail">
										<a href="#"><img src="assets/images/post-2.jpg"
											alt="Blog-post Thumbnail" /></a>
									</div>
									<div class="post-header font-alt">
										<h2 class="post-title">
											<a href="#">Shore after the tide</a>
										</h2>
										<div class="post-meta">
											By&nbsp;<a href="#">Andy River</a>&nbsp;| 11 November | 4
											Comments
										</div>
									</div>
									<div class="post-entry">
										<p>A wonderful serenity has taken possession of my entire
											soul, like these sweet mornings of spring which I enjoy with
											my whole heart.</p>
									</div>
									<div class="post-more">
										<a class="more-link" href="#">Read more</a>
									</div>
								</div>
							</div>
						</div>
						<div class="pagination font-alt">
							<a href="#"><i class="fa fa-angle-left"></i></a> <a
								class="active" href="#">1</a> <a href="#">2</a> <a href="#">3</a>
							<a href="#">4</a> <a href="#"><i class="fa fa-angle-right"></i></a>
						</div>
					</section>
					<!-- 상품 종료 -->
				</div>
				<!-- 메인 상품 종료 -->
			</div>
		</div>
	</section>

	<!-- 메인 섹션 종료 -->
</div>

<!-- jquery cdn -->
<script src="https://code.jquery.com/jquery-3.7.1.min.js"
	integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
	crossorigin="anonymous"></script>
<script>
	
	var star = 1; // 별점
	var majorCategory = 1; // 메인 카테고리
	var subcategory = 1; // 서브 카테고리
	
	document.addEventListener('DOMContentLoaded', function() {
	    // 별점을 나타내는 요소들을 가져옵니다.
	    var stars = document.querySelectorAll('.star_rating > .star');
		
		 // URL에서 파라미터 부분 추출
	    var urlParams = new URLSearchParams(window.location.search);

	    // 파라미터 값 추출
	    var paramValue = urlParams.get('star');
	    var searchText = urlParams.get('search');
	    var searchMinAmount = urlParams.get('min');
	    var searchMaxAmount = urlParams.get('max');
	    
	    
		console.log(paramValue);
		console.log(searchText);
		console.log(searchMinAmount);
		console.log(searchMaxAmount);
	    // 별점 
	    if(paramValue == null) {
	    	paramValue = 1;
	    }
	 	// 기본적으로 3개의 별점에 불을 켭니다.
	    for (var i = 0; i < paramValue; i++) {
	        stars[i].classList.add('on');
	    }
	 
	 
	    if(searchText != null) {
			var search = document.querySelector("#search-text");
			search.value = searchText;
	    }
	    
	    if(searchMinAmount != null) {
			var search = document.querySelector("#search-min");
			search.value = searchMinAmount;
			
	    }
	    
	    if(searchMaxAmount != null) {
	    	var search = document.querySelector("#search-max");
	    	search.value = searchMaxAmount;
	    }
	})
	
	// 별점 선택
	$('.star_rating > .star').click(function() {
		$(this).parent().children('span').removeClass('on');
		$(this).addClass('on').prevAll('span').addClass('on');
		
		// 속성 뽑아내기
		var form = $(this)
		star = form[0].attributes[1].nodeValue;
		
		console.log(star);
		onClickSideBar();
	})
	
	// 메이저 카테고리 선택
	const onClickMajorCategory = (category) => {
		majorCategory = category;
		
		console.log(majorCategory)
		onClickSideBar();
	}
	
	// 서브 카테고리 선택
	const onClickSubcategory = (major , sub) => {
		majorCategory = major;
		subcategory = sub;
		
		console.log(majorCategory)
		console.log(subcategory)
		onClickSideBar();
	}
	
	// 사이드 바 공략
	const onClickSideBar = () => {
		var searchText = document.querySelector("#search-text");
		var searchMinAmount = document.querySelector("#search-min");
		var searchMaxAmount = document.querySelector("#search-max");
		console.log(searchText.value);
		console.log(searchMinAmount.value);
		console.log(searchMaxAmount.value);
		
		// 전달
		location.href= "/product/search-page?majorCategory=" + majorCategory +
				"&subcategory=" + subcategory + "&search=" + searchText.value 
				+ "&max=" + searchMaxAmount.value + "&min=" + searchMinAmount.value +
				"&star=" + star;
	} 
	
	// 파라미터 리셋 버튼
	const onClickReset = () => {
		location.href= "/product/search-page";
	}
</script>
<!-- adminheader.jsp -->
<%@ include file="/WEB-INF/view/product/common/footer.jsp"%>