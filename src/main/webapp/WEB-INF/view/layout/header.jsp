<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>PlaceStation</title>
<!--  Favicons -->
<link rel="manifest" href="/manifest.json">
<meta name="msapplication-TileColor" content="#ffffff">
<meta name="msapplication-TileImage"
	content="/assets/images/favicons/ms-icon-144x144.png">
<meta name="theme-color" content="#ffffff">
<!--  Stylesheets -->
<!-- Default stylesheets-->
<link href="/assets/css/bootstrap.min.css" rel="stylesheet">
<!-- layout stylesheets -->
<link href="/assets/css/layout.css" rel="stylesheet">
<!-- Default stylesheets-->
<link href="/assets/lib/bootstrap/dist/css/bootstrap.min.css"
	rel="stylesheet">
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
<link href="/assets/lib/owl.carousel/dist//assets/owl.carousel.min.css"
	rel="stylesheet">
<link
	href="/assets/lib/owl.carousel/dist//assets/owl.theme.default.min.css"
	rel="stylesheet">
<link href="/assets/lib/magnific-popup/dist/magnific-popup.css"
	rel="stylesheet">
<link href="/assets/lib/simple-text-rotator/simpletextrotator.css"
	rel="stylesheet">
<!-- Main stylesheet and color file-->
<link href="/assets/css/style.css" rel="stylesheet">
<link id="color-scheme" href="/assets/css/colors/default.css"
	rel="stylesheet">
<link id="color-scheme" href="/css/colors/default.css" rel="stylesheet">
<link rel="icon" type="image/png" sizes="48x48"
	href="/favicon/android-icon-48x48.png">
	<!-- Swiper CSS -->
<link rel="stylesheet"
	href="https://unpkg.com/swiper/swiper-bundle.min.css" />
</head>
<body data-spy="scroll" data-target=".onpage-navigation"
	data-offset="60">
	<main>
		<nav class="navbar navbar-custom navbar-fixed-top" role="navigation">

			<div class="container" id="header">
				<div class="navbar-header">
					<a class="navbar-brand" href="/main/index"> <img
						src="/logo/logo.jpg.png" style="width: 120px; height: 80px;">
					</a>

				</div>
				<!-- nav 바 시작 -->
				<div class="collapse navbar-collapse" id="custom-collapse"
					style="margin-bottom: 20px;">
					<ul class="nav navbar-nav navbar-right" style="margin-bottom: -5px; ">
						<li class="dropdown" style="font-size: 13px"><a class="dropdown-toggle" href="#"
							data-toggle="dropdown">장소 조회</a>
							<ul class="dropdown-menu">
								<li><a href="/product/search-page">전체 상품 조회</a></li>
								<li><a href="#">평점순</a></li>
								<li><a href="#">리뷰순</a></li>
								<li><a href="#">신규순</a></li>
							</ul></li>
						<li class="dropdown" style="font-size: 13px"><a class="dropdown-toggle" href="#"
							data-toggle="dropdown">모임</a>
							<ul class="dropdown-menu">
								<li ><a  href="/party/main"
									">전체 모임</a></li>
								<li ><a  href="/party/select-create"
									>모임 생성</a></li>
							</ul></li>
						<li class="dropdown" style="font-size: 13px"><a class="dropdown-toggle" href="#"
							data-toggle="dropdown">공지</a>
							<ul class="dropdown-menu">
								<li ><a  href="/cs/notice/search
									">공지사항</a></li>
								<li ><a  href="/cs/qna"
									>1:1문의</a></li>
								<li ><a  href="/cs/faq"
									>FAQ</a></li>
							
								
							</ul></li>
			
					</ul>
				</div>

				<div class="container-search" style="margin-bottom: 25px;">
					<form role="form">
						<div class="search-box">
							<input class="form-control" type="text" style="" placeholder="Search..." />
							<button class="search-btn" type="submit">
								<i class="fa fa-search"></i>
							</button>
						</div>
					</form>
				</div>
				<div class="login_register"
					style="display: inline-block; margin-bottom: 30px;">
					<sec:authorize access="isAnonymous()">
						<a href="/member/login">로그인</a>
						<a href="/member/uregister">회원가입</a>

					</sec:authorize>
					<sec:authorize access="isAuthenticated()">
						<a href="/member/logout">로그아웃</a>
						<sec:authorize access="hasRole('ROLE_USER')">
							<a href="/member/main">회원정보</a>
						</sec:authorize>
						<sec:authorize access="hasRole('ROLE_SELLER')">
							<a href="/biz/main">사업자</a>
						</sec:authorize>
						<sec:authorize access="hasRole('ROLE_ADMIN')">
							<a href="/admin/admin-main">관리자</a>
						</sec:authorize>
					</sec:authorize>
				</div>
			</div>
		</nav>
	</main>
