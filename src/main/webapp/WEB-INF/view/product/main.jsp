<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- adminheader.jsp -->
<%@ include file="/WEB-INF/view/layout/header.jsp"%>
<link rel="stylesheet" href="/css/mainpage.css" />
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>


<div class="main">
	<!-- 배너 이미지 -->
	
	<div class="section" style="margin-top: 150px; margin-left: 50px;">
		<input type="radio" name="slide" id="slide01" checked>
		<input type="radio" name="slide" id="slide02">
		<input type="radio" name="slide" id="slide03">
		<input type="radio" name="slide" id="slide04">
		<input type="radio" name="slide" id="slide05">
	<div class="slidewrap">
		<ul class="slidelist">
			<!-- 슬라이드 영역 -->
			<li class="slideitem">
				<a href="/main/index">
				   <img src="/banner/slogans2.png">
				</a>
			</li>
			<li class="slideitem">
			  <a href="#">
				<c:choose>
				    <c:when test="${not empty bannerlist[1].filePath}">
				        <img src="${bannerlist[1].filePath}" alt="Banner Image" />
				    </c:when>
				    <c:otherwise>
				        <img src="/banner/campings.png" alt="Banner Image" />
				    </c:otherwise>
				</c:choose>
     		  </a>
			</li>
			<li class="slideitem">
			 <a href="#">
				<c:choose>
				    <c:when test="${not empty bannerlist[2].filePath}">
				        <img src="${bannerlist[2].filePath}" alt="Banner Image" />
				    </c:when>
				    <c:otherwise>
				        <img src="/banner/partys.png" alt="Banner Image" />
				    </c:otherwise>
				</c:choose>				
			 </a>
			</li class="slideitem">
			<li class="slideitem">
			 <a href="#">
				<c:choose>
				    <c:when test="${not empty bannerlist[3].filePath}">
				        <img src="${bannerlist[3].filePath}" alt="Banner Image" />
				    </c:when>
				    <c:otherwise>
				        <img src="/banner/sports.png" alt="Banner Image" />
				    </c:otherwise>
				</c:choose>
			 </a>
			</li class="slideitem">
			<li class="slideitem">
				<a href="/main/index">
				   <img src="/banner/community.png">
				</a>
			</li>

			<!-- 좌,우 슬라이드 버튼 -->
			<div class="slide-control">
				<div>
					<label for="slide03" class="left" onclick="changeSlide('slide02')"></label>
					<label for="slide02" class="right"  onclick="changeSlide('slide01')"></label>
				</div>
				<div>
					<label for="slide01" class="left"  onclick="changeSlide('slide01')"></label>
					<label for="slide03" class="right"  onclick="changeSlide('slide03')"></label>
				</div>
				<div>
					<label for="slide02" class="left"  onclick="changeSlide('slide02')"></label>
					<label for="slide01" class="right"  onclick="changeSlide('slide01')"></label>
				</div>
				<div>
					<label for="slide04" class="left" onclick="changeSlide('slide04')"></label>
					<label for="slide03" class="right" onclick="changeSlide('slide03')"></label>
				</div>
				<div>
					<label for="slide05" class="left" onclick="changeSlide('slide05')"></label>
					<label for="slide04" class="right" onclick="changeSlide('slide04')"></label>
				</div>
				<div>
					<label for="slide01" class="left" onclick="changeSlide('slide01')"></label>
					<label for="slide05" class="right" onclick="changeSlide('slide05')"></label>
				</div>

			</div>

		</ul>
		<!-- 페이징 -->
		<ul class="slide-pagelist">
			<li><label for="slide01"></label></li>
			<li><label for="slide02"></label></li>
			<li><label for="slide03"></label></li>
			<li><label for="slide04"></label></li>
			<li><label for="slide05"></label></li>
		</ul>
	</div>
</div>

<script type="text/javascript" src="/js/main/banner.js"></script>

	<!-- PlaceStation의 추천!! -->
	<p>
		session: ${member}
	</p>
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
								href="/product/productDetail?prod_no=${product.prodNo}"><span
								class="icon-basket">보러가기</span></a>
						</div>
					</div>
					<h4 class="shop-item-title font-alt">
						<a href="/product/productDetail?prod_no=${product.prodNo}">${product.prodTitle}</a>
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
								href="/product/productDetail?prod_no=${product.prodNo}"><span
								class="icon-basket">보러가기</span></a>
						</div>
					</div>
					<h4 class="shop-item-title font-alt">
						<a href="/product/productDetail?prod_no=${product.prodNo}">${product.prodTitle}</a>
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
								href="/product/productDetail?prod_no=${product.prodNo}"><span
								class="icon-basket">보러가기</span></a>
						</div>
					</div>
					<h4 class="shop-item-title font-alt">
						<a href="/product/productDetail?prod_no=${product.prodNo}">${product.prodTitle}</a>
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
										href="/product/productDetail?prod_no=${product.prodNo}"><span
										class="icon-basket">보러가기</span></a>
								</div>
							</div>
							<h4 class="shop-item-title font-alt">
								<a href="/product/productDetail?prod_no=${product.prodNo}">${product.prodTitle}</a>
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
													href="/product/productDetail?prod_no=${product.prodNo}"><span
													class="icon-basket">보러가기</span></a>
											</div>
										</div>
										<h4 class="shop-item-title font-alt">
											<a href="/product/productDetail?prod_no=${product.prodNo}">${product.prodTitle}</a>
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
										href="/product/productDetail?prod_no=${product.prodNo}"> <span
										class="icon-basket">보러가기</span>
									</a>
								</div>
							</div>
							<div class="shop-item-info">
								<h4 class="shop-item-title font-alt">
									<a href="/product/productDetail?prod_no=${product.prodNo}">${product.prodTitle}</a>
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
													href="/product/productDetail?prod_no=${product.prodNo}"><span
													class="icon-basket">보러가기</span></a>
											</div>
										</div>
										<h4 class="shop-item-title font-alt">
											<a href="/product/productDetail?prod_no=${product.prodNo}">${product.prodTitle}</a>
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
	
<!-- include.jsp -->
<%@ include file="/WEB-INF/view/layout/footer.jsp"%>