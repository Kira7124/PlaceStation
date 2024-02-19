
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- adminheader.jsp -->
<%@ include file="/WEB-INF/view/biz/common/biz_header.jsp"%>
<!-- adminside.jsp -->
<%@ include file="/WEB-INF/view/biz/common/biz_aside.jsp"%>


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
							<h3 class="panel-title">이용자 결제 내역</h3>
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
							<table class="table table-striped">
								<thead>
									<tr>
										<th>상품명</th>
										<th>이름</th>
										<th>가격</th>
										<th>인원 수</th>
										<th>이용 날짜 &amp; 시간</th>
										<th>결제 날짜 &amp; 시간</th>
										<th>결제 완료</th>
										<th>예약 시간 수정</th>
										<th>취소</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td><a href="#">763648</a></td>
										<td>Steve</td>
										<td>$122</td>
										<td>6명</td>
										<td>2024-02-02 16:00 ~ 17:00</td>
										<td>2024-02-01 16:00</td>
										<td><span class="label label-success">SUCCESS</span></td>
										<td><span class="label label-success">예약 시간 수정</span></td>

										<td><span class="label label-danger" data-toggle="modal" data-target="#exampleModal">취소버튼</span>

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
													<div class="modal-body"><textarea name="" style="width:100%; height: 200px;"></textarea></div>
													<div class="modal-footer">
														<button type="button" class="btn btn-secondary"
															data-dismiss="modal">닫기</button>
														<button type="button" class="btn btn-primary">취소하기</button>
													</div>
												</div>
											</div>
										</div>
										</td>

									</tr>
								</tbody>
							</table>
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
						</div>
						<div class="panel-footer">
							<div class="row">
								<div class="col-md-6">
									<span class="panel-note"><i class="fa fa-clock-o"></i>
										Last 24 hours</span>
								</div>
								<div class="col-md-6 text-right">
									<a href="#" class="btn btn-primary">View All Purchases</a>
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