<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- adminheader.jsp -->
<%@ include file="/WEB-INF/view/layout/header.jsp"%>

<style>
	img {
		border-radius: 10px;
	}

.module.bg-dark-60.shop-page-header {
	background-image: url('/assets/img/dog.jpg');
	cursor: pointer;
	overflow: hidden; /* 요소 바깥으로 넘치는 컨텐츠를 숨김 */
	position: relative;
}
	

  .btn-next, .btn-prev {
    position: absolute;
    top: 50%;
    transform: translateY(-50%);
    background-color: transparent;
    border: none;
    font-size: 24px;
    color: white;
    cursor: pointer;
  }
  
  .btn-next {
    right: 20px;
  }
  
  .btn-prev {
    left: 20px;
  }

 .module-title,
  .module-subtitle {
    visibility: hidden;
  }
	
	
</style>

	 <script>
		  let currentImageIndex = 0;
		  const images = [
		    '/assets/img/dog.jpg',
		    '/assets/img/cat.jpg',
		    '/assets/img/bird.jpg'
		  ];
			
		  function updateBackground() {
			    const section = document.querySelector('.module.bg-dark-60.shop-page-header');
			    section.style.backgroundImage = 'url(' + images[currentImageIndex] + ')';
			  }
		  
		  function nextBackground() {
		    currentImageIndex = (currentImageIndex + 1) % images.length;
		    const section = document.querySelector('.module.bg-dark-60.shop-page-header');
		    section.style.backgroundImage = 'url(' + images[currentImageIndex] + ')';
		    updateBackground();

		  }
		  
		  function prevBackground() {
		    currentImageIndex = (currentImageIndex - 1 + images.length) % images.length;
		    const section = document.querySelector('.module.bg-dark-60.shop-page-header');
		    section.style.backgroundImage = 'url(' + images[currentImageIndex] + ')';
		    updateBackground();

		  }
		  
		  
		  function bannerLinkClicked() {
			    // 현재 이미지 인덱스에 따라 작업을 수행합니다.
			    // 예를 들어, 다른 페이지로 이동하거나 기타 작업을 수행할 수 있습니다.
			    switch (currentImageIndex) {
			      case 0:
			        window.location.href = "/admin/admin-main"; // 필요에 따라 URL을 변경하세요.
			        break;
			      case 1:
			        window.location.href = "/admin/admin-notice"; // 필요에 따라 URL을 변경하세요.
			        break;
			      case 2:
			        window.location.href = "/admin/admin-payment"; // 필요에 따라 URL을 변경하세요.
			        break;
			      default:
			        break;
			    }
			  }

	 </script>



<div class="main">
	<!-- 배너 이미지 -->
	
	<section class="module bg-dark-60 shop-page-header">
		<div class="container" style = "margin-top: 150px;" onclick="bannerLinkClicked()">
			<div class="row">
				<div class="col-sm-6 col-sm-offset-3">
					<h2 class="module-title font-alt">사진자리</h2>
					<div class="module-subtitle font-serif">가나다라마바사</div>
				</div>
			</div>
		</div>
		<button class="btn-prev" onclick="prevBackground()">‹</button>
   	 	<button class="btn-next" onclick="nextBackground()">›</button>
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
	
	
	
	
	





<!-- include.jsp -->
<%@ include file="/WEB-INF/view/layout/footer.jsp"%>