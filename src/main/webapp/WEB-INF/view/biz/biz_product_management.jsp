
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
						<div class="panel-body no-padding">
							<!-- 카드 시작 -->
							<div class="card mb-3"
								style="max-width: 1200px; border: 1px solid black; margin-bottom: 20px; border-radius: 20px">
								<div class="row no-gutters">
									<div class="col-md-4">
										<img src="/assets/img/dog.jpg" alt="..."
											style="width: 300px; border-radius: 20px">
									</div>
									<div class="col-md-8">
										<div class="card-body">
											<a href="/biz/main">
												<h2 class="card-title">Card title ( 상품 명 )</h2>
												<h4>소제목</h4>
												<p class="card-text">This is a wider card with
													supporting text below as a natural lead-in to additional
													content. This content is a little bit longer.</p> <br />
												<h4>소제목2</h4>
												<p class="card-text">This is a wider card with
													supporting text below as a natural lead-in to additional
													content. This content is a little bit longer.</p>
											</a> </br> <span class="label label-success">수정</span> <span
												class="label label-danger" data-toggle="modal"
												data-target="#exampleModal">취소버튼</span>

											<!-- Modal -->
											<div class="modal fade" id="exampleModal" tabindex="-1"
												aria-labelledby="exampleModalLabel" aria-hidden="true">
												<div class="modal-dialog">
													<div class="modal-content">
														<div class="modal-header">
															<h5 class="modal-title" id="exampleModalLabel">취소 사유</h5>
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
														</div>
														<div class="modal-body">
															<textarea name="" style="width: 100%; height: 200px;"></textarea>
														</div>
														<div class="modal-footer">
															<button type="button" class="btn btn-secondary"
																data-dismiss="modal">닫기</button>
															<button type="button" class="btn btn-primary">삭제하기</button>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- 카드 끝 -->
							<!-- 페이지네이션 시작 -->

							<nav aria-label="Page navigation example" style="margin: auto;">
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
							<!-- 페이지네이션 끝 -->
						</div>
						<div class="panel-footer">
							<div class="row">
								<div class="col-md-6">
									<span class="panel-note"><i class="fa fa-clock-o"></i>
										상품 등록은 이곳에서 할 수 있습니다.</span>
								</div>
								<div class="col-md-6 text-right">
									<a href="#" class="btn btn-primary">상품 등록</a>
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