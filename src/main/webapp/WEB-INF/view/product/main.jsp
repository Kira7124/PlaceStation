<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- adminheader.jsp -->
<%@ include file="/WEB-INF/view/layout/header.jsp"%>

<style>
	img {
		border-radius: 10px;
	}

* {margin:0;padding:0;}
	.section input[id*="slide"] {display:none;}
	.section .slidewrap {max-width:1200px;margin:0 auto;}
	.section .slidelist {white-space:nowrap;font-size:0;overflow:hidden;position:relative;}
	.section .slidelist > li {display:inline-block;vertical-align:middle;width:100%;transition:all .5s;}
	.section .slidelist > li > a {display:block;position:relative;}
	.section .slidelist > li > a img {width:100%;}
	.section .slidelist label {position:absolute;z-index:10;top:50%;transform:translateY(-50%);padding:50px;cursor:pointer;}
	.section .slidelist .textbox {position:absolute;z-index:1;top:50%;left:50%;transform:translate(-50%,-50%);line-height:1.6;text-align:center;}
	.section .slidelist .textbox h3 {font-size:36px;color:#fff;;transform:translateY(30px);transition:all .5s;}
	.section .slidelist .textbox p {font-size:16px;color:#fff;opacity:0;transform:translateY(30px);transition:all .5s;}
	
	/* input에 체크되면 슬라이드 효과 */
	.section input[id="slide01"]:checked ~ .slidewrap .slidelist > li {transform:translateX(0%);}
	.section input[id="slide02"]:checked ~ .slidewrap .slidelist > li {transform:translateX(-100%);}
	.section input[id="slide03"]:checked ~ .slidewrap .slidelist > li {transform:translateX(-200%);}

	/* input에 체크되면 텍스트 효과 */
	.section input[id="slide01"]:checked ~ .slidewrap li:nth-child(1) .textbox h3 {opacity:1;transform:translateY(0);transition-delay:.2s;}
	.section input[id="slide01"]:checked ~ .slidewrap li:nth-child(1) .textbox p {opacity:1;transform:translateY(0);transition-delay:.4s;}
	.section input[id="slide02"]:checked ~ .slidewrap li:nth-child(2) .textbox h3 {opacity:1;transform:translateY(0);transition-delay:.2s;}
	.section input[id="slide02"]:checked ~ .slidewrap li:nth-child(2) .textbox p {opacity:1;transform:translateY(0);transition-delay:.4s;}
	.section input[id="slide03"]:checked ~ .slidewrap li:nth-child(3) .textbox h3 {opacity:1;transform:translateY(0);transition-delay:.2s;}
	.section input[id="slide03"]:checked ~ .slidewrap li:nth-child(3) .textbox p {opacity:1;transform:translateY(0);transition-delay:.4s;}

	/* 좌,우 슬라이드 버튼 */
	.slide-control > div {display:none;}
	.section .left {left:30px;background:url('./img/left.png') center center / 100% no-repeat;}
	.section .right {right:30px;background:url('./img/right.png') center center / 100% no-repeat;}
	.section input[id="slide01"]:checked ~ .slidewrap .slide-control > div:nth-child(1) {display:block;}
	.section input[id="slide02"]:checked ~ .slidewrap .slide-control > div:nth-child(2) {display:block;}
	.section input[id="slide03"]:checked ~ .slidewrap .slide-control > div:nth-child(3) {display:block;}

	/* 페이징 */
	.slide-pagelist {text-align:center;padding:20px;}
	.slide-pagelist > li {display:inline-block;vertical-align:middle;}
	.slide-pagelist > li > label {display:block;padding:8px 30px;border-radius:30px;background:#ccc;margin:20px 10px;cursor:pointer;}
	.section input[id="slide01"]:checked ~ .slidewrap .slide-pagelist > li:nth-child(1) > label {background:#999;}
	.section input[id="slide02"]:checked ~ .slidewrap .slide-pagelist > li:nth-child(2) > label {background:#999;}
	.section input[id="slide03"]:checked ~ .slidewrap .slide-pagelist > li:nth-child(3) > label {background:#999;}
</style>

	



<div class="main">
	<!-- 배너 이미지 -->
	
	<div class="section" style="margin-top: 150px; margin-left: 80px;">
		<input type="radio" name="slide" id="slide01" checked>
		<input type="radio" name="slide" id="slide02">
		<input type="radio" name="slide" id="slide03">
	<div class="slidewrap">
		
		<ul class="slidelist">
			<!-- 슬라이드 영역 -->
			<li class="slideitem">
				<a>
					<div class="textbox">
						<h3>첫번째 슬라이드</h3>
						<p>첫번째 슬라이드 입니다.</p>
					</div>
					<img src="/assets/img/dog.jpg">
				</a>
			</li>
			<li class="slideitem">
				<a>
					
					<div class="textbox">
						<h3>두번째 슬라이드</h3>
						<p>두번째 슬라이드 입니다.</p>
					</div>
					<img src="/assets/img/cat.jpg">
				</a>
			</li>
			<li class="slideitem">
				<a>
					
					<div class="textbox">
						<h3>두번째 슬라이드</h3>
						<p>두번째 슬라이드 입니다.</p>
					</div>
					<img src="/assets/img/bird.jpg">
				</a>
			</li class="slideitem">

			<!-- 좌,우 슬라이드 버튼 -->
			<div class="slide-control">
				<div>
					<label for="slide03" class="left"></label>
					<label for="slide02" class="right"></label>
				</div>
				<div>
					<label for="slide01" class="left"></label>
					<label for="slide03" class="right"></label>
				</div>
				<div>
					<label for="slide02" class="left"></label>
					<label for="slide01" class="right"></label>
				</div>
			</div>

		</ul>
		<!-- 페이징 -->
		<ul class="slide-pagelist">
			<li><label for="slide01"></label></li>
			<li><label for="slide02"></label></li>
			<li><label for="slide03"></label></li>
		</ul>
	</div>

	
</div>
 	 









	<!-- PlaceStation의 추천!! -->
	<section class="module" id="news" style="margin-top: 50px;">
		<div class="container">
			<div class="row">
				<div class="col-sm-6 col-sm-offset-3">
					<h2 class="module-title font-alt">PlaceStation의 추천</h2>
					<div class="module-subtitle font-serif">설명~</div>
				</div>
			</div>
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
	</section>

	<!-- 1번 상품 리스트 (전체 조회) -->
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
					<h2 class="module-title font-alt">전체 보기</h2>
				</div>
			</div>
			<a class="btn btn-b btn-round" href="/product/search-page"
				style="float: right; margin-bottom: 10px;">전체 조회</a>
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


	<!-- 2번째 상품 (리뷰가 많은 순서)  -->
	<section class="module">
		<div class="container">
			<div class="row">
				<div class="col-sm-6 col-sm-offset-3">
					<h2 class="module-title font-alt">리뷰 많은 순</h2>
					<div class="module-subtitle font-serif">The languages only
						differ in their grammar, their pronunciation and their most common
						words.</div>
				</div>
			</div>
			<a class="btn btn-b btn-round" href="/product/search-page"
				style="float: right; margin-bottom: 10px;">전체 조회</a>
			<div class="row" style="clear: both;">
				<div class="owl-carousel text-center" data-items="5"
					data-pagination="false" data-navigation="false">
					<c:forEach var="product" items="${productsRev}">
						<div class="owl-item">
							<div class="col-sm-12">
								<div class="ex-product">
									<div class="shop-item">
										<div class="shop-item-image">
											<img src="${fn:split(product.filePath, ',')[0]}"
												alt="${product.prodTitle}" />
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
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</section>


	<!-- 3번 상품 리스트 (새로 등록된 순) -->
	<section class="module" id="specialities">
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
					<h2 class="module-title font-alt">새로 등록됐어요</h2>
				</div>
			</div>
			<a class="btn btn-b btn-round" href="/product/search-page"
				style="float: right; margin-bottom: 10px;">전체 조회</a>
			<div class="row multi-columns-row" style="clear: both;">

				<c:forEach var="product" items="${productsStart}">
					<div class="col-sm-6 col-md-3 col-lg-3">
						<div class="shop-item">
							<div class="shop-item-image">
								<img src="${fn:split(product.filePath, ',')[0]}"
									alt="${product.prodTitle}" />
								<div class="shop-item-detail">
									<a class="btn btn-round btn-b"
										href="productDetail?prod_no=${product.prodNo}"> <span
										class="icon-basket">보러가기</span>
									</a>
								</div>
							</div>
							<div class="shop-item-info">
								<h4 class="shop-item-title font-alt">
									<a href="productDetail?prod_no=${product.prodNo}">${product.prodTitle}</a>
								</h4>
								<div class="shop-item-price">${product.prodPrice}원/시간</div>
								<div class="shop-item-maximum">최대 ${product.prodMaximumPeople}인 ${product.prodStartTime}시~${product.prodEndTime}시</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>


		</div>
	</section>

	<!-- owl carousel 2 번 -->
	<section class="module">
		<div class="container">
			<div class="row">
				<div class="col-sm-6 col-sm-offset-3">
					<h2 class="module-title font-alt">평점 높은 순</h2>
					<div class="module-subtitle font-serif">The languages only
						differ in their grammar, their pronunciation and their most common
						words.</div>
				</div>
			</div>
			<a class="btn btn-b btn-round" href="/product/search-page"
				style="float: right; margin-bottom: 10px;">전체 조회</a>

			<div class="row" style="clear: both;">
				<div class="owl-carousel text-center" data-items="5"
					data-pagination="false" data-navigation="false">
					<c:forEach var="product" items="${productsStar}">
						<div class="owl-item">
							<div class="col-sm-12">
								<div class="ex-product">
									<div class="shop-item">
										<div class="shop-item-image">
											<img src="${fn:split(product.filePath, ',')[0]}"
												alt="${product.prodTitle}" />
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
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</section>

	<!-- 리퀘스트 시작 -->
	<section class="module bg-dark-60 request-cta"
		data-background="assets/images/finance/rqst_bg.jpg">
		<div class="container">
			<div class="row">
				<div class="col-sm-4">
					<h2 class="font-alt">Request a call back</h2>
					<p>Would you like to speak to one of our financial advisers
						over the phone? Just submit your details and we’ll be in touch
						shortly. You can also email us if you would prefer.</p>
				</div>
				<div class="col-sm-8">
					<div class="row">
						<form class="form rqst-form" id="requestACall" role="form"
							method="post" action="php/request_call.php">
							<div class="form-group col-sm-6 col-xs-12">
								<input class="form-control input-lg" type="text" name="name"
									placeholder="Name" />
							</div>
							<div class="form-group col-sm-6 col-xs-12">
								<select class="form-control input-lg" name="subject">
									<option value="subject1" disabled="" selected="">Subject</option>
									<option value="BusinessConsulting">Business consulting</option>
									<option value="MarketingStrategy">Marketing Strategy</option>
									<option value="TaxesAdvisory">Taxes Advisory</option>
									<option value="InvestmentPlanning">Investment Planning</option>
									<option value="ITManagement">IT Management</option>
									<option value="DataAnalytics">Data Analytics</option>
								</select>
							</div>
							<div class="form-group col-sm-6 col-xs-12">
								<input class="form-control input-lg" type="text" name="phone"
									placeholder="Phone Number" />
							</div>
							<div class="form-group col-sm-6 col-xs-12">
								<button class="btn btn-border-w btn-circle btn-block"
									id="racSubmit" type="submit">
									<i class="fa fa-paper-plane-o"></i> Submit
								</button>
							</div>
							<div id="requestFormResponse"></div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>
	
	
	
	
	





<!-- include.jsp -->
<%@ include file="/WEB-INF/view/layout/footer.jsp"%>