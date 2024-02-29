<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- adminheader.jsp -->
<%@ include file="/WEB-INF/view/product/common/header.jsp"%>
<style>
img {
	border-radius: 10px;
}
</style>

<div class="main">
	<!-- 배너 이미지 -->
	<section class="module bg-dark-60 shop-page-header"
		data-background="/assets/images/shop/product-page-bg.jpg">
		<div class="container">
			<div class="row">
				<div class="col-sm-6 col-sm-offset-3">
					<h2 class="module-title font-alt">하~이</h2>
					<div class="module-subtitle font-serif">가나다라마바사</div>
				</div>
			</div>
		</div>
	</section>

	<!-- PlaceStation의 추천!! -->
	<section class="module" id="news">
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

	<hr class="divider-w">
	<section class="module-small">
		<div class="container">
			<div class="row client">
				<div class="owl-carousel text-center" data-items="6"
					data-pagination="false" data-navigation="false">
					<div class="owl-item">
						<div class="col-sm-12">
							<div class="client-logo">
								<img src="/assets/images/client-logo-dark-1.png"
									alt="Client Logo" />
							</div>
						</div>
					</div>
					<div class="owl-item">
						<div class="col-sm-12">
							<div class="client-logo">
								<img src="/assets/images/client-logo-dark-2.png"
									alt="Client Logo" />
							</div>
						</div>
					</div>
					<div class="owl-item">
						<div class="col-sm-12">
							<div class="client-logo">
								<img src="/assets/images/client-logo-dark-3.png"
									alt="Client Logo" />
							</div>
						</div>
					</div>
					<div class="owl-item">
						<div class="col-sm-12">
							<div class="client-logo">
								<img src="/assets/images/client-logo-dark-4.png"
									alt="Client Logo" />
							</div>
						</div>
					</div>
					<div class="owl-item">
						<div class="col-sm-12">
							<div class="client-logo">
								<img src="/assets/images/client-logo-dark-5.png"
									alt="Client Logo" />
							</div>
						</div>
					</div>
					<div class="owl-item">
						<div class="col-sm-12">
							<div class="client-logo">
								<img src="/assets/images/client-logo-dark-1.png"
									alt="Client Logo" />
							</div>
						</div>
					</div>
					<div class="owl-item">
						<div class="col-sm-12">
							<div class="client-logo">
								<img src="/assets/images/client-logo-dark-2.png"
									alt="Client Logo" />
							</div>
						</div>
					</div>
					<div class="owl-item">
						<div class="col-sm-12">
							<div class="client-logo">
								<img src="/assets/images/client-logo-dark-3.png"
									alt="Client Logo" />
							</div>
						</div>
					</div>
					<div class="owl-item">
						<div class="col-sm-12">
							<div class="client-logo">
								<img src="/assets/images/client-logo-dark-4.png"
									alt="Client Logo" />
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>


	<!-- adminheader.jsp -->
	<%@ include file="/WEB-INF/view/product/common/footer.jsp"%>