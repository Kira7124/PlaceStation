<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en-US" dir="ltr">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<!--  
    Document Title
    =============================================
    -->
<title>Titan | Multipurpose HTML5 Template</title>
<!--  
    Favicons
    =============================================
    -->
<link rel="apple-touch-icon" sizes="57x57"
	href="/assets/images/favicons/apple-icon-57x57.png" />
<link rel="apple-touch-icon" sizes="60x60"
	href="/assets/images/favicons/apple-icon-60x60.png" />
<link rel="apple-touch-icon" sizes="72x72"
	href="/assets/images/favicons/apple-icon-72x72.png" />
<link rel="apple-touch-icon" sizes="76x76"
	href="/assets/images/favicons/apple-icon-76x76.png" />
<link rel="apple-touch-icon" sizes="114x114"
	href="/assets/images/favicons/apple-icon-114x114.png" />
<link rel="apple-touch-icon" sizes="120x120"
	href="/assets/images/favicons/apple-icon-120x120.png" />
<link rel="apple-touch-icon" sizes="144x144"
	href="/assets/images/favicons/apple-icon-144x144.png" />
<link rel="apple-touch-icon" sizes="152x152"
	href="/assets/images/favicons/apple-icon-152x152.png" />
<link rel="apple-touch-icon" sizes="180x180"
	href="/assets/images/favicons/apple-icon-180x180.png" />
<link rel="icon" type="image/png" sizes="192x192"
	href="/assets/images/favicons/android-icon-192x192.png" />
<link rel="icon" type="image/png" sizes="32x32"
	href="/assets/images/favicons/favicon-32x32.png" />
<link rel="icon" type="image/png" sizes="96x96"
	href="/assets/images/favicons/favicon-96x96.png" />
<link rel="icon" type="image/png" sizes="16x16"
	href="/assets/images/favicons/favicon-16x16.png" />
<link rel="manifest" href="/manifest.json" />

<meta name="msapplication-TileColor" content="#ffffff" />
<meta name="msapplication-TileImage"
	content="/assets/images/favicons/ms-icon-144x144.png" />
<meta name="theme-color" content="#ffffff" />
<!--  
    Stylesheets
    =============================================
    
    -->
<!-- Default stylesheets-->
<link href="/assets/lib/bootstrap/dist/css/bootstrap.min.css"
	rel="stylesheet" />
<!-- Template specific stylesheets-->
<link
	href="https://fonts.googleapis.com/css?family=Roboto+Condensed:400,700"
	rel="stylesheet" />
<link href="https://fonts.googleapis.com/css?family=Volkhov:400i"
	rel="stylesheet" />
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800"
	rel="stylesheet" />
<link href="/assets/lib/animate.css/animate.css" rel="stylesheet" />
<link
	href="/assets/lib/components-font-awesome/css/font-awesome.min.css"
	rel="stylesheet" />
<link href="/assets/lib/et-line-font/et-line-font.css" rel="stylesheet" />
<link href="/assets/lib/flexslider/flexslider.css" rel="stylesheet" />
<link href="/assets/lib/owl.carousel/dist//assets/owl.carousel.min.css"
	rel="stylesheet" />
<link
	href="/assets/lib/owl.carousel/dist//assets/owl.theme.default.min.css"
	rel="stylesheet" />
<link href="/assets/lib/magnific-popup/dist/magnific-popup.css"
	rel="stylesheet" />
<link href="/assets/lib/simple-text-rotator/simpletextrotator.css"
	rel="stylesheet" />
<!-- Main stylesheet and color file-->
<link href="/assets/css/style.css" rel="stylesheet" />
<link id="color-scheme" href="/assets/css/colors/default.css"
	rel="stylesheet" />

<!-- Swiper -->
<!-- Swiper CSS -->
<link rel="stylesheet"
	href="https://unpkg.com/swiper/swiper-bundle.min.css" />
<style>
.hide {
	display: none;
}

.gray {
	background-color: rgb(241, 241, 241) !important;
}

.swiper-container {
	height: 100px;
	width: 350px;
	overflow: hidden; /* 슬라이드가 넘어가면 숨김 */
	padding: 10px;
	border: 1px solid black;
	display: none;
}

.swiper-slide {
	width: 50px;
	height: 80px;
	margin-right: 10px;
}

#time_days {
	height: 50px;
	background-color: wheat;
}

.time_hover {
	border: 1px solid black !important;
	background-color: gray;
}

.time_selected {
	background-color: rgb(230, 224, 54) !important;
	color: black;
}
</style>
</head>
<body data-spy="scroll" data-target=".onpage-navigation"
	data-offset="60">
	<main>
		<div class="page-loader">
			<div class="loader">Loading...</div>
		</div>
		<!-- nav bar 시작 -->
		<nav class="navbar navbar-custom navbar-fixed-top" role="navigation">
			<div class="container">
				<div class="navbar-header">
					<button class="navbar-toggle" type="button" data-toggle="collapse"
						data-target="#custom-collapse">
						<span class="sr-only">Toggle navigation</span><span
							class="icon-bar"></span><span class="icon-bar"></span><span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="index.html">Titan</a>
				</div>
				<div class="collapse navbar-collapse" id="custom-collapse">
					<ul class="nav navbar-nav navbar-right">
						<li class="dropdown"><a class="dropdown-toggle" href="#"
							data-toggle="dropdown">Home</a>
							<ul class="dropdown-menu">
								<li><a href="index_mp_fullscreen_video_background.html">Default</a>
								</li>
								<li><a href="index_op_fullscreen_gradient_overlay.html">One
										Page</a></li>
								<li><a href="index_agency.html">Agency</a></li>
								<li><a href="index_portfolio.html">Portfolio</a></li>
								<li><a href="index_restaurant.html">Restaurant</a></li>
								<li><a href="index_finance.html">Finance</a></li>
								<li><a href="index_landing.html">Landing Page</a></li>
								<li><a href="index_photography.html">Photography</a></li>
								<li><a href="index_shop.html">Shop</a></li>
							</ul></li>
						<li class="dropdown"><a class="dropdown-toggle" href="#"
							data-toggle="dropdown">Headers</a>
							<ul class="dropdown-menu">
								<li class="dropdown"><a class="dropdown-toggle" href="#"
									data-toggle="dropdown">Static Image
										Header</a>
									<ul class="dropdown-menu">
										<li><a href="index_mp_fullscreen_static.html">Fulscreen</a>
										</li>
										<li><a href="index_mp_classic_static.html">Classic</a></li>
									</ul></li>
								<li class="dropdown"><a class="dropdown-toggle" href="#"
									data-toggle="dropdown">Flexslider
										Header</a>
									<ul class="dropdown-menu">
										<li><a href="index_mp_fullscreen_flexslider.html">Fulscreen</a>
										</li>
										<li><a href="index_mp_classic_flexslider.html">Classic</a>
										</li>
									</ul></li>
								<li class="dropdown"><a class="dropdown-toggle" href="#"
									data-toggle="dropdown">Video
										Background Header</a>
									<ul class="dropdown-menu">
										<li><a href="index_mp_fullscreen_video_background.html">Fulscreen</a>
										</li>
										<li><a href="index_mp_classic_video_background.html">Classic</a>
										</li>
									</ul></li>
								<li class="dropdown"><a class="dropdown-toggle" href="#"
									data-toggle="dropdown">Text Rotator
										Header</a>
									<ul class="dropdown-menu">
										<li><a href="index_mp_fullscreen_text_rotator.html">Fulscreen</a>
										</li>
										<li><a href="index_mp_classic_text_rotator.html">Classic</a>
										</li>
									</ul></li>
								<li class="dropdown"><a class="dropdown-toggle" href="#"
									data-toggle="dropdown">Gradient
										Overlay Header</a>
									<ul class="dropdown-menu">
										<li><a href="index_mp_fullscreen_gradient_overlay.html">Fulscreen</a>
										</li>
										<li><a href="index_mp_classic_gradient_overlay.html">Classic</a>
										</li>
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
									data-toggle="dropdown">Restaurant
										menu</a>
									<ul class="dropdown-menu">
										<li><a href="restaurant_menu1.html">Menu 2 Columns</a></li>
										<li><a href="restaurant_menu2.html">Menu 3 Columns</a></li>
									</ul></li>
								<li><a href="login_register.html">Login / Register</a></li>
								<li><a href="faq.html">FAQ</a></li>
								<li><a href="404.html">Page 404</a></li>
							</ul></li>
						<li class="dropdown"><a class="dropdown-toggle" href="#"
							data-toggle="dropdown">Portfolio</a>
							<ul class="dropdown-menu" role="menu">
								<li class="dropdown"><a class="dropdown-toggle" href="#"
									data-toggle="dropdown">Boxed</a>
									<ul class="dropdown-menu">
										<li><a href="portfolio_boxed_col_2.html">2 Columns</a></li>
										<li><a href="portfolio_boxed_col_3.html">3 Columns</a></li>
										<li><a href="portfolio_boxed_col_4.html">4 Columns</a></li>
									</ul></li>
								<li class="dropdown"><a class="dropdown-toggle" href="#"
									data-toggle="dropdown">Boxed -
										Gutter</a>
									<ul class="dropdown-menu">
										<li><a href="portfolio_boxed_gutter_col_2.html">2
												Columns</a></li>
										<li><a href="portfolio_boxed_gutter_col_3.html">3
												Columns</a></li>
										<li><a href="portfolio_boxed_gutter_col_4.html">4
												Columns</a></li>
									</ul></li>
								<li class="dropdown"><a class="dropdown-toggle" href="#"
									data-toggle="dropdown">Full Width</a>
									<ul class="dropdown-menu">
										<li><a href="portfolio_full_width_col_2.html">2
												Columns</a></li>
										<li><a href="portfolio_full_width_col_3.html">3
												Columns</a></li>
										<li><a href="portfolio_full_width_col_4.html">4
												Columns</a></li>
									</ul></li>
								<li class="dropdown"><a class="dropdown-toggle" href="#"
									data-toggle="dropdown">Full Width -
										Gutter</a>
									<ul class="dropdown-menu">
										<li><a href="portfolio_full_width_gutter_col_2.html">2
												Columns</a></li>
										<li><a href="portfolio_full_width_gutter_col_3.html">3
												Columns</a></li>
										<li><a href="portfolio_full_width_gutter_col_4.html">4
												Columns</a></li>
									</ul></li>
								<li class="dropdown"><a class="dropdown-toggle" href="#"
									data-toggle="dropdown">Masonry</a>
									<ul class="dropdown-menu">
										<li class="dropdown"><a class="dropdown-toggle" href="#"
											data-toggle="dropdown">Boxed</a>
											<ul class="dropdown-menu">
												<li><a href="portfolio_masonry_boxed_col_2.html">2
														Columns</a></li>
												<li><a href="portfolio_masonry_boxed_col_3.html">3
														Columns</a></li>
												<li><a href="portfolio_masonry_boxed_col_4.html">4
														Columns</a></li>
											</ul></li>
										<li class="dropdown"><a class="dropdown-toggle" href="#"
											data-toggle="dropdown">Full
												Width</a>
											<ul class="dropdown-menu">
												<li><a href="portfolio_masonry_full_width_col_2.html">2
														Columns</a></li>
												<li><a href="portfolio_masonry_full_width_col_3.html">3
														Columns</a></li>
												<li><a href="portfolio_masonry_full_width_col_4.html">4
														Columns</a></li>
											</ul></li>
									</ul></li>
								<li class="dropdown"><a class="dropdown-toggle" href="#"
									data-toggle="dropdown">Hover Style</a>
									<ul class="dropdown-menu">
										<li><a href="portfolio_hover_black.html">Black</a></li>
										<li><a href="portfolio_hover_gradient.html">Gradient</a>
										</li>
									</ul></li>
								<li class="dropdown"><a class="dropdown-toggle" href="#"
									data-toggle="dropdown">Single</a>
									<ul class="dropdown-menu">
										<li class="dropdown"><a class="dropdown-toggle" href="#"
											data-toggle="dropdown">Featured
												Image</a>
											<ul class="dropdown-menu">
												<li><a href="portfolio_single_featured_image1.html">Style
														1</a></li>
												<li><a href="portfolio_single_featured_image2.html">Style
														2</a></li>
											</ul></li>
										<li class="dropdown"><a class="dropdown-toggle" href="#"
											data-toggle="dropdown">Featured
												Slider</a>
											<ul class="dropdown-menu">
												<li><a href="portfolio_single_featured_slider1.html">Style
														1</a></li>
												<li><a href="portfolio_single_featured_slider2.html">Style
														2</a></li>
											</ul></li>
										<li class="dropdown"><a class="dropdown-toggle" href="#"
											data-toggle="dropdown">Featured
												Video</a>
											<ul class="dropdown-menu">
												<li><a href="portfolio_single_featured_video1.html">Style
														1</a></li>
												<li><a href="portfolio_single_featured_video2.html">Style
														2</a></li>
											</ul></li>
									</ul></li>
							</ul></li>
						<li class="dropdown"><a class="dropdown-toggle" href="#"
							data-toggle="dropdown">Blog</a>
							<ul class="dropdown-menu" role="menu">
								<li class="dropdown"><a class="dropdown-toggle" href="#"
									data-toggle="dropdown">Standard</a>
									<ul class="dropdown-menu">
										<li><a href="blog_standard_left_sidebar.html">Left
												Sidebar</a></li>
										<li><a href="blog_standard_right_sidebar.html">Right
												Sidebar</a></li>
									</ul></li>
								<li class="dropdown"><a class="dropdown-toggle" href="#"
									data-toggle="dropdown">Grid</a>
									<ul class="dropdown-menu">
										<li><a href="blog_grid_col_2.html">2 Columns</a></li>
										<li><a href="blog_grid_col_3.html">3 Columns</a></li>
										<li><a href="blog_grid_col_4.html">4 Columns</a></li>
									</ul></li>
								<li class="dropdown"><a class="dropdown-toggle" href="#"
									data-toggle="dropdown">Masonry</a>
									<ul class="dropdown-menu">
										<li><a href="blog_grid_masonry_col_2.html">2 Columns</a>
										</li>
										<li><a href="blog_grid_masonry_col_3.html">3 Columns</a>
										</li>
										<li><a href="blog_grid_masonry_col_4.html">4 Columns</a>
										</li>
									</ul></li>
								<li class="dropdown"><a class="dropdown-toggle" href="#"
									data-toggle="dropdown">Single</a>
									<ul class="dropdown-menu">
										<li><a href="blog_single_left_sidebar.html">Left
												Sidebar</a></li>
										<li><a href="blog_single_right_sidebar.html">Right
												Sidebar</a></li>
									</ul></li>
							</ul></li>
						<li class="dropdown"><a class="dropdown-toggle" href="#"
							data-toggle="dropdown">Features</a>
							<ul class="dropdown-menu" role="menu">
								<li><a href="alerts-and-wells.html"><i
										class="fa fa-bolt"></i> Alerts and Wells</a></li>
								<li><a href="buttons.html"><i
										class="fa fa-link fa-sm"></i> Buttons</a></li>
								<li><a href="tabs_and_accordions.html"><i
										class="fa fa-tasks"></i> Tabs &amp; Accordions</a></li>
								<li><a href="content_box.html"><i
										class="fa fa-list-alt"></i> Contents Box</a></li>
								<li><a href="forms.html"><i
										class="fa fa-check-square-o"></i> Forms</a></li>
								<li><a href="icons.html"><i class="fa fa-star"></i>
										Icons</a></li>
								<li><a href="progress-bars.html"><i
										class="fa fa-server"></i> Progress Bars</a></li>
								<li><a href="typography.html"><i
										class="fa fa-font"></i> Typography</a></li>
							</ul></li>
						<li class="dropdown"><a class="dropdown-toggle" href="#"
							data-toggle="dropdown">Shop</a>
							<ul class="dropdown-menu" role="menu">
								<li class="dropdown"><a class="dropdown-toggle" href="#"
									data-toggle="dropdown">Product</a>
									<ul class="dropdown-menu">
										<li><a href="shop_product_col_3.html">3 columns</a></li>
										<li><a href="shop_product_col_4.html">4 columns</a></li>
									</ul></li>
								<li><a href="shop_single_product.html">Single Product</a></li>
								<li><a href="shop_checkout.html">Checkout</a></li>
							</ul></li>
						<li class="dropdown"><a class="dropdown-toggle"
							href="documentation.html" data-toggle="dropdown">Documentation</a>
							<ul class="dropdown-menu">
								<li><a href="documentation.html#contact">Contact Form</a></li>
								<li><a href="documentation.html#reservation">Reservation
										Form</a></li>
								<li><a href="documentation.html#mailchimp">Mailchimp</a></li>
								<li><a href="documentation.html#gmap">Google Map</a></li>
								<li><a href="documentation.html#plugin">Plugins</a></li>
								<li><a href="documentation.html#changelog">Changelog</a></li>
							</ul></li>
					</ul>
				</div>
			</div>
		</nav>
		<!-- nav bar 끝 -->
		<div class="main" style="margin: 0px">
			<section class="module">
				<div class="container">
					<div class="row">
						<!-- 본문 시작 -->
						<div class="col-sm-8">
							<div class="post">
								<div class="post">
									<div class="post-header font-alt">
										<h2 class="post-title">
											<a>${product[0].prodTitle}</a>
										</h2>

										<div class="post-meta">
											By&nbsp;<a>${product[0].prodWriter}</a>| ${product[0].prodRdate} | 리뷰 개수
										</div>
									</div>
									<div class="post-images-slider">
										<ul class="slides post-thumbnail">
											<li><img src="${product[0].filePath}"
												alt="Blog Slider Image" /></li>
											<li><img src="${product[0].filePath}"
												alt="Blog Slider Image" /></li>
										</ul>
									</div>
									<div class="post-entry"></div>
								</div>
							</div>

							<!-- description , data sheet , reviews -->
							<div class="row">
								<!-- description , data sheet , reviews nav bar 시작 -->
								<div class="col-sm-12">
									<ul class="nav nav-tabs font-alt" role="tablist">
										<li class="active"><a href="#description"
											data-toggle="tab"><span
												class="icon-tools-2"></span>장소 소개</a></li>
										<li><a href="#data-sheet" data-toggle="tab"><span
												class="icon-tools-2"></span>이용 규칙</a></li>
										<li><a href="#reviews" data-toggle="tab"><span
												class="icon-tools-2"></span>리뷰</a></li>
										<li><a href="#question" data-toggle="tab"><span
												class="icon-tools-2"></span>질문</a></li>
									</ul>
									<div class="tab-content">
										<!-- description , data sheet , reviews nav bar 끝 -->

										<!-- 장소 소개 시작 -->

										<div class="tab-pane active" id="description">
											<p></p>



											<!-- 본문 1 -->
											<div class="post #">
												<div class="post-header font-alt">
													<h2 class="post-title">
														<a href="Post with text only">Mark Stone</a>
													</h2>
													<div class="post-meta">
														ㅇㄴㅁㅇㄴㅁㅇㄴ뭉나무이ㅏㄴ무ㅏㅣㅜ이ㅟㅏㄴ뮈안뮈ㅏ우ㅏㅣㄴ뮈ㅏ 하하하ㅏ하하하</div>
												</div>
											</div>

											<!-- 본문 2 -->
											<div class="post #">
												<div class="post-header font-alt">
													<h2 class="post-title">
														<a href="Post with text only">Mark Stone</a>
													</h2>
													<div class="post-meta">
														ㅇㄴㅁㅇㄴㅁㅇㄴ뭉나무이ㅏㄴ무ㅏㅣㅜ이ㅟㅏㄴ뮈안뮈ㅏ우ㅏㅣㄴ뮈ㅏ 하하하ㅏ하하하</div>
												</div>
											</div>

											<!-- 본문 3 -->
											<div class="post #">
												<div class="post-header font-alt">
													<h2 class="post-title">
														<a href="Post with text only">Mark Stone</a>
													</h2>
													<div class="post-meta">
														ㅇㄴㅁㅇㄴㅁㅇㄴ뭉나무이ㅏㄴ무ㅏㅣㅜ이ㅟㅏㄴ뮈안뮈ㅏ우ㅏㅣㄴ뮈ㅏ 하하하ㅏ하하하</div>
												</div>
											</div>
											<!-- 본문 양식 4 -->
											<div class="post">
												<div class="post-quote">
													<blockquote class="font-serif">
														<p>&quot; The languages only differ in their grammar,
															their pronunciation and their most common words. Everyone
															realizes why a new common language would be desirable:
															one could refuse to pay expensive translators. &quot;</p>
														<p class="font-inc font-uppercase">- Thomas Anderson</p>
													</blockquote>
												</div>
											</div>

											<!-- 만약 유튜브 비디오 등이 있다면 -->
											<div class="post">
												<div
													class="post-video embed-responsive embed-responsive-16by9">
													<iframe class="embed-responsive-item"
														src="//www.youtube.com/embed/Jkk0VHiCnKY" frameborder="0"
														allowfullscreen="allowfullscreen"></iframe>
												</div>
												<div class="post-header font-alt">
													<h2 class="post-title">
														<a href="#">Post with video</a>
													</h2>
													<div class="post-meta">
														By&nbsp;<a href="#">Mark Stone</a>| 23 November | 3
														Comments | <a href="#">Marketing, </a><a href="#">Web
															Design</a>
													</div>
												</div>
												<div class="post-entry">
													<p>A wonderful serenity has taken possession of my
														entire soul, like these sweet mornings of spring which I
														enjoy with my whole heart. I am alone, and feel the charm
														of existence in this spot, which was created for the bliss
														of souls like mine.</p>
												</div>
												<div class="post-more">
													<a class="more-link" href="#">Read more</a>
												</div>
											</div>
										</div>
										<!-- 장소 소개  끝 -->

										<!-- 이용규칙 시작 -->
										<div class="tab-pane" id="data-sheet">
											<table class="table table-striped ds-table table-responsive">
												<tbody>
													<tr>
														<th>Title</th>
														<th>Info</th>
													</tr>
													<tr>
														<td>Compositions</td>
														<td>Jeans</td>
													</tr>
													<tr>
														<td>Size</td>
														<td>44, 46, 48</td>
													</tr>
													<tr>
														<td>Color</td>
														<td>Black</td>
													</tr>
													<tr>
														<td>Brand</td>
														<td>Somebrand</td>
													</tr>
												</tbody>
											</table>
										</div>
										<!-- 이용규칙 끝 -->

										<!-- reviews 시작 -->
										<div class="tab-pane" id="reviews">
											<div class="comments reviews">
												<div class="comment clearfix">
													<div class="comment-avatar">
														<img src="" alt="avatar" />
													</div>
													<div class="comment-content clearfix">
														<div class="comment-author font-alt">
															<a href="#">John Doe</a>
														</div>
														<div class="comment-body">
															<p>The European languages are members of the same
																family. Their separate existence is a myth. For science,
																music, sport, etc, Europe uses the same vocabulary. The
																European languages are members of the same family. Their
																separate existence is a myth.</p>
														</div>
														<div class="comment-meta font-alt">
															Today, 14:55 -<span><i
																class="fa fa-star star"></i></span><span><i
																class="fa fa-star star"></i></span><span><i
																class="fa fa-star star"></i></span><span><i
																class="fa fa-star star"></i></span><span><i
																class="fa fa-star star-off"></i></span>
														</div>
													</div>
												</div>
												<div class="comment clearfix">
													<div class="comment-avatar">
														<img src="" alt="avatar" />
													</div>
													<div class="comment-content clearfix">
														<div class="comment-author font-alt">
															<a href="#">Mark Stone</a>
														</div>
														<div class="comment-body">
															<p>Europe uses the same vocabulary. The European
																languages are members of the same family. Their separate
																existence is a myth.</p>
														</div>
														<div class="comment-meta font-alt">
															Today, 14:59 -<span><i
																class="fa fa-star star"></i></span><span><i
																class="fa fa-star star"></i></span><span><i
																class="fa fa-star star"></i></span><span><i
																class="fa fa-star star-off"></i></span><span><i
																class="fa fa-star star-off"></i></span>
														</div>
													</div>
												</div>
											</div>
											<div class="comment-form mt-30">
												<h4 class="comment-form-title font-alt">Add review</h4>
												<form method="post">
													<div class="row">
														<div class="col-sm-4">
															<div class="form-group">
																<label class="sr-only" for="name">Name</label> <input
																	class="form-control" id="name" type="text" name="name"
																	placeholder="Name" />
															</div>
														</div>
														<div class="col-sm-4">
															<div class="form-group">
																<label class="sr-only" for="email">Name</label>
																<input class="form-control" id="email" type="text"
																	name="email" placeholder="E-mail" />
															</div>
														</div>
														<div class="col-sm-4">
															<div class="form-group">
																<select class="form-control">
																	<option selected="true" disabled="">Rating</option>
																	<option value="1">1</option>
																	<option value="2">2</option>
																	<option value="3">3</option>
																	<option value="4">4</option>
																	<option value="5">5</option>
																</select>
															</div>
														</div>
														<div class="col-sm-12">
															<div class="form-group">
																<textarea class="form-control" id="" name="" rows="4"
																	placeholder="Review"></textarea>
															</div>
														</div>
														<div class="col-sm-12">
															<button class="btn btn-round btn-d" type="submit">
																Submit Review</button>
														</div>
													</div>
												</form>
											</div>
										</div>
										<!-- reviews 끝 -->
										<!-- 질문 시작 -->
										<div class="tab-pane active" id="question">
											<div class="comments reviews">
												<div class="comment clearfix">
													<div class="comment-avatar">
														<img src="" alt="avatar" />
													</div>
													<div class="comment-content clearfix">
														<div class="comment-author font-alt">
															<a href="#">John Doe</a>
														</div>
														<div class="comment-body">
															<p>The European languages are members of the same
																family. Their separate existence is a myth. For science,
																music, sport, etc, Europe uses the same vocabulary. The
																European languages are members of the same family. Their
																separate existence is a myth.</p>
														</div>
														<div class="comment-meta font-alt">
															Today, 14:55 -<span><i
																class="fa fa-star star"></i></span><span><i
																class="fa fa-star star"></i></span><span><i
																class="fa fa-star star"></i></span><span><i
																class="fa fa-star star"></i></span><span><i
																class="fa fa-star star-off"></i></span>
														</div>
													</div>
												</div>
												<div class="comment clearfix">
													<div class="comment-avatar">
														<img src="" alt="avatar" />
													</div>
													<div class="comment-content clearfix">
														<div class="comment-author font-alt">
															<a href="#">Mark Stone</a>
														</div>
														<div class="comment-body">
															<p>Europe uses the same vocabulary. The European
																languages are members of the same family. Their separate
																existence is a myth.</p>
														</div>
														<div class="comment-meta font-alt">
															Today, 14:59 -<span><i
																class="fa fa-star star"></i></span><span><i
																class="fa fa-star star"></i></span><span><i
																class="fa fa-star star"></i></span><span><i
																class="fa fa-star star-off"></i></span><span><i
																class="fa fa-star star-off"></i></span>
														</div>
													</div>
												</div>
											</div>
											<div class="comment-form mt-30">
												<h4 class="comment-form-title font-alt">Add review</h4>
												<form method="post">
													<div class="row">
														<div class="col-sm-4">
															<div class="form-group">
																<label class="sr-only" for="name">Name</label> <input
																	class="form-control" id="name" type="text" name="name"
																	placeholder="Name" />
															</div>
														</div>
														<div class="col-sm-4">
															<div class="form-group">
																<label class="sr-only" for="email">Name</label>
																<input class="form-control" id="email" type="text"
																	name="email" placeholder="E-mail" />
															</div>
														</div>
														<div class="col-sm-4">
															<div class="form-group">
																<select class="form-control">
																	<option selected="true" disabled="">Rating</option>
																	<option value="1">1</option>
																	<option value="2">2</option>
																	<option value="3">3</option>
																	<option value="4">4</option>
																	<option value="5">5</option>
																</select>
															</div>
														</div>
														<div class="col-sm-12">
															<div class="form-group">
																<textarea class="form-control" id="" name="" rows="4"
																	placeholder="Review"></textarea>
															</div>
														</div>
														<div class="col-sm-12">
															<button class="btn btn-round btn-d" type="submit">
																Submit Review</button>
														</div>
													</div>
												</form>
											</div>
										</div>
										<!-- 질문 끝 -->
									</div>
								</div>
							</div>
						</div>
						<!-- 본문 끝 -->
						<!-- 사이드 바 시작 -->
						<div class="col-sm-4 col-md-3 col-md-offset-1 sidebar">
							<div class="widget" style="margin-top: 30px">
								<h5 class="widget-title font-alt">Text</h5>
								The languages only differ in their grammar, their pronunciation
								and their most common words. Everyone realizes why a new common
								language would be desirable: one could refuse to pay expensive
								translators.
							</div>
							<div class="widget">
								<h5 class="widget-title font-alt">제품</h5>
								<div class="row">
									<div class="col-sm-4">
										<p style="text-align: right">
											<button class="btn btn-success btn-circle" type="button">
												<i class="fa fa-smile-o"></i> 찜하기
											</button>
										</p>
									</div>
								</div>
							</div>

							<!-- 결제 시작 -->
							<div class="widget">
								<!-- 폼 태그 시작 -->
								<form>
									<h5 class="widget-title font-alt">예약하기</h5>
									<!-- 가격 선택 -->
									<div>
										<h5 class="font-alt">가격</h5>
										<div class="row mb-20">
											<div class="col-sm-12">
												<input class="form-control input-lg" type="number"
													name="price" value="50000" required="required" disabled />
											</div>
										</div>
									</div>

									<!-- 총 인수 선택 -->
									<div>
										<h5 class="font-alt">총인수</h5>
										<div class="row mb-20">
											<div class="col-sm-12">
												<input class="form-control input-lg" type="number"
													name="people" max="6" min="1" required="required" />
											</div>
										</div>
									</div>

									<!-- 스케줄 선택 -->
									<div>
										<h5 class="font-alt">스케줄 선택</h5>
										<button class="btn btn-secondary dropdown-toggle"
											type="button" id="dropdownMenuClickableInside"
											data-bs-toggle="dropdown" data-bs-auto-close="outside"
											aria-expanded="false" onclick="hoverDateTime()">
											Clickable inside</button>
										<!-- input 창은 여기!! -->
										<input type="hidden" id="form-date" name="date" /> <input
											type="hidden" id="form-first-time" name="firstTime" />
										<input type="hidden" id="form-last-time" name="lastTime" />

										<div class="row mb-20" id="timeSelector">
											<div class="col-sm-12">
												<!-- 캘린더 -->
												<div id="calendar" style="width: 350px"></div>
												<!-- 시간 시작 -->
												<h6>시간을 눌러주세요</h6>
												<!-- Slider main container -->
												<div class="swiper-container">
													<div class="swiper-wrapper">
														<!-- <div class="swiper-slide">1시 ~ 2시</div> -->
														<!-- 필요한 만큼 카드를 추가 -->
													</div>
												</div>
											</div>
										</div>
									</div>
								</form>
								<!-- 폼 태그 끝 -->
							</div>

							<div class="widget">
								<h5 class="widget-title font-alt">예약 확인</h5>

								<h6>날짜 :</h6>
								<h6 id="final-date"></h6>
								<h6>시간 :</h6>
								<h6 id="final-time"></h6>
								<br />
							</div>

							<div class="">
								<div class="col-sm-12">
									<a class="btn btn-lg btn-block btn-round btn-b" href="#">Add
										To Cart</a>
									<p id="dateText" style="visibility: hidden"></p>
									<br />
									<p id="dayText" style="visibility: hidden"></p>
								</div>
							</div>
						</div>
						<!-- 사이드 바 끝 -->
					</div>
				</div>
			</section>
			<div class="module-small bg-dark">
				<div class="container">
					<div class="row">
						<div class="col-sm-3">
							<div class="widget">
								<h5 class="widget-title font-alt">About Titan</h5>
								<p>The languages only differ in their grammar, their
									pronunciation and their most common words.</p>
								<p>Phone: +1 234 567 89 10</p>
								Fax: +1 234 567 89 10
								<p>
									Email:<a href="#">somecompany@example.com</a>
								</p>
							</div>
						</div>
						<div class="col-sm-3">
							<div class="widget">
								<h5 class="widget-title font-alt">Recent Comments</h5>
								<ul class="icon-list">
									<li>Maria on <a href="#">Designer Desk Essentials</a></li>
									<li>John on <a href="#">Realistic Business Card Mockup</a>
									</li>
									<li>Andy on <a href="#">Eco bag Mockup</a></li>
									<li>Jack on <a href="#">Bottle Mockup</a></li>
									<li>Mark on <a href="#">Our trip to the Alps</a></li>
								</ul>
							</div>
						</div>
						<div class="col-sm-3">
							<div class="widget">
								<h5 class="widget-title font-alt">Blog Categories</h5>
								<ul class="icon-list">
									<li><a href="#">Photography - 7</a></li>
									<li><a href="#">Web Design - 3</a></li>
									<li><a href="#">Illustration - 12</a></li>
									<li><a href="#">Marketing - 1</a></li>
									<li><a href="#">Wordpress - 16</a></li>
								</ul>
							</div>
						</div>
						<div class="col-sm-3">
							<div class="widget">
								<h5 class="widget-title font-alt">Popular Posts</h5>
								<ul class="widget-posts">
									<li class="clearfix">
										<div class="widget-posts-image">
											<a href="#"><img
												src="/assets/images/rp-1.jpg" alt="Post Thumbnail" /></a>
										</div>
										<div class="widget-posts-body">
											<div class="widget-posts-title">
												<a href="#">Designer Desk Essentials</a>
											</div>
											<div class="widget-posts-meta">23 january</div>
										</div>
									</li>
									<li class="clearfix">
										<div class="widget-posts-image">
											<a href="#"><img
												src="/assets/images/rp-2.jpg" alt="Post Thumbnail" /></a>
										</div>
										<div class="widget-posts-body">
											<div class="widget-posts-title">
												<a href="#">Realistic Business Card Mockup</a>
											</div>
											<div class="widget-posts-meta">15 February</div>
										</div>
									</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
			<hr class="divider-d" />
			<footer class="footer bg-dark">
				<div class="container">
					<div class="row">
						<div class="col-sm-6">
							Shared by <i class="fa fa-love"></i><a
								href="https://bootstrapthemes.co">BootstrapThemes</a>
						</div>
						<div class="col-sm-6">
							<div class="footer-social-links">
								<a href="#"><i class="fa fa-facebook"></i></a><a href="#"><i
									class="fa fa-twitter"></i></a><a href="#"><i
									class="fa fa-dribbble"></i></a><a href="#"><i
									class="fa fa-skype"></i></a>
							</div>
						</div>
					</div>
				</div>
			</footer>
		</div>
		<div class="scroll-up">
			<a href="#totop"><i class="fa fa-angle-double-up"></i></a>
		</div>
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
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
	<!-- Swiper JS -->
	<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

	<!-- fullCalendar -->
	<script
		src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.10/index.global.min.js"></script>
	<script src="fullcalendar/dist/index.global.js"></script>
	<script>
      const calendarDays = document.querySelectorAll(".calendar_days"),
        calendarTitle = document.querySelector(".title"),
        leftButton = document.querySelector(".left_button"),
        rightButton = document.querySelector(".right_button"),
        finalDate = document.querySelector("#final-date"), // 두개 합치기 날짜
        finalTime = document.querySelector("#final-time");
      (swiperWrapper = document.querySelector(".swiper-wrapper")),
      (swiperContainer = document.querySelector(".swiper-container")),
        (swiperSlide = document.querySelectorAll(".swiper-slide"));
      const timeSelector = document.querySelector("#timeSelector");

      let clickCount = 0;
      let firstSelectedTime = 0;
      let lastSelectedTime = 0;
      let startTime = 0;
      let lastTime = 24;
      let selectDate = "";

      const hoverDateTime = () => {
        if (timeSelector.style.display === "none") {
          timeSelector.style.display = "block";
        } else {
          timeSelector.style.display = "none";
        }
      };

      // 시간 영역 추가
      const fillTime = () => {
        // 시간 추가 기능 - 처음 시간 ~ 마지막 시간
        for (let i = startTime; i < lastTime; i++) {
          swiperWrapper.innerHTML += `<div class="swiper-slide font-alt">${i}시<div id="time_days" onclick="selectTime(${i})"></div></div>`;
        }
      };

      // 시간 리셋
      const resetTime = () => {
        const timeDays = document.querySelectorAll("#time_days"); // 시간`
        timeDays.forEach((e) => {
          e.parentNode.classList.remove("gray");
          e.classList.remove("time_selected");
        });
        clickCount = 0;
        firstSelectedTime = 0;
        lastSelectedTime = 0;
        finalTime.innerText = null;
      };

      // 시간을 선택하면 들어오게 되는 함수
      const selectTime = (timeNumber) => {
        clickCount++;

        // 클릭 횟수 2회 넘어가면 달력 스타일 초기화
        if (clickCount > 2 || timeNumber < firstSelectedTime) {
          resetTime();
          return null;
        }

        // 시간의 값을 넣음
        if (firstSelectedTime === 0) {
          if (clickCount == 1) {
            firstSelectedTime = timeNumber;
          }
          lastSelectedTime = timeNumber;
        } else {
          lastSelectedTime = timeNumber;
        }

        if (timeNumber < firstSelectedTime) {
          resetTime();
          return;
        }

        // 선택 일자 사이에 회색 배경 적용
        const timeDays = document.querySelectorAll("#time_days"); // 시간`
        timeDays.forEach((e, index) => {
          const time = index + startTime;
          if (time >= firstSelectedTime && time <= lastSelectedTime) {
            e.parentNode.classList.add("gray");
          } else {
            e.parentNode.classList.remove("gray");
          }
        });

        // last 시간에 +1을 해 원래 시간 맞추기;
        lastSelectedTime += 1;

        // 결과 시간값 화면에 뿌리기
        finalTime.innerText =
          firstSelectedTime + "시 ~ " + lastSelectedTime + "시";

        // 설정이 완료된 값 input 태그에 넣기
        getAllDate();
      };

      fillTime();

      // 설정이 완료된 값 input 태그에 넣기 , date 폼으로 포맷
      const getAllDate = () => {
        const formDate = document.querySelector("#form-date");
        const formFirstTime = document.querySelector("#form-first-time");
        const formLastTime = document.querySelector("#form-last-time");
        let date = finalDate.innerText;
        formDate.value = date;
        formFirstTime.value = firstSelectedTime;
        formLastTime.value = lastSelectedTime;
        console.log("설정이 완료 되었습니다!!");
        console.log(firstSelectedTime);
        console.log(lastSelectedTime);
      };

      // 스와이퍼
      var swiper = new Swiper(".swiper-container", {
        // 옵션 설정
        slidesPerView: 5, // 화면에 보여지는 슬라이드 수
        spaceBetween: 5, // 슬라이드 간의 간격
        watchOverflow: true, // 슬라이드가 화면을 넘어갔을 때 처리
      });

      let date = "";
      document.addEventListener("DOMContentLoaded", function () {
        var calendarEl = document.getElementById("calendar");
        var calendar = new FullCalendar.Calendar(calendarEl, {
          initialView: "dayGridMonth",
          selectable: true,
          dateClick: function (info) {
            selectDate = info.dateStr;
            console.log(selectDate);
            finalDate.innerText = selectDate;
            // 시간 호버 기능 추가 - 보이기
            swiperContainer.style.display = "block";
            resetTime();
          },
        });
        calendar.render();
      });
    </script>
</body>
</html>
