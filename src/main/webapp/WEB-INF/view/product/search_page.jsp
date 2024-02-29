<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- include.jsp -->
<%@ include file="/WEB-INF/view/layout/header.jsp"%>
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

:root {
	--btn-width: 30vw;
	--btn-min-width: 10px;
	--btn-height: 15vh;
	--btn-min-height: 5px;
	--menu-height: calc(var(--btn-height)* 4);
	--menu-min-height: calc(var(--btn-min-height)* 2);
	--border-rad: 5px;
	--font-size: 2vw;
}

* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	list-style: none;
}

body {
	min-height: 100vh;
	background-color: rgb(238, 238, 238);
	justify-content: center;
}

#nav {
	font-family: 'arial';
}

#nav ul {
	width: 100%;
	margin: 0;
	padding: 0;
}

#nav ul.menu li {
	position: relative;
	float: left;
	width: 100%;
	list-style-type: none;
	font-size: 40px;
}

#nav ul.menu li a {
	display: block;
	width: 100%;
	height: 100%;
	line-height: 100px;
	text-indent: 30px;
	color: #000;
	font-weight: bold;
	text-decoration: none;
}

#nav ul.menu li a:hover {
	background: #eee;
}

#nav ul.menu li .sub a {
	position: relative;
	float: left;
	display: block;
	width: 100%;
	z-index: 999;
	background: #ccc;
}

#nav ul.menu li .sub a:hover {
	background: #444;
	color: #fff;
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
		<form action="/product/search-page" method="get">
			<div class="">
				<div class="row">
					<!-- 사이드 바 시작 -->
					<div class="col-sm-3 col-md-2 col-md-offset-1 sidebar">
						<div class="widget">
							&nbsp;
							<div class="search-box">
								<input class="form-control" type="text" placeholder="Search..."
									id="search-text" name="search" id="search-form" />
								<button class="search-btn" type="submit">
									<i class="fa fa-search"></i>
								</button>
							</div>

						</div>

						<!-- 위젯 1번 - 카테고리 별 시작 -->
						<div class="widget">
							<h5 class="widget-title font-alt" id="nav">카테고리 별</h5>
							<ul class="icon-list">
								<li class="menu"><a href="#"
									onclick="onClickMajorCategory('전체' , 0 , '카테고리' ,0)">전체
										카테고리</a> <c:forEach items="${majorCategoryList}" var="major">
										<li class="sub dropdown"><a href="#"
											onclick="onClickMajorCategory('${major.mainCategoryName}' , ${major.categoryId})"
											class="dropdown-toggle" href="#" data-toggle="dropdown">${major.mainCategoryName}</a>

											<ul class="icon-list dropdown-menu">
												<c:forEach items="${subcategoryList}" var="sub">
													<c:if test="${major.categoryId == sub.mainCategoryId}">
														<li><a href="#"
															onclick="onClickSubcategory('${major.mainCategoryName}' , ${major.categoryId} ,'${sub.subcategoryName}', ${sub.categoryId})">${sub.subcategoryName}</a></li>
													</c:if>
												</c:forEach>
											</ul></li>
									</c:forEach>
							</ul>

							<input type="hidden" name="subcategory" id="subcategory-form" />
							<input type="hidden" name="major-category"
								id="majorCategory-form" />
							<div style="padding-top: 30px; padding-bottom: 0px;">
								<span>- 태그 : </span><span id="category-text-form">전체 카테고리</span>
							</div>
						</div>
						<!-- 위젯 1번 - 카테고리 별 종료 -->


						<!-- 위젯 2번 - 별점 별 시작 -->
						<div class="widget">
							<h5 class="widget-title font-alt">별점 별</h5>
							<div class="star_rating">
								<span class="star" value="1"> </span> <span class="star"
									value="2"> </span> <span class="star" value="3"> </span> <span
									class="star" value="4"> </span> <span class="star" value="5">
								</span>
							</div>
							<input type="hidden" name="star" id="star-form" />
						</div>
						<!-- 위젯 2번 - 별점 별 종료 -->

						<!-- 위젯 3번 - 가격 별 시작 -->
						<div class="widget">
							<h5 class="widget-title font-alt">가격 별</h5>
							<div class="search-box">
								<input class="form-control" type="number"
									placeholder="가장 낮은 가격대를 입력해주세요.." id="search-min" step="1000"
									max="99999999" name="min" /> <input class="form-control"
									type="number" placeholder="가장 높은 가격대를 입력해주세요.." id="search-max"
									step="1000" max="99999999" name="max" />
							</div>
						</div>
						<!-- 위젯 3번 - 가격 별 종료 -->

						<div class="widget">
							<button class="btn btn-default btn-round" type="submit"
								style="width: 100%; margin-bottom: 10px;">
								검색 <i class="fa fa-search"></i>
							</button>
							<button class="btn btn-info btn-round" type="button"
								style="width: 100%" onclick="onClickReset()">초기화</button>
						</div>
					</div>
					<!-- 사이드 바 종료 -->

					<!-- 메인 상품 시작 -->
					<div class="col-sm-8">
						<!-- 상품 시작 -->
						<section class="module">
							<div class="container">
								<div class="row multi-columns-row post-columns">
									<c:forEach items="${products}" var="product">
										<div class="col-sm-6 col-md-4 col-lg-4">
											<div class="post">
												<div class="post-thumbnail">
													<a href="/product/productDetail?prod_no=${product.prodNo}"><img
														src="${product.filePath[0]}" alt=" Blog-post Thumbnail" /></a>
												</div>
												<div class="post-header font-alt">
													<h2 class="post-title">
														<a href="#">${product.prodTitle}</a>
													</h2>
													<div class="post-meta">
														평점 &nbsp;<a href="#">${product.star} 점</a>&nbsp;| 출시일 :
														${product.prodRdate}
													</div>
												</div>
												<div class="post-entry">
													<h5
														style="overflow: hidden; height: 65px;">${product.prodSpaceInfo}</h5>
													<br />
													<h6>가격 : ${product.prodPrice}</h6>
													<h6>주소 : ${product.prodFullAddress}</h6>
												</div>
												<div class="post-more">
													<a class="more-link" href="#">${product.mainCategoryName}</a>
												</div>
											</div>
										</div>
									</c:forEach>
								</div>
								<div class="pagination font-alt">
									<c:choose>
										<c:when test="${currentPage < 1}">
											<a href="#"><input type="hidden" /><i
												class="fa fa-angle-left"></i></a>
										</c:when>
										<c:when test="${currentPage >= 1}">
											<a
												href="/product/search-page?page=${currentPage - 1}&majorCategory=${majorCategory}&subcategory=${subcategory}&search=${search}&max=${max}&min=${min}&star=${star}"><input
												type="hidden" /><i class="fa fa-angle-left"></i></a>
										</c:when>
									</c:choose>

									<c:forEach begin="${startPage}" end="${endPage}" var="page">
										<a class="active"
											href="/product/search-page?page=${page - 1}&majorCategory=${majorCategory}&subcategory=${subcategory}&search=${search}&max=${max}&min=${min}&star=${star}">${page}</a>
									</c:forEach>

									<c:choose>
										<c:when test="${currentPage >= endPage || currentPage == endPage - 1}">
											<a href="#"><input type="hidden" /><i
												class="fa fa-angle-right"></i></a>
										</c:when>
										<c:when test="${currentPage < endPage - 1}">
											<a
												href="/product/search-page?page=${currentPage + 1}&majorCategory=${majorCategory}&subcategory=${subcategory}&search=${search}&max=${max}&min=${min}&star=${star}"><input
												type="hidden" /><i class="fa fa-angle-right"></i></a>
										</c:when>
									</c:choose>
								</div>
							</div>
						</section>
						<!-- 상품 종료 -->
					</div>
					<!-- 메인 상품 종료 -->
				</div>
			</div>
		</form>
	</section>

	<!-- 메인 섹션 종료 -->
</div>

<script>
console.log("헬로" +${endPage})
console.log("헬로" +${startPage})
console.log("헬로" +${totalItems})
</script>

<!-- jquery cdn -->
<script src="https://code.jquery.com/jquery-3.7.1.min.js"
	integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
	crossorigin="anonymous"></script>

<script>

	var star = document.querySelector("#star-form");
	var majorCategory = document.querySelector("#majorCategory-form");
	var subcategory = document.querySelector("#subcategory-form");
	var categoryText = document.querySelector("#category-text-form");
	
	// 
	$(document).ready(function(){
		$("#nav ul.sub").hide();
		$("#nav ul.menu li").click(function(){
			$("ul",this).slideToggle("fast");
		});
	});
	
	
	// 별점
	document.addEventListener('DOMContentLoaded', function() {
	    // 별점을 나타내는 요소들을 가져옵니다.
	    var stars = document.querySelectorAll('.star_rating > .star');
		
		 // URL에서 파라미터 부분 추출
	    var urlParams = new URLSearchParams(window.location.search);

	    // 파라미터 값 추출
	    var paramValue = urlParams.get('star');

	    
		console.log(paramValue);

	    // 별점 
	    if(paramValue == null) {
	    	paramValue = 0;
	    }
	 	// 기본적으로 파라미터 값의 별점을 붙입니다.
	    for (var i = 0; i < paramValue; i++) {
	        stars[i].classList.add('on');
	    }
	 	
	 	// 파라미터의 값을 넣어줍니다.
	 	star.value = paramValue;
	})
	
	// 별점 선택
	$('.star_rating > .star').click(function() {
		$(this).parent().children('span').removeClass('on');
		$(this).addClass('on').prevAll('span').addClass('on');
		
		// 속성 뽑아내기
		var form = $(this)
		var starValue = form[0].attributes[1].nodeValue;
		
		// input hidden 값
		star.value = starValue;
	})
	
	// 메이저 카테고리 선택
	const onClickMajorCategory = (categoryName, category) => {
		majorCategory.value = category
		subcategory.value = null
		
		categoryText.innerText = categoryName;
	}
	
	// 서브 카테고리 선택
	const onClickSubcategory = (majorCategoryName , major , subcategoryName , sub) => {
		majorCategory.value = major;
		subcategory.value = sub;
		
		categoryText.innerText = majorCategoryName + " / " + subcategoryName;
	}
	
	// 파라미터 리셋 버튼
	const onClickReset = () => {
		location.href= "/product/search-page";
	}
</script>

<!-- include.jsp -->
<%@ include file="/WEB-INF/view/layout/footer.jsp"%>