
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- adminheader.jsp -->
<%@ include file="/WEB-INF/view/biz/common/biz_header.jsp"%>
<!-- adminside.jsp -->
<%@ include file="/WEB-INF/view/biz/common/biz_aside.jsp"%>


<style>
h2, p, h4 {
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}

* {
	box-sizing: border-box;
	padding: 0;
	margin: 0;
}

.container {
	display: flex;
	flex-flow: row wrap;
	justify-content: space-between;
	align-content: flex-start;
}

/* item에 hidden 처리하기. */
.item {
	width: 100%;
	aspect-ratio: 6/5;
	position: relative;
	overflow: hidden;
	border-radius: 10px;
}

.item:after {
	/* block & content */
	display: block;
	content: "";
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.2);
	position: absolute;
	top: 0;
	left: 0;
	z-index: 2;
	opacity: 0;
}

.imgBox {
	width: 100%;
	height: 100%;
	position: absolute;
}

.imgBox img {
	width: 100%;
	height: 100%;
	/* 사진이나 비디오의 규격 맞출 때 object-fit 이용하기. */
	object-fit: cover;
	z-index: 1;
}

.textBox {
	position: absolute;
	width: 100%;
	height: 100%;
	display: flex;
	flex-direction: column;
	justify-content: flex-end;
	align-items: flex-start;
	padding: 20px;
	z-index: 3;
}

.textBox p {
	color: white;
	margin: 5px 0 0;
}

.textBox__name {
	font-size: 22px;
	font-weight: 500;
	opacity: 0;
	transform: translateY(50px);
}

.textBox__price {
	font-size: 16px;
	font-weight: 400;
	opacity: 0;
	transform: translateY(50px);
}

/* 마우스 올렸을 때에 기능 추가하기. */
.item:hover:after {
	opacity: 1;
}

/* 기능 1 : 화면 살짝 불투명 + 화면 커지기. */
.item:hover .imgBox img {
	transform: scale(1.1);
	/* 블러 처리하기. */
	filter: blur(3px);
}

/* 기능 2 : 상품 정보 보이면서 위로 올라가기. */
.item:hover .textBox .textBox__name {
	opacity: 1;
	transform: translateY(0px);
}

/* 기능 2 : 상품 정보 보이면서 위로 올라가기. */
.item:hover .textBox .textBox__price {
	opacity: 1;
	transform: translateY(0px);
}

/* 자연스럽게 트랜지션 적용하기. */
.item:after, .item .imgBox img, .item .textBox__name, .item .textBox__price
	{
	transition: all 0.4s ease-in-out;
}
</style>
<!-- MAIN -->
<div class="main">
	<!-- MAIN CONTENT -->
	<div class="main-content">
		<div class="container-fluid">
			<!-- END OVERVIEW -->
			<div class="row">
				<div class="col-md-10">
					<!-- RECENT PURCHASES -->
					<div class="panel" style="padding: 30px">
						<div class="panel-heading">
							<h3 class="panel-title">상품 등록 관리</h3>
							<div class="right">
								<button type="button" class="btn-toggle-collapse">
									<i class="lnr lnr-chevron-up"></i>
								</button>
								<button type="button" class="btn-remove">
									<i class="lnr lnr-cross"></i>
								</button>
							</div>
						</div>


						<c:forEach items="${products}" var="product">

							<div class="container" style="margin-bottom: 20px;">
								<div class="col-md-4">

									<div class="item">
										<a href="/product/productDetail?prod_no=${product.prodNo}">
											<div class="imgBox">
												<img src="${product.filePath[0]}" alt="제품 이미지" />
											</div>
											<div class="textBox">
												<p class="textBox__name">${product.prodTitle}</p>
												<p class="textBox__price">${product.prodPrice} 원</p>
											</div>
										</a>
									</div>

								</div>

								<div class="col-md-8">
									<div class="card-body">
										<h2 class="card-title">제품명 : ${product.prodTitle}</h2>
										<h4>공간 소개</h4>
										<p class="card-text">${product.prodSpaceInfo}</p>
										<br /> <a href="/biz/update-product-form/${product.prodNo}"><span
											class="label label-success">수정</span></a> <span
											class="label label-danger" data-toggle="modal"
											data-target="#${product.prodNo}">취소버튼</span>

										<!-- Modal -->
										<div class="modal fade" id="${product.prodNo}" tabindex="-1"
											aria-labelledby="exampleModalLabel" aria-hidden="true">
											<div class="modal-dialog">
												<div class="modal-content">
													<form
														action="/biz/product/delete-product/${product.prodNo}"
														method="post">
														<input type="hidden" name="_method" value="delete" />
														<div class="modal-header">
															<h5 class="modal-title" id="exampleModalLabel">취소 사유</h5>
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
														</div>

														<div class="modal-body">
															<textarea style="width: 100%; height: 200px;"
																name="prodDeleteReason"></textarea>
														</div>
														<div class="modal-footer">
															<button type="button" class="btn btn-secondary"
																data-dismiss="modal">닫기</button>
															<input type="submit" class="btn btn-primary"
																value="제품 삭제하기" />
														</div>
													</form>
												</div>
											</div>
										</div>

									</div>
								</div>
							</div>
						</c:forEach>
						<!-- 페이지네이션 시작 -->

						<!-- <nav aria-label="Page navigation example" style="margin: auto;">
							<ul class="pagination">
								<li class="page-item"><a class="page-link" href="#"
									aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
								</a></li>
								<li class="page-item"><a class="page-link" href="#">1</a></li>
								<li class="page-item"><a class="page-link" href="#">2</a></li>
								<li class="page-item"><a class="page-link" href="#">3</a></li>
								<li class="page-item"><a class="page-link" href="#"
									aria-label="Next"> <span aria-hidden="true">&raquo;</span>
								</a></li>
							</ul>
						</nav>
						 -->
						<!-- 페이지네이션 끝 -->
						<div class="panel-footer">
							<div class="row">
								<div class="col-md-6">
									<span class="panel-note"><i class="fa fa-clock-o"></i>
										상품 등록은 이곳에서 할 수 있습니다.</span>
								</div>
								<div class="col-md-6 text-right">
									<a href="/biz/add-product-form" class="btn btn-primary">상품
										등록</a>
								</div>
							</div>
						</div>
					</div>
				</div>

				<!-- END RECENT PURCHASES -->
			</div>
			<div class="row"></div>
		</div>
	</div>
	<!-- END MAIN CONTENT -->
</div>
<!-- END MAIN -->
</div>
<!-- END WRAPPER -->

<!-- adminside.jsp -->
<%@ include file="/WEB-INF/view/biz/common/biz_footer.jsp"%>