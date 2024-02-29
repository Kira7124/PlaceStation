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
	<section class="module" id="specialities"
		style="margin-bottom: 0px; , padding: 0px">
		<div class="container">
			<div class="row">
				<div class="col-sm-2 col-sm-offset-5">
					<div class="alt-module-subtitle">
						<span class="holder-w"></span>
						<h5 class="font-serif">Take a look at</h5>
						<span class="holder-w"></span>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-8 col-sm-offset-2">
					<h2 class="module-title font-alt">검색 결과</h2>
				</div>
			</div>
			<a class="btn btn-b btn-round" href="/product/search-page"
				style="float: right; margin-bottom: 10px;">전체 조회</a>

			<!-- 페이징 UI -->
			<div class="pagination">
				<c:if test="${pageVO.prev}">
					<a
						href="?page=${pageVO.startPage - 1}&pageSize=${pageVO.displayPageNum}&searchKeyword=${criteria.searchKeyword}&searchOption=${criteria.searchOption}">&laquo;</a>
				</c:if>
				<c:forEach var="i" begin="${pageVO.startPage}"
					end="${pageVO.endPage}">
					<c:choose>
						<c:when test="${i eq criteria.page}">
							<span class="active">${i}</span>
						</c:when>
						<c:otherwise>
							<a
								href="?page=${i}&pageSize=${pageVO.displayPageNum}&searchKeyword=${criteria.searchKeyword}&searchOption=${criteria.searchOption}">${i}</a>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:if test="${pageVO.next}">
					<a
						href="?page=${pageVO.endPage + 1}&pageSize=${pageVO.displayPageNum}&searchKeyword=${criteria.searchKeyword}&searchOption=${criteria.searchOption}">&raquo;</a>
				</c:if>
			</div>
			<div class="row multi-columns-row" style="clear: both;">

				<c:forEach var="product" items="${products}">
					<div class="col-sm-6 col-md-3 col-lg-3">
						<div class="shop-item">
							<div class="shop-item-image">
								<img src="${product.filePath[0]}" alt="${product.prodTitle}" />
								<div class="shop-item-detail">
									<a class="btn btn-round btn-b"
										href="productDetail?prod_no=${product.prodNo}"><span
										class="icon-basket">보러가기</span></a>
								</div>
							</div>
							<h4 class="shop-item-title font-alt">
								<a href="productDetail?prod_no=${product.prodNo}">${product.prodTitle}</a>
							</h4>
							${product.prodPrice} 원/시간
						</div>
					</div>
				</c:forEach>
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