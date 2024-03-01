<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
	<meta name="msapplication-TileImage" content="/assets/images/favicons/ms-icon-144x144.png">
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
</head>
 <body data-spy="scroll" data-target=".onpage-navigation" data-offset="60">
    <main>
      <nav class="navbar navbar-custom navbar-fixed-top" role="navigation">
        
        <div class="container" id="header">
          <div class="navbar-header">
           <a class="navbar-brand" href="/main/index">PlaceStation</a>
          </div>
          <!-- nav 바 시작 -->
          <div class="collapse navbar-collapse" id="custom-collapse">
            <ul class="nav navbar-nav navbar-right">
              <li class="dropdown"><a class="dropdown-toggle" href="#" data-toggle="dropdown">Home</a>
                <ul class="dropdown-menu">
                  <li><a href="index_mp_fullscreen_video_background.html">Default</a></li>
                  <li><a href="index_op_fullscreen_gradient_overlay.html">One Page</a></li>
                  <li><a href="index_agency.html">Agency</a></li>
                  <li><a href="index_portfolio.html">Portfolio</a></li>
                  <li><a href="index_restaurant.html">Restaurant</a></li>
                </ul>
              </li>
              <li class="dropdown"><a class="dropdown-toggle" href="#" data-toggle="dropdown">Headers</a>
                <ul class="dropdown-menu">
                  <li class="dropdown"><a class="dropdown-toggle" href="#" data-toggle="dropdown">Static Image Header</a>
                    <ul class="dropdown-menu">
                      <li><a href="index_mp_fullscreen_static.html">Fulscreen</a></li>
                      <li><a href="index_mp_classic_static.html">Classic</a></li>
                    </ul>
                  </li>
                  <li class="dropdown"><a class="dropdown-toggle" href="#" data-toggle="dropdown">Flexslider Header</a>
                    <ul class="dropdown-menu">
                      <li><a href="index_mp_fullscreen_flexslider.html">Fulscreen</a></li>
                      <li><a href="index_mp_classic_flexslider.html">Classic</a></li>
                    </ul>
                  </li>
                  <li class="dropdown"><a class="dropdown-toggle" href="#" data-toggle="dropdown">Video Background Header</a>
                    <ul class="dropdown-menu">
                      <li><a href="index_mp_fullscreen_video_background.html">Fulscreen</a></li>
                      <li><a href="index_mp_classic_video_background.html">Classic</a></li>
                    </ul>
                  </li>
                  <li class="dropdown"><a class="dropdown-toggle" href="#" data-toggle="dropdown">Text Rotator Header</a>
                    <ul class="dropdown-menu">
                      <li><a href="index_mp_fullscreen_text_rotator.html">Fulscreen</a></li>
                      <li><a href="index_mp_classic_text_rotator.html">Classic</a></li>
                    </ul>
                  </li>
                  <li class="dropdown"><a class="dropdown-toggle" href="#" data-toggle="dropdown">Gradient Overlay Header</a>
                    <ul class="dropdown-menu">
                      <li><a href="index_mp_fullscreen_gradient_overlay.html">Fulscreen</a></li>
                      <li><a href="index_mp_classic_gradient_overlay.html">Classic</a></li>
                    </ul>
                  </li>
                </ul>
              </li>
              <li class="dropdown"><a class="dropdown-toggle" href="#" data-toggle="dropdown">Pages</a>
                <ul class="dropdown-menu">
                  <li class="dropdown"><a class="dropdown-toggle" href="#" data-toggle="dropdown">About</a>
                    <ul class="dropdown-menu">
                      <li><a href="about1.html">About 1</a></li>
                      <li><a href="about2.html">About 2</a></li>
                      <li><a href="about3.html">About 3</a></li>
                      <li><a href="about4.html">About 4</a></li>
                      <li><a href="about5.html">About 5</a></li>
                    </ul>
                  </li>
                  <li class="dropdown"><a class="dropdown-toggle" href="#" data-toggle="dropdown">Services</a>
                    <ul class="dropdown-menu">
                      <li><a href="service1.html">Service 1</a></li>
                      <li><a href="service2.html">Service 2</a></li>
                      <li><a href="service3.html">Service 3</a></li>
                    </ul>
                  </li>
                  <li class="dropdown"><a class="dropdown-toggle" href="#" data-toggle="dropdown">Pricing</a>
                    <ul class="dropdown-menu">
                      <li><a href="pricing1.html">Pricing 1</a></li>
                      <li><a href="pricing2.html">Pricing 2</a></li>
                    </ul>
                  </li>
                  <li class="dropdown"><a class="dropdown-toggle" href="#" data-toggle="dropdown">Gallery</a>
                    <ul class="dropdown-menu">
                      <li><a href="gallery_col_2.html">2 Columns</a></li>
                      <li><a href="gallery_col_3.html">3 Columns</a></li>
                      <li><a href="gallery_col_4.html">4 Columns</a></li>
                      <li><a href="gallery_col_6.html">6 Columns</a></li>
                    </ul>
                  </li>
                  <li class="dropdown"><a class="dropdown-toggle" href="#" data-toggle="dropdown">Contact</a>
                    <ul class="dropdown-menu">
                      <li><a href="contact1.html">Contact 1</a></li>
                      <li><a href="contact2.html">Contact 2</a></li>
                      <li><a href="contact3.html">Contact 3</a></li>
                    </ul>
                  </li>
                  <li class="dropdown"><a class="dropdown-toggle" href="#" data-toggle="dropdown">Restaurant menu</a>
                    <ul class="dropdown-menu">
                      <li><a href="restaurant_menu1.html">Menu 2 Columns</a></li>
                      <li><a href="restaurant_menu2.html">Menu 3 Columns</a></li>
                    </ul>
                  </li>
                </ul>
              </li>
            </ul>
          </div>
          
          <div class="container-search">
          <form role="form">
            <div class="search-box">
              <input class="form-control" type="text" placeholder="Search..."/>
              <button class="search-btn" type="submit"><i class="fa fa-search"></i></button>
            </div>
          </form>
        </div> 
        <div class="login_register" style="display: inline-block">
            <a href="/member/login">로그인</a>
            <a href="/member/uregister">회원가입</a>
          </div>
        </div>
      </nav>
    </main>
</body>
</html>