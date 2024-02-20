<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en-US" dir="ltr">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>PlaceStation</title>
<!--  Favicons -->
<link rel="manifest" href="/manifest.json">
<meta name="msapplication-TileColor" content="#ffffff">
<meta name="msapplication-TileImage"
	content="assets/images/favicons/ms-icon-144x144.png">
<meta name="theme-color" content="#ffffff">
<!--  Stylesheets -->
<!-- Default stylesheets-->
<link href="/assets/css/bootstrap.min.css" rel="stylesheet">
<!-- layout stylesheets -->
<link href="/assets/css/layout.css" rel=stylesheet">
<!-- Template specific stylesheets-->
<link
	href="https://fonts.googleapis.com/css?family=Roboto+Condensed:400,700"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Volkhov:400i"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800"
	rel="stylesheet">

<link href="/assets/lib/animate.css/animate.css" rel="stylesheet">
<link
	href="/assets/lib/components-font-awesome/css/font-awesome.min.css"
	rel="stylesheet">
<link href="/assets/lib/et-line-font/et-line-font.css" rel="stylesheet">
<link href="/assets/lib/flexslider/flexslider.css" rel="stylesheet">
<link href="/assets/lib/owl.carousel/dist/assets/owl.carousel.min.css"
	rel="stylesheet">
<link
	href="/assets/lib/owl.carousel/dist/assets/owl.theme.default.min.css"
	rel="stylesheet">
<link href="/assets/lib/magnific-popup/dist/magnific-popup.css"
	rel="stylesheet">
<link href="/assets/lib/simple-text-rotator/simpletextrotator.css"
	rel="stylesheet">
<!-- Main stylesheet and color file-->
<link href="/css/style.css" rel="stylesheet">
<link id="color-scheme" href="/css/colors/default.css" rel="stylesheet">
</head>
<body data-spy="scroll" data-target=".onpage-navigation"
	data-offset="60">
	<main>

		<nav class="navbar navbar-custom navbar-fixed-top" role="navigation">

			<div class="container">
				<div class="navbar-header">
					<button class="navbar-toggle" type="button" data-toggle="collapse"
						data-target="#custom-collapse">
						<span class="sr-only">Toggle navigation</span><span
							class="icon-bar"></span><span class="icon-bar"></span><span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="index.html">PlaceStation</a>
				</div>
				<!-- nav 바 시작 -->
				<div class="collapse navbar-collapse" id="custom-collapse">
					<ul class="nav navbar-nav navbar-right">
						<li class="dropdown"><a class="dropdown-toggle" href="#"
							data-toggle="dropdown">Home</a>
							<ul class="dropdown-menu">
								<li><a href="index_mp_fullscreen_video_background.html">Default</a></li>
								<li><a href="index_op_fullscreen_gradient_overlay.html">One
										Page</a></li>
								<li><a href="index_agency.html">Agency</a></li>
								<li><a href="index_portfolio.html">Portfolio</a></li>
								<li><a href="index_restaurant.html">Restaurant</a></li>

							</ul></li>
						<li class="dropdown"><a class="dropdown-toggle" href="#"
							data-toggle="dropdown">Headers</a>
							<ul class="dropdown-menu">
								<li class="dropdown"><a class="dropdown-toggle" href="#"
									data-toggle="dropdown">Static Image Header</a>
									<ul class="dropdown-menu">
										<li><a href="index_mp_fullscreen_static.html">Fulscreen</a></li>
										<li><a href="index_mp_classic_static.html">Classic</a></li>
									</ul></li>
								<li class="dropdown"><a class="dropdown-toggle" href="#"
									data-toggle="dropdown">Flexslider Header</a>
									<ul class="dropdown-menu">
										<li><a href="index_mp_fullscreen_flexslider.html">Fulscreen</a></li>
										<li><a href="index_mp_classic_flexslider.html">Classic</a></li>
									</ul></li>
								<li class="dropdown"><a class="dropdown-toggle" href="#"
									data-toggle="dropdown">Video Background Header</a>
									<ul class="dropdown-menu">
										<li><a href="index_mp_fullscreen_video_background.html">Fulscreen</a></li>
										<li><a href="index_mp_classic_video_background.html">Classic</a></li>
									</ul></li>
								<li class="dropdown"><a class="dropdown-toggle" href="#"
									data-toggle="dropdown">Text Rotator Header</a>
									<ul class="dropdown-menu">
										<li><a href="index_mp_fullscreen_text_rotator.html">Fulscreen</a></li>
										<li><a href="index_mp_classic_text_rotator.html">Classic</a></li>
									</ul></li>
								<li class="dropdown"><a class="dropdown-toggle" href="#"
									data-toggle="dropdown">Gradient Overlay Header</a>
									<ul class="dropdown-menu">
										<li><a href="index_mp_fullscreen_gradient_overlay.html">Fulscreen</a></li>
										<li><a href="index_mp_classic_gradient_overlay.html">Classic</a></li>
									</ul></li>
							</ul></li>
						<li class="dropdown"><a class="dropdown-toggle" href="#"
							data-toggle="dropdown">Pages</a>
							<ul class="dropdown-menu">
								<li class="dropdown"><a class="dropdown-toggle" href="#"
									data-toggle="dropdown">About</a>
									<ul class="dropdown-menu">
										<li><a href="about1.html">About 1</a></li>
										<li><a href="about2.html">About 2</a></li>
										<li><a href="about3.html">About 3</a></li>
										<li><a href="about4.html">About 4</a></li>
										<li><a href="about5.html">About 5</a></li>
									</ul></li>
								<li class="dropdown"><a class="dropdown-toggle" href="#"
									data-toggle="dropdown">Services</a>
									<ul class="dropdown-menu">
										<li><a href="service1.html">Service 1</a></li>
										<li><a href="service2.html">Service 2</a></li>
										<li><a href="service3.html">Service 3</a></li>
									</ul></li>
								<li class="dropdown"><a class="dropdown-toggle" href="#"
									data-toggle="dropdown">Pricing</a>
									<ul class="dropdown-menu">
										<li><a href="pricing1.html">Pricing 1</a></li>
										<li><a href="pricing2.html">Pricing 2</a></li>
									</ul></li>
								<li class="dropdown"><a class="dropdown-toggle" href="#"
									data-toggle="dropdown">Gallery</a>
									<ul class="dropdown-menu">
										<li><a href="gallery_col_2.html">2 Columns</a></li>
										<li><a href="gallery_col_3.html">3 Columns</a></li>
										<li><a href="gallery_col_4.html">4 Columns</a></li>
										<li><a href="gallery_col_6.html">6 Columns</a></li>
									</ul></li>
								<li class="dropdown"><a class="dropdown-toggle" href="#"
									data-toggle="dropdown">Contact</a>
									<ul class="dropdown-menu">
										<li><a href="contact1.html">Contact 1</a></li>
										<li><a href="contact2.html">Contact 2</a></li>
										<li><a href="contact3.html">Contact 3</a></li>
									</ul></li>
								<li class="dropdown"><a class="dropdown-toggle" href="#"
									data-toggle="dropdown">Restaurant menu</a>
									<ul class="dropdown-menu">
										<li><a href="restaurant_menu1.html">Menu 2 Columns</a></li>
										<li><a href="restaurant_menu2.html">Menu 3 Columns</a></li>
									</ul></li>

							</ul></li>



						<!--li.dropdown.navbar-cart-->
						<!--    a.dropdown-toggle(href='#', data-toggle='dropdown')-->
						<!--        span.icon-basket-->
						<!--        |-->
						<!--        span.cart-item-number 2-->
						<!--    ul.dropdown-menu.cart-list(role='menu')-->
						<!--        li-->
						<!--            .navbar-cart-item.clearfix-->
						<!--                .navbar-cart-img-->
						<!--                    a(href='#')-->
						<!--                        img(src='assets/images/shop/product-9.jpg', alt='')-->
						<!--                .navbar-cart-title-->
						<!--                    a(href='#') Short striped sweater-->
						<!--                    |-->
						<!--                    span.cart-amount 2 &times; $119.00-->
						<!--                    br-->
						<!--                    |-->
						<!--                    strong.cart-amount $238.00-->
						<!--        li-->
						<!--            .navbar-cart-item.clearfix-->
						<!--                .navbar-cart-img-->
						<!--                    a(href='#')-->
						<!--                        img(src='assets/images/shop/product-10.jpg', alt='')-->
						<!--                .navbar-cart-title-->
						<!--                    a(href='#') Colored jewel rings-->
						<!--                    |-->
						<!--                    span.cart-amount 2 &times; $119.00-->
						<!--                    br-->
						<!--                    |-->
						<!--                    strong.cart-amount $238.00-->
						<!--        li-->
						<!--            .clearfix-->
						<!--                .cart-sub-totle-->
						<!--                    strong Total: $476.00-->
						<!--        li-->
						<!--            .clearfix-->
						<!--                a.btn.btn-block.btn-round.btn-font-w(type='submit') Checkout-->
						<!--li.dropdown-->
						<!--    a.dropdown-toggle(href='#', data-toggle='dropdown') Search-->
						<!--    ul.dropdown-menu(role='menu')-->
						<!--        li-->
						<!--            .dropdown-search-->
						<!--                form(role='form')-->
						<!--                    input.form-control(type='text', placeholder='Search...')-->
						<!--                    |-->
						<!--                    button.search-btn(type='submit')-->
						<!--                        i.fa.fa-search-->

					</ul>
				</div>
				<div class="login_register" style="display: inline-block">
					<a href="#">로그인</a> <a href="#">회원가입</a>
				</div>
			</div>
		</nav>
	</main>
	<script src="assets/lib/jquery/dist/jquery.js"></script>
	<script src="assets/lib/bootstrap/dist/js/bootstrap.min.js"></script>
	<script src="assets/lib/wow/dist/wow.js"></script>
	<script src="assets/lib/jquery.mb.ytplayer/dist/jquery.mb.YTPlayer.js"></script>
	<script src="assets/lib/isotope/dist/isotope.pkgd.js"></script>
	<script src="assets/lib/imagesloaded/imagesloaded.pkgd.js"></script>
	<script src="assets/lib/flexslider/jquery.flexslider.js"></script>
	<script src="assets/lib/owl.carousel/dist/owl.carousel.min.js"></script>
	<script src="assets/lib/smoothscroll.js"></script>
	<script src="assets/lib/magnific-popup/dist/jquery.magnific-popup.js"></script>
	<script
		src="assets/lib/simple-text-rotator/jquery.simple-text-rotator.min.js"></script>
	<script src="assets/js/plugins.js"></script>
	<script src="assets/js/main.js"></script>
	<!-- 상단 nav bar 끝 -->
	</div>
	</nav>
	<div class="main">
		<section class="module-small">
			<div class="container">
				<div class="row">
					<!-- aside bar 시작 -->
					<div class="col-sm-4 col-md-3 sidebar">
						<div class="widget">
							<h5 class="widget-title font-alt">고객센터</h5>
							<ul class="icon-list">
								<li><a href="#">고객센터 홈</a></li>
								<li><a href="#">공지사항</a></li>
								<li><a href="#">1:1 문의</a></li>
								<li><a href="#">FAQ</a></li>
							</ul>
						</div>
					</div>
					<!-- aside bar 끝 -->
					<!-- 메인 시작 -->
					<div class="col-sm-8 col-sm-offset-1">
						<div class="post">
							<div class="comment-form">
								<h4 class="comment-form-title font-alt">자주 묻는 질문</h4>

							</div>
							<div class="post-header font-alt"></div>
							<div></div>
						</div>
						<div class="comments"></div>
						<div>
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title font-alt">
										<a class="collapsed" data-toggle="collapse"
											data-parent="#accordion" href="#support1">질문사항 1</a>
									</h4>
								</div>
								<div class="panel-collapse collapse" id="support1">
									<div class="panel-body">Anim pariatur cliche
										reprehenderit, enim eiusmod high life accusamus terry
										richardson ad squid. 3 wolf moon officia aute, non cupidatat
										skateboard dolor brunch. Food truck quinoa nesciunt laborum
										eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on
										it squid single-origin coffee nulla assumenda shoreditch et.</div>
								</div>

								<div class="panel-heading">
									<h4 class="panel-title font-alt">
										<a class="collapsed" data-toggle="collapse"
											data-parent="#accordion" href="#support2">질문사항 2</a>
									</h4>
								</div>
								<div class="panel-collapse collapse" id="support2">
									<div class="panel-body">Anim pariatur cliche
										reprehenderit, enim eiusmod high life accusamus terry
										richardson ad squid. 3 wolf moon officia aute, non cupidatat
										skateboard dolor brunch. Food truck quinoa nesciunt laborum
										eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on
										it squid single-origin coffee nulla assumenda shoreditch et.</div>
								</div>

								<div class="panel-heading">
									<h4 class="panel-title font-alt">
										<a class="collapsed" data-toggle="collapse"
											data-parent="#accordion" href="#support3">질문사항 3</a>
									</h4>
								</div>
								<div class="panel-collapse collapse" id="support3">
									<div class="panel-body">Anim pariatur cliche
										reprehenderit, enim eiusmod high life accusamus terry
										richardson ad squid. 3 wolf moon officia aute, non cupidatat
										skateboard dolor brunch. Food truck quinoa nesciunt laborum
										eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on
										it squid single-origin coffee nulla assumenda shoreditch et.</div>
								</div>

								<div class="panel-heading">
									<h4 class="panel-title font-alt">
										<a class="collapsed" data-toggle="collapse"
											data-parent="#accordion" href="#support4">질문사항 4</a>
									</h4>
								</div>
								<div class="panel-collapse collapse" id="support4">
									<div class="panel-body">Anim pariatur cliche
										reprehenderit, enim eiusmod high life accusamus terry
										richardson ad squid. 3 wolf moon officia aute, non cupidatat
										skateboard dolor brunch. Food truck quinoa nesciunt laborum
										eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on
										it squid single-origin coffee nulla assumenda shoreditch et.</div>
								</div>

								<div class="panel-heading">
									<h4 class="panel-title font-alt">
										<a class="collapsed" data-toggle="collapse"
											data-parent="#accordion" href="#support5">질문사항 5</a>
									</h4>
								</div>
								<div class="panel-collapse collapse" id="support5">
									<div class="panel-body">Anim pariatur cliche
										reprehenderit, enim eiusmod high life accusamus terry
										richardson ad squid. 3 wolf moon officia aute, non cupidatat
										skateboard dolor brunch. Food truck quinoa nesciunt laborum
										eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on
										it squid single-origin coffee nulla assumenda shoreditch et.</div>
								</div>

								<div class="panel-heading">
									<h4 class="panel-title font-alt">
										<a class="collapsed" data-toggle="collapse"
											data-parent="#accordion" href="#support6">질문사항 6</a>
									</h4>
								</div>
								<div class="panel-collapse collapse" id="support6">
									<div class="panel-body">Anim pariatur cliche
										reprehenderit, enim eiusmod high life accusamus terry
										richardson ad squid. 3 wolf moon officia aute, non cupidatat
										skateboard dolor brunch. Food truck quinoa nesciunt laborum
										eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on
										it squid single-origin coffee nulla assumenda shoreditch et.</div>
								</div>

								<div class="panel-heading">
									<h4 class="panel-title font-alt">
										<a class="collapsed" data-toggle="collapse"
											data-parent="#accordion" href="#support7">질문사항 7</a>
									</h4>
								</div>
								<div class="panel-collapse collapse" id="support7">
									<div class="panel-body">Anim pariatur cliche
										reprehenderit, enim eiusmod high life accusamus terry
										richardson ad squid. 3 wolf moon officia aute, non cupidatat
										skateboard dolor brunch. Food truck quinoa nesciunt laborum
										eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on
										it squid single-origin coffee nulla assumenda shoreditch et.</div>
								</div>

								<div class="panel-heading">
									<h4 class="panel-title font-alt">
										<a class="collapsed" data-toggle="collapse"
											data-parent="#accordion" href="#support8">질문사항 8</a>
									</h4>
								</div>
								<div class="panel-collapse collapse" id="support8">
									<div class="panel-body">Anim pariatur cliche
										reprehenderit, enim eiusmod high life accusamus terry
										richardson ad squid. 3 wolf moon officia aute, non cupidatat
										skateboard dolor brunch. Food truck quinoa nesciunt laborum
										eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on
										it squid single-origin coffee nulla assumenda shoreditch et.</div>
								</div>

								<div class="panel-heading">
									<h4 class="panel-title font-alt">
										<a class="collapsed" data-toggle="collapse"
											data-parent="#accordion" href="#support9">질문사항 9</a>
									</h4>
								</div>
								<div class="panel-collapse collapse" id="support9">
									<div class="panel-body">Anim pariatur cliche
										reprehenderit, enim eiusmod high life accusamus terry
										richardson ad squid. 3 wolf moon officia aute, non cupidatat
										skateboard dolor brunch. Food truck quinoa nesciunt laborum
										eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on
										it squid single-origin coffee nulla assumenda shoreditch et.</div>
								</div>

								<div class="panel-heading">
									<h4 class="panel-title font-alt">
										<a class="collapsed" data-toggle="collapse"
											data-parent="#accordion" href="#support10">질문사항 10</a>
									</h4>
								</div>
								<div class="panel-collapse collapse" id="support10">
									<div class="panel-body">Anim pariatur cliche
										reprehenderit, enim eiusmod high life accusamus terry
										richardson ad squid. 3 wolf moon officia aute, non cupidatat
										skateboard dolor brunch. Food truck quinoa nesciunt laborum
										eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on
										it squid single-origin coffee nulla assumenda shoreditch et.</div>
								</div>
							</div>
						</div>
						<div class="pagination font-alt">
							<a href="#"><i class="fa fa-angle-left"></i></a><a class="active"
								href="#">1</a><a href="#">2</a><a href="#">3</a><a href="#">4</a><a
								href="#"><i class="fa fa-angle-right"></i></a>
						</div>
					</div>
					<!-- 메인 끝 -->
				</div>
			</div>
		</section>

		<hr class="divider-d">
		<!-- 하단 작은 푸터 시작 -->
		<footer class="footer bg-dark">
			<div class="container">
				<div class="row">
					<h3>PlaceStation</h3>
					<hr class="divider-d">
					<div class="col-sm-6">
						<p>대표 김진수</p>
						<p>주소 부산광역시 부산진구 중앙대로 749, 범향빌딩 4층</p>
						<p>전화번호 051-912-1000</p>
						<p>© 2024 PlaceStation, All Rights Reserved</p>
					</div>
				</div>
			</div>
		</footer>
		<!-- 하단 작은 푸터 끝-->
	</div>
	<div class="scroll-up">
		<a href="#totop"><i class="fa fa-angle-double-up"></i></a>
	</div>
	</main>
	<!--  
    JavaScripts
    =============================================
    -->
	<script src="assets/lib/jquery/dist/jquery.js"></script>
	<script src="assets/lib/bootstrap/dist/js/bootstrap.min.js"></script>
	<script src="assets/lib/wow/dist/wow.js"></script>
	<script src="assets/lib/jquery.mb.ytplayer/dist/jquery.mb.YTPlayer.js"></script>
	<script src="assets/lib/isotope/dist/isotope.pkgd.js"></script>
	<script src="assets/lib/imagesloaded/imagesloaded.pkgd.js"></script>
	<script src="assets/lib/flexslider/jquery.flexslider.js"></script>
	<script src="assets/lib/owl.carousel/dist/owl.carousel.min.js"></script>
	<script src="assets/lib/smoothscroll.js"></script>
	<script src="assets/lib/magnific-popup/dist/jquery.magnific-popup.js"></script>
	<script
		src="assets/lib/simple-text-rotator/jquery.simple-text-rotator.min.js"></script>
	<script src="assets/js/plugins.js"></script>
	<script src="assets/js/main.js"></script>
</body>
</html>