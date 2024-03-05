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
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />

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
<!-- include.jsp -->
<%@ include file="/WEB-INF/view/layout/header.jsp"%>

<style>
.hide {
	display: none;
}

.gray {
	background-color: rgb(241, 241, 241) !important;
}

.swiper-container {
	height: 150px;
	width: 350px;
	overflow: hidden; /* 슬라이드가 넘어가면 숨김 */
	padding: 10px;
	border: 1px solid black;
	display: none;
	margin-top: 20px;
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

.refund-em {
	
}

.refund-policy {
	color: black;
	font-weight: bold;
}

.usage-period {
	display: inline-block;
	width: 120px;
}

.noRev {
	font-size: 24px;
	text-align: center;
	height: 250px;
	display: flex;
	justify-content: center;
	align-items: center;
	"
}

.disabled-div {
	background-color: gray;
}

.comment-star {
	float: right;
	margin-right: 10px;
}

.btn.btn-sm {
	float: none;
}

.btn.btn-d {
	float: right;
}

.post-title {
	position: relative;
}

.post-title::after {
	content: "";
	position: absolute;
	bottom: -8px;
	left: 0;
	height: 4px;
	width: 20px;
	background-color: #ffd014;
}
</style>
</head>
<body data-spy="scroll" data-target=".onpage-navigation"
	data-offset="60">
	<main>
		<div class="page-loader">
			<div class="loader">Loading...</div>
		</div>
		<!-- nav bar 끝 -->
		<div class="main" style="margin-top: 120px">
			<section class="module">
				<div class="container">
					<div class="row">
						<!-- 본문 시작 -->
						<div class="col-sm-8">
							<div class="post">
								<div class="post">
									<div class="post-header font-alt">
										<h2 style="font-size: 42px">
											<a>${product.prodTitle}</a>
										</h2>

										<div class="post-meta">${product.prodNo}|
											<span id="formattedDate"></span>
										</div>
									</div>
									<div class="post-images-slider"
										style="width: 750px; height: 400px;">
										<ul class="slides post-thumbnail">
											<c:forEach var="file" items="${product.filePath}">
												<li><img src="${file}" alt="Blog Slider Image"
													style="width: 750px; height: 400px;" /></li>
											</c:forEach>
										</ul>
									</div>
									<div class="post-entry" style="font-size: 20px;">
										<i class="fas fa-solid fa-heart" style="margin: 10px"></i>${wishlistCount}
										<i class="fas fa-regular fa-comment" style="margin: 10px"></i>${reviewCount != null ? reviewCount : 0}
										<i class="fas fa-regular fa-eye" style="margin: 10px"></i>${currentViews}
										<c:if test="${avgStar != 0}">
											<div style="float: right; margin-right: 5px;">
												<span class="comment-star"> <c:forEach begin="1"
														end="${avgStar}">
														<i class="fa fa-star star"></i>
													</c:forEach> <c:forEach begin="${avgStar + 1}" end="5">
														<i class="fa fa-star star-off"></i>
													</c:forEach>
												</span>
											</div>
											<div style="float: right; clear: both; margin-right: 15px;">
												평균 <span style="color: #FFD700;">${avgStar}</span> 점
											</div>
										</c:if>
										<c:if test="${avgStar == 0}">
											<span class="comment-star"> <c:forEach begin="1"
													end="${avgStar}">
													<i class="fa fa-star star"></i>
												</c:forEach> <c:forEach begin="${avgStar + 1}" end="5">
													<i class="fa fa-star star-off"></i>
												</c:forEach>
											</span>
											<div style="float: right; clear: both; margin-right: 15px;">
												등록된 점수가 없습니다</div>
										</c:if>
									</div>
								</div>
							</div>

							<!-- description , data sheet , reviews -->
							<div class="row">
								<!-- description , data sheet , reviews nav bar 시작 -->
								<div class="col-sm-12">
									<ul class="nav nav-tabs font-alt" role="tablist">
										<li class="active"><a href="#description"
											data-toggle="tab"><span class="icon-tools-2"></span>장소 소개</a></li>
										<li><a href="#data-sheet" data-toggle="tab"><span
												class="icon-tools-2"></span>이용 안내</a></li>
										<li><a href="#reviews" data-toggle="tab"><span
												class="icon-tools-2"></span>리뷰</a></li>
										<li><a href="#question" data-toggle="tab"><span
												class="icon-tools-2"></span>환불 안내</a></li>
									</ul>
									<div class="tab-content">
										<!-- description , data sheet , reviews nav bar 끝 -->

										<!-- 장소 소개 시작 -->

										<div class="tab-pane active" id="description">
											<p></p>

											<!-- 본문 1 -->
											<div class="post #">
												<div class="post-header font-alt">
													<h1 class="post-title" style="font-weight: bold">
														<a>공간 소개</a>
													</h1>
													<div class="post-meta" style="white-space: pre-line;">
														<h5>${product.prodSpaceInfo}</h5>
													</div>
												</div>
											</div>

											<!-- 본문 2 -->
											<div class="post #">
												<div class="post-header font-alt">
													<h1 class="post-title" style="font-weight: bold">
														<a>대여 가능</a>
													</h1>
													<div class="post-meta" style="white-space: pre-line;">
														<h5>${product.prodGoodsInfo}</h5>
													</div>
												</div>
											</div>

											<!-- 본문 3 -->
											<div class="post #">
												<div class="post-header font-alt">
													<h1 class="post-title" style="font-weight: bold">
														<a>예약시 주의사항</a>
													</h1>
													<div class="post-meta" style="white-space: pre-line;">
														<h5>${product.prodCautionInfo}</h5>
													</div>
												</div>
											</div>
											<!-- 본문 4 -->
											<div class="post #">
												<div class="post-header font-alt">
													<h1 class="post-title" style="font-weight: bold">
														<a>부가 설명</a>
													</h1>
													<div class="post-meta"
														style="white-space: pre-line; margin-top: 30px;">
														<div class="addition-container"
															style="display: inline-flex; flex-wrap: wrap;">
															<c:forEach items="${additionExplanations}" var="no">
																<label for="toggle3-${no.additionExplanationNo}"
																	style="margin-right: 20px;"> <img
																	src="${no.filePath}" alt=""
																	style="width: 50px; height: 50px;">
																	<h5>${no.name}</h5>
																</label>
															</c:forEach>
														</div>
													</div>
												</div>
											</div>

											<!-- 카카오맵 API -->
											<div class="post">
												<div class="post-quote" style="text-align: left;">
													<blockquote class="font-serif">
														<h3>${product.prodTitle}</h3>
														<p class="font-inc font-uppercase">${product.prodAddress}</p>
														<div id="map" style="width: 710px; height: 400px;"></div>
													</blockquote>
												</div>
											</div>
										</div>
										<!-- 장소 소개  끝 -->

										<!-- 이용안내 시작 -->
										<div class="tab-pane" id="data-sheet">
											<table class="table table-striped ds-table table-responsive">
												<tbody>
													<tr>
														<th>이름</th>
														<th>${product.prodTitle}</th>
													</tr>
													<tr>
														<td>주소</td>
														<td>${product.prodAddress}</td>
													</tr>
													<tr>
														<td>최대 인원 수</td>
														<td>${product.prodMaximumPeople}명</td>
													</tr>
													<tr>
														<td>영업 시간</td>
														<td>${product.prodStartTime}시~${product.prodEndTime}
															시</td>
													</tr>
													<tr>
														<td>사업자 명</td>
														<td>${product.userName}</td>
													</tr>

												</tbody>
											</table>
										</div>
										<!-- 이용규칙 끝 -->
										<!-- 환불 규정 안내 -->
										<div class="tab-pane active" id="question">
											<div class="comment-form mt-30">
												<div class="row">
													<div style="margin-left: 15px; margin-top: -40px;">
														<h2>환불규정 안내</h2>
														<p style="font-size: 15px;">
															<em class="refund-em" style="color: red;"> 이용당일(첫 날)
																이후에 환불 관련 사항은 사업자에게 직접 문의하셔야 합니다.</em><br> 결제 후 2시간 이내에는
															100% 환불이 가능합니다.(단, 이용시간 전까지만 가능)
														</p>
														<ol
															style="list-style: none; font-size: 15px; margin-left: -35px;">
															<li style="margin-bottom: 15px;"><span
																class="usage-period">이용 7일 전</span> <span
																class="refund-policy">100% 환불 가능</span></li>
															<li style="margin-bottom: 15px;"><span
																class="usage-period">이용 6일 전</span> <span
																class="refund-policy">100% 환불 가능</span></li>
															<li style="margin-bottom: 15px;"><span
																class="usage-period">이용 5일 전</span> <span
																class="refund-policy">100% 환불 가능</span></li>
															<li style="margin-bottom: 15px;"><span
																class="usage-period">이용 4일 전</span> <span
																class="refund-policy">80% 환불 가능</span></li>
															<li style="margin-bottom: 15px;"><span
																class="usage-period">이용 3일 전</span> <span
																class="refund-policy">80% 환불 가능</span></li>
															<li style="margin-bottom: 15px;"><span
																class="usage-period">이용 2일 전</span> <span
																class="refund-policy">환불 불가</span></li>
															<li style="margin-bottom: 15px;"><span
																class="usage-period">이용 하루 전</span> <span
																class="refund-policy">환불 불가</span></li>
															<li style="margin-bottom: 15px;"><span
																class="usage-period">이용 당일</span> <span
																class="refund-policy">환불 불가</span></li>
														</ol>
													</div>
												</div>
											</div>
										</div>
										<!-- 환불 규정 안내 끝 -->

										<!-- 리뷰 시작 -->
										<div class="tab-pane" id="reviews">
											<!-- 리뷰가 있는 경우 -->
											<c:if test="${not empty reviewProdNo}">
												<div id="reviews" class="tab-pane">
													<div class="comments reviews">
														<h3>이용 후기</h3>
														<!-- 원글 출력 -->
														<c:forEach items="${reviewProdNo}" var="review">
															<div class="comment clearfix"
																style="border-bottom: 1px solid #ccc;">
																<!-- 원글 내용 출력 -->
																<c:if test="${review.parentId == null}">
																	<div class="comment-avatar">
																		<img src="" alt="avatar" />
																	</div>
																	<div class="comment-content clearfix">
																		<div class="comment-author font-alt">
																			<p>
																				${review.userName} | <span class="comment-date">${review.prodRevCreateAt}</span>
																			<form id="deleteReview"
																				action="/product/deleteReview/${review.prodRevNo}"
																				method="post" style="display: inline;">
																				<input type="hidden" name="prodRevNo"
																					value="${review.prodRevNo}"> <input
																					type="hidden" name="prodNo"
																					value="${product.prodNo}">
																				<button type="submit" class="btn btn-danger btn-sm">리뷰
																					삭제</button>
																			</form>
																			<span class="comment-star"> <c:if
																					test="${review.prodRevStar != 0}">
																					<c:forEach begin="1" end="${review.prodRevStar}">
																						<i class="fa fa-star star"></i>
																					</c:forEach>
																					<c:forEach begin="${review.prodRevStar + 1}"
																						end="5">
																						<i class="fa fa-star star-off"></i>
																					</c:forEach>
																				</c:if>
																			</span>
																			</p>
																		</div>
																	</div>
																	<div class="comment-body"
																		style="margin-left: 75px; word-wrap: break-word;">
																		<p style="margin-right: 55px;">${review.prodRevContent}</p>
																	</div>
																	<!-- 대댓글 버튼 추가 -->
																	<c:if test="${review.parentId == null}">
																		<div class="comment-reply">
																			<button class="btn btn-round btn-d"
																				onclick="showReplyForm(${review.prodRevNo})">답글
																				달기</button>
																		</div>
																	</c:if>
																</c:if>
															</div>

															<!-- 대댓글 작성 폼 -->
															<div id="replyForm_${review.prodRevNo}"
																class="comment-form mt-30 hidden"
																style="display: block; border-bottom: 1px solid #ccc;">
																<form method="post" action="/product/saveReview">
																	<div class="row">
																		<div class="col-sm-4">
																			<div class="form-group">
																				<input type="hidden" name="prodNo"
																					value="${product.prodNo}">
																				<!-- 부모 댓글의 parentId 값을 사용 -->
																				<input type="hidden" name="parentId"
																					value="${review.prodRevNo}"> <input
																					type="hidden" name="userNo"
																					value="${member.userno}">
																			</div>
																		</div>
																		<input type="hidden" name="prodRevStar" value="0">
																		<div class="col-sm-12">
																			<div class="form-group">
																				<label for="prodRevContent">답글 작성</label>
																				<textarea class="form-control" name="prodRevContent"
																					rows="4" placeholder="답글을 작성해주세요" required></textarea>
																			</div>
																		</div>
																		<div class="col-sm-12">
																			<button class="btn btn-round btn-d" type="submit">답글
																				작성</button>
																		</div>
																	</div>
																</form>
															</div>
															<!-- 대댓글 출력 -->
															<c:forEach items="${reviewProdNo}" var="reply">
																<c:if
																	test="${reply.parentId == review.prodRevNo && reply.prodRevDeleteYn ne 'Y'}">
																	<div class="comment clearfix"
																		style="margin-left: 30px;">
																		<!-- 대댓글 내용 출력 -->
																		<i class="fa-solid fa-arrow-turn-down-right"></i>
																		<div class="comment-avatar">
																			<img src="" alt="avatar" />
																		</div>
																		<div class="comment-content clearfix">
																			<div class="comment-author font-alt">
																				<p>
																					${reply.userName} | <span class="comment-date">${review.prodRevCreateAt}</span>
																				<form id="deleteReview"
																					action="/product/deleteReview/${reply.prodRevNo}"
																					method="post" style="display: inline;">
																					<input type="hidden" name="prodRevNo"
																						value="${reply.prodRevNo}"> <input
																						type="hidden" name="prodNo"
																						value="${product.prodNo}">
																					<button type="submit" class="btn btn-danger btn-sm">리뷰
																						삭제</button>
																				</form>
																			</div>
																			<div class="comment-body">
																				<p>${reply.prodRevContent}</p>
																			</div>
																		</div>
																	</div>
																</c:if>
															</c:forEach>
														</c:forEach>
														<!-- 페이지 바 추가 -->
														<div class="row">
															<div class="col-sm-12">
																<ul class="pagination justify-content-center">
																	<li class="page-item"><a class="page-link"
																		href="productDetail?prod_no=${product.prodNo}&pageNo=${pageNo-1}">이전</a>
																	</li>
																	<c:forEach var="i" begin="1" end="${totalPage}"
																		varStatus="status">
																		<li
																			class="page-item <c:if test='${status.index eq pageNo}'>active</c:if>">
																			<a class="page-link"
																			href="productDetail?prod_no=${product.prodNo}&pageNo=${status.index}">${status.index}</a>
																		</li>
																	</c:forEach>
																	<li class="page-item"><a class="page-link"
																		href="productDetail?prod_no=${product.prodNo}&pageNo=${pageNo+1}">다음</a>
																	</li>
																</ul>
															</div>
														</div>
														<!-- 페이지 바 종료 -->
													</div>
												</div>
											</c:if>


											<!-- 리뷰가 없는 경우 -->
											<c:if test="${empty reviewProdNo}">
												<div id="reviews" class="tab-pane">
													<h3>등록된 후기</h3>
													<div class="noRev">아직 등록된 후기가 없습니다.</div>
												</div>
											</c:if>

											<!-- 리뷰 등록 -->
											<div class="comment-form col-sm-12">
												<h4 class="comment-form-title font-alt">리뷰 작성</h4>
												<form method="post" action="/product/addReview">
													<div class="row">
														<div class="col-sm-4">
															<div class="form-group">
																<input type="hidden" name="prodNo" id="prodNo"
																	value="${product.prodNo}"> <input type="hidden"
																	name="parentId" id="${review.prodRevNo}" value="">
																<label for="username">닉네임</label> <input
																	class="form-control" type="text" id="userName"
																	name="userName" value="${member.username}" readonly />
																<input class="form-control" type="hidden" id="userNo"
																	name="userNo" value="${member.userno}" />
															</div>
														</div>

														<div class="col-sm-4">
															<div class="form-group">
																<label for="prodRevStar">평점</label> <select
																	class="form-control" id="prodRevStar"
																	name="prodRevStar" required>
																	<option selected disabled>평점 선택</option>
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
																<label for="prodRevContent">리뷰 내용</label>
																<textarea class="form-control" name="prodRevContent"
																	rows="4" placeholder="리뷰를 작성해주세요" required></textarea>
															</div>
														</div>
														<div class="col-sm-12">
															<button class="btn btn-round btn-d" type="submit">리뷰
																작성</button>
														</div>
													</div>
												</form>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- 사이드 바 시작 -->
						<div class="col-sm-3 col-sm-offset-1 sidebar">
							<div class="widget" style="margin-top: 30px; text-align: center">
								<h2 class="widget-title font-alt" style="font-weight: bold">결제
									후 바로 예약 확정</h2>
								<p>
									빠르고 확실한 예약을 위해 'PlaceStation'에서 <br /> 온라인 결제를 진행하세요.
								</p>
							</div>
							<div class="widget">
								<h5 class="widget-title font-alt">제품</h5>
								<div class="row">
									<div class="col-sm-4">
										<!-- 찜하기 버튼 또는 찜 삭제 버튼 -->
										<c:choose>
											<c:when test="${isProductInWishlist}">
												<form method="post" action="/product/deleteWishlist">
													<input type="hidden" name="prodNo"
														value="${product.prodNo}">
													<p style="text-align: right">
														<button class="btn btn-danger btn-circle" type="submit">
															<i class="fa fa-frown-o"></i> 찜해제
														</button>
													</p>
												</form>
											</c:when>
											<c:otherwise>
												<form method="post" action="/product/addWishlist">
													<input type="hidden" name="prodNo"
													 value="${product.prodNo}">
													<p style="text-align: right">
														<button class="btn btn-success btn-circle" type="submit">
															<i class="fa fa-smile-o"></i> 찜하기
														</button>
													</p>
												</form>
											</c:otherwise>
										</c:choose>
									</div>
								</div>
							</div>

							<!-- 결제 시작 -->
							<div class="widget">
								<!-- 폼 태그 시작 -->
								<form action="/payment/main" method="get">
									<h5 class="widget-title font-alt">예약하기</h5>
									<input type="hidden" name="prodNo" value="${product.prodNo}" />

									<!-- 스케줄 선택 -->
									<div>
										<h5 class="font-alt">스케줄 선택</h5>
										<button class="btn btn-secondary dropdown-toggle"
											type="button" id="dropdownMenuClickableInside"
											data-bs-toggle="dropdown" data-bs-auto-close="outside"
											aria-expanded="false" onclick="hoverDateTime()">스케쥴
											선택 호버</button>
										<!-- input 창은 여기!! -->
										<input type="hidden" id="form-date" name="date" /> <input
											type="hidden" id="form-first-time" name="startTime" /> <input
											type="hidden" id="form-last-time" name="endTime" />

										<div class="row mb-20" id="timeSelector">
											<div class="col-sm-12">
												<!-- 캘린더 -->
												<div id="calendar" style="width: 350px"></div>
												<!-- 시간 시작 -->

												<!-- Slider main container -->
												<div class="swiper-container">
													<h6>시간을 눌러주세요</h6>
													<div class="swiper-wrapper">
														<!-- <div class="swiper-slide">1시 ~ 2시</div> -->
														<!-- 필요한 만큼 카드를 추가 -->
													</div>
												</div>
											</div>
										</div>
									</div>
									<!-- 가격 선택 -->
									<div>
										<h5 class="font-alt">가격</h5>
										<div class="row mb-20">
											<div class="col-sm-12">
												<input class="form-control input-lg" type="number"
													name="price" value="${product.prodPrice}"
													required="required" disabled />
											</div>
										</div>
									</div>

									<!-- 총 인수 선택 -->
									<div>
										<h5 class="font-alt">총인수</h5>
										<div class="row mb-20">
											<div class="col-sm-12">
												<input class="form-control input-lg" type="number"
													name="people" max="${product.prodMaximumPeople}" min="1"
													required="required" />
											</div>
										</div>
									</div>
									<div class="widget" style="margin-top: 30px;">
										<h4 class="widget-title font-alt">예약 확인</h4>


										<h6>날짜 :</h6>
										<h6 id="final-date"></h6>
										<h6>시간 :</h6>
										<h6 id="final-time"></h6>
										<br />
									</div>
									<div class="">
										<div class="col-sm-12" style="margin-top: -50px;">
											<input class="btn btn-lg btn-block btn-round btn-b"
												type="submit"></input>
											<p id="dateText" style="visibility: hidden"></p>
											<br />
											<p id="dayText" style="visibility: hidden"></p>
										</div>
									</div>
								</form>
								<!-- 폼 태그 끝 -->
							</div>
						</div>
						<!-- 사이드 바 끝 -->
					</div>
				</div>
				<!-- 리뷰 끝 -->
		</div>
		</div>
		<!--  사이드바  -->
		</section>
		</div>
		<!-- 본문 끝 -->

	</main>
	<!--  
    JavaScripts
    =============================================
    -->
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=86c4c40f5a0bbcd706e953e25fdd8538"></script>
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
      const startTime = ${product.prodStartTime};
      const lastTime = ${product.prodEndTime};
      let selectDate = "";
      let arrayTime;

      // 날짜 선택 호버 기능
      const hoverDateTime = () => {
        if (timeSelector.style.display === "none") {
          timeSelector.style.display = "block";
        } else {
          timeSelector.style.display = "none";
        }
      };
      
      function funcValidTime(date) {
    	  // invalidDate 변수가 외부에서 어떻게 전달되는지에 따라서 적절한 처리 필요

  	    $.ajax({
  	        type: "get",
  	        url: "/product/valid-time?date=" + date +"&prod-no=" + ${product.prodNo},
  	        headers : {"Content-Type" : "application/json;"},
  			dataType : "json",
  		       success: function (res) {
					arrayTime = res;
  					fillTime(res);
  		         },
  	        error: function(e) {
  	        	if(e.status == 400) {
  	        		fillTime([]);
  	        		arrayTime = "";
  	        		console.log("코드 400번");
  	        	} 
  	 
  	        }
  	    });
    	  
      }
		
      // 시간 영역 추가
      const fillTime = (res) => {
    	  console.log(startTime);
    	  console.log(lastTime);
    	  
    	  swiperWrapper.innerHTML = "";
        // 시간 추가 기능 - 처음 시간 ~ 마지막 시간
        for (let i = startTime; i < lastTime; i++) {
        	if(res.includes(i)) {
        		console.log(i);
        		 swiperWrapper.innerHTML += `<div class="swiper-slide font-alt disabled-div">` + i + `시<div id="time_days" onclick=""></div></div>`;
        	} else {
        		swiperWrapper.innerHTML += `<div class="swiper-slide font-alt">` + i + `시<div id="time_days" onclick=\"selectTime(` + i  +`)\"></div></div>`;
        	}
          
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
          
          // 유효성 검사 1
          for(var i = firstSelectedTime; i < timeNumber; i++) {
      		if(arrayTime.includes(i)) {
      			resetTime();
      			alert("시간이 중복될 수는 없습니다.")
      			return null;
      		}  
      	  }
        }

        // 유효성 검사 2
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
      var today = new Date();
      var validEndDate = new Date(today.getFullYear(), today.getMonth() + 3, 0);
      
      // 달력 설정
      document.addEventListener("DOMContentLoaded", function () {
        var calendarEl = document.getElementById("calendar");
        var calendar = new FullCalendar.Calendar(calendarEl, {
          initialView: "dayGridMonth",
          selectable: true,
          editable: false, // don't allow event dragging
          dateClick: function (info) {
            selectDate = info.dateStr;
            console.log(selectDate);
            
            finalDate.innerText = selectDate; // 현재 날짜
            
            // 시간 호버 기능 추가 - 보이기
            funcValidTime(selectDate);
            swiperContainer.style.display = "block";
            
            resetTime();
          },
          height: 450,
          validRange: {
              start: today,
              end: validEndDate
            }
        });
        calendar.render();
      });
      
      
      // 카카오 지도 API
        var container = document.getElementById('map');
		var prodLocationX = ${product.prodLocationX};
		var prodLocationY = ${product.prodLocationY};

      var options = {
          center: new kakao.maps.LatLng(prodLocationY, prodLocationX), // 지도의 중심좌표
          level: 3 // 지도의 레벨(확대, 축소 정도)
      };

      var map = new kakao.maps.Map(container, options);

      var markerPosition = new kakao.maps.LatLng(prodLocationY, prodLocationX);
      var marker = new kakao.maps.Marker({
          position: markerPosition
      });
      marker.setMap(map);
      
      
  	 // 날짜 포메팅 함수
      function formatDate(dateString, targetElementId) {
          var date = new Date(dateString);
          var year = date.getFullYear();
          var month = ("0" + (date.getMonth() + 1)).slice(-2);
          var day = ("0" + date.getDate()).slice(-2);
          var formattedDate = year + "-" + month + "-" + day;
          document.getElementById(targetElementId).textContent = formattedDate;
      }

      // 상품 날짜 포메팅
      formatDate("${product.prodRdate}", "formattedDate");

      // 리뷰 날짜 포메팅
      formatDate("${review.prodRevCreateAt}", "formattedReviewDate");
      
      function showReplyForm(parentId) {
    	    // parentId를 기반으로 대댓글 작성 폼이 있는지 확인
    	    var replyFormId = "replyForm_" + parentId;
    	    var replyForm = document.getElementById(replyFormId);
    	    if (replyForm.classList.contains("hidden")) {
    	        replyForm.classList.remove("hidden"); // 대댓글 작성 폼 표시
    	    } else {
    	        replyForm.classList.add("hidden"); // 대댓글 작성 폼 숨김
    	    }
    	}

  </script>
	<!-- include.jsp -->
	<%@ include file="/WEB-INF/view/layout/footer.jsp"%>
</body>
</html>