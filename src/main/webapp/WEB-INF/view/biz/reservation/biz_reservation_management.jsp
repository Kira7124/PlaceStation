
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
				<div class="col-md-12">
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
										<th>내역 번호</th>
										<th>상품명</th>
										<th>이용자 이름</th>
										<th>이용자 등급</th>
										<th>가격</th>
										<th>인원 수</th>
										<th>은행</th>
										<th>이용 날짜 &amp; 시간</th>
										<th>결제 날짜 &amp; 시간</th>
										<th>결제 완료</th>
										<th>환불하기</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="history" items="${history}">
										<tr>
											<td>${history.adminHisNo}</td>
											<td>${history.prodTitle}</td>
											<td>${history.userName}</td>
											<td>${history.userGrade}</td>
											<td>${history.adminHisPrice}</td>
											<td>${history.peopleCount}명</td>
											<td>${history.bank}</td>
											<td>${history.purchaseDate} &nbsp ${history.startTime}:00~
												${history.endTime}:00</td>
											<td>${history.adminHisCreatedAt}</td>
											<td><span class="label label-success">${history.adminHisConfirm}</span></td>

											<td><span class="label label-danger" data-toggle="modal"
												data-target="#exampleModal">환불버튼</span> <!-- Modal -->
												<div class="modal fade" id="exampleModal" tabindex="-1"
													aria-labelledby="exampleModalLabel" aria-hidden="true">
													<div class="modal-dialog">
														<div class="modal-content">
															<div class="modal-header">
																<h5 class="modal-title" id="exampleModalLabel">취소
																	사유</h5>
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
																<button type="button" class="btn btn-primary">환불하기</button>
															</div>
														</div>
													</div>
												</div></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<nav aria-label="Page navigation example" style="margin: auto;">
								<ul class="pagination">

									<li class="page-item"><c:choose>
											<c:when test="${currentPage > 0}">
												<a class="page-link"
													href="/biz/reservation-management?page=${currentPage - 1}&size=12"
													aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
												</a>

											</c:when>

											<c:otherwise>
												<a class="page-link" href="#" aria-label="Previous"> <span
													aria-hidden="true">&laquo;</span>
												</a>
											</c:otherwise>
										</c:choose></li>

									<c:forEach begin="${startPage}" end="${endPage}" var="var">
										<li class="page-item"><a class="page-link"
											href="/biz/reservation-management?page=${var - 1}&size=12">${var}</a></li>
									</c:forEach>


									<li class="page-item"><c:choose>
											<c:when test="${currentPage < endPage - 1}">
												<a class="page-link"
													href="/biz/reservation-management?page=${currentPage + 1}&size=12"
													aria-label="Next"> <span aria-hidden="true">&raquo;</span>
												</a>

											</c:when>
											<c:otherwise>
												<a class="page-link" href="#" aria-label="Next"> <span
													aria-hidden="true">&raquo;</span>
												</a>
											</c:otherwise>
										</c:choose></li>
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

<script>
	console.log(${currentPage});
	console.log(${totalItems});
	console.log(${totalPages});
	console.log(${startPage});
	console.log(${endPage});
</script>

<!-- adminside.jsp -->
<%@ include file="/WEB-INF/view/biz/common/biz_footer.jsp"%>