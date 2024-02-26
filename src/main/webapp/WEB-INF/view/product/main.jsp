<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- adminheader.jsp -->
<%@ include file="/WEB-INF/view/product/common/header.jsp"%>

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


	<!-- 1번 상품 리스트 -->
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
			<div class="row multi-columns-row">
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


	<!-- owl-carousel 1번째  -->
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
			<div class="row">
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



	<!-- 1번 상품 리스트 -->
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
			<div class="row multi-columns-row">
				<c:forEach var="product" items="${productsStart}">
					<div class="col-sm-6 col-md-3 col-lg-3">
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
			<div class="row">
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





	<!-- EXCLUSIVE PRODUCT -->
	<section class="module">
		<div class="container">
			<div class="row">
				<div class="col-sm-6 col-sm-offset-3">
					<h2 class="module-title font-alt">Exclusive products</h2>
					<div class="module-subtitle font-serif">The languages only
						differ in their grammar, their pronunciation and their most common
						words.</div>
				</div>
			</div>
			<div class="row">
				<div class="owl-carousel text-center" data-items="5"
					data-pagination="false" data-navigation="false">
					<div class="owl-item">
						<div class="col-sm-12">
							<div class="ex-product">
								<a href="#"><img src="/assets/images/shop/product-1.jpg"
									alt="Leather belt" /></a>
								<h4 class="shop-item-title font-alt">
									<a href="#">Leather belt</a>
								</h4>
								£12.00
							</div>
						</div>
					</div>
					<div class="owl-item">
						<div class="col-sm-12">
							<div class="ex-product">
								<a href="#"><img src="/assets/images/shop/product-2.jpg"
									alt="Derby shoes" /></a>
								<h4 class="shop-item-title font-alt">
									<a href="#">Derby shoes</a>
								</h4>
								£54.00
							</div>
						</div>
					</div>
					<div class="owl-item">
						<div class="col-sm-12">
							<div class="ex-product">
								<a href="#"><img src="/assets/images/shop/product-3.jpg"
									alt="Leather belt" /></a>
								<h4 class="shop-item-title font-alt">
									<a href="#">Leather belt</a>
								</h4>
								£19.00
							</div>
						</div>
					</div>
					<div class="owl-item">
						<div class="col-sm-12">
							<div class="ex-product">
								<a href="#"><img src="/assets/images/shop/product-4.jpg"
									alt="Leather belt" /></a>
								<h4 class="shop-item-title font-alt">
									<a href="#">Leather belt</a>
								</h4>
								£14.00
							</div>
						</div>
					</div>
					<div class="owl-item">
						<div class="col-sm-12">
							<div class="ex-product">
								<a href="#"><img src="/assets/images/shop/product-5.jpg"
									alt="Chelsea boots" /></a>
								<h4 class="shop-item-title font-alt">
									<a href="#">Chelsea boots</a>
								</h4>
								£44.00
							</div>
						</div>
					</div>
					<div class="owl-item">
						<div class="col-sm-12">
							<div class="ex-product">
								<a href="#"><img src="/assets/images/shop/product-6.jpg"
									alt="Leather belt" /></a>
								<h4 class="shop-item-title font-alt">
									<a href="#">Leather belt</a>
								</h4>
								£19.00
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<hr class="divider-w">

	<!-- OUR SOLVED CASES -->
	<section class="module sliding-portfolio">
		<div class="row">
			<div class="col-sm-6 col-sm-offset-3">
				<h2 class="module-title font-alt">Our Solved Cases</h2>
			</div>
		</div>
		<div class="container-fluid">
			<div class="row">
				<div class="owl-carousel text-center" data-items="4"
					data-pagination="false" data-navigation="false">
					<div class="owl-item">
						<div class="col-sm-12">
							<div class="work-item">
								<a href="#">
									<div class="work-image">
										<img src="/assets/images/finance/case1.jpg"
											alt="Portfolio Item" />
									</div>
									<div class="work-caption font-alt">
										<h3 class="work-title">Corporate Identity</h3>
										<div class="work-descr">Illustration</div>
									</div>
								</a>
							</div>
						</div>
					</div>
					<div class="owl-item">
						<div class="col-sm-12">
							<div class="work-item">
								<a href="#">
									<div class="work-image">
										<img src="/assets/images/finance/case2.jpg"
											alt="Portfolio Item" />
									</div>
									<div class="work-caption font-alt">
										<h3 class="work-title">Bag MockUp</h3>
										<div class="work-descr">Marketing</div>
									</div>
								</a>
							</div>
						</div>
					</div>
					<div class="owl-item">
						<div class="col-sm-12">
							<div class="work-item">
								<a href="#">
									<div class="work-image">
										<img src="/assets/images/finance/case3.jpg"
											alt="Portfolio Item" />
									</div>
									<div class="work-caption font-alt">
										<h3 class="work-title">Disk Cover</h3>
										<div class="work-descr">Illustration</div>
									</div>
								</a>
							</div>
						</div>
					</div>
					<div class="owl-item">
						<div class="col-sm-12">
							<div class="work-item">
								<a href="#">
									<div class="work-image">
										<img src="/assets/images/finance/case4.jpg"
											alt="Portfolio Item" />
									</div>
									<div class="work-caption font-alt">
										<h3 class="work-title">Corporate Identity</h3>
										<div class="work-descr">Illustration</div>
									</div>
								</a>
							</div>
						</div>
					</div>
					<div class="owl-item">
						<div class="col-sm-12">
							<div class="work-item">
								<a href="#">
									<div class="work-image">
										<img src="/assets/images/finance/case5.jpg"
											alt="Portfolio Item" />
									</div>
									<div class="work-caption font-alt">
										<h3 class="work-title">Bag MockUp</h3>
										<div class="work-descr">Marketing</div>
									</div>
								</a>
							</div>
						</div>
					</div>
					<div class="owl-item">
						<div class="col-sm-12">
							<div class="work-item">
								<a href="#">
									<div class="work-image">
										<img src="/assets/images/finance/case6.jpg"
											alt="Portfolio Item" />
									</div>
									<div class="work-caption font-alt">
										<h3 class="work-title">Disk Cover</h3>
										<div class="work-descr">Illustration</div>
									</div>
								</a>
							</div>
						</div>
					</div>
				</div>
				<div class="col-sm-12">
					<div class="text-center">
						<a class="btn btn-border-d btn-circle mt-50" href="#">View All
							Cases</a>
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