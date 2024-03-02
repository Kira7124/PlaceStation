
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
<!-- 검색창 -->
							<div class="input-group" style="margin-bottom: 30px;">
							<form action="/biz/reservation-management">
								<input type="hidden" name="page" value="${currentPage}"/>
								<input type="hidden" name="size" value="${size}" />
								<input class="form-control" type="text" name="text" style="width: 350px"/> <span
									class="input-group-btn" >
									<button class="btn btn-primary"
								type="submit">검색</button></span>
								</form>
							</div>
							<table class="table table-striped">
								<thead>
									<tr>
										<th>내역 번호</th>
										<th>상품명</th>
										<th>이용자 이름</th>
										<th>이용자 등급</th>
										<th>결제 금액</th>
										<th>인원 수</th>
										<th>은행</th>
										<th>이용 날짜 &amp; 시간</th>
										<th>결제 날짜 &amp; 시간</th>
										<th>결제 완료</th>
										<th>환불 요청</th>
										<th>환불하기</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="historyDto" items="${history}">
										<tr>
											<td>${historyDto.adminHisNo}</td>
											<td>${historyDto.prodTitle}</td>
											<td>${historyDto.userName}</td>
											<td>${historyDto.userGrade}</td>
											<td>${historyDto.adminHisPrice + historyDto.adminHisCharge}</td>
											<td>${historyDto.peopleCount}명</td>
											<td>${historyDto.bank}</td>
											<td>${historyDto.purchaseDate}&nbsp
												${historyDto.startTime}:00 ~ ${historyDto.endTime}:00</td>
											<td>${historyDto.adminHisCreatedAt}</td>
											<td><span class="label label-success">${historyDto.adminHisConfirm}</span></td>
											<c:if test="${historyDto.cancelYn == 'Y'}">
												<td><span class="label label-danger">환불완료</span></td>
											</c:if>
											<c:if test="${historyDto.cancelYn == 'N'}">
												<td><span class="label label-success"></span></td>
											</c:if>
											<td><c:if test="${historyDto.cancelYn == 'N'}">
													<span class="label label-danger" data-toggle="modal"
														data-target="#${historyDto.adminHisNo}">환불버튼</span>
													<!-- Modal -->
												</c:if>
												<div class="modal fade" id="${historyDto.adminHisNo}"
													tabindex="-1" aria-labelledby="exampleModalLabel"
													aria-hidden="true">
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
															<!-- form 태그 시작 -->
															<form action="/biz/reservation-management/refund"
																method="post">
																<div class="modal-body">
																	<textarea name="reason"
																		style="width: 100%; height: 200px;"></textarea>
																</div>
																<div class="modal-footer">
																	<button type="button" class="btn btn-secondary"
																		data-dismiss="modal">닫기</button>

																	<input type="hidden" name="merchantUid"
																		value="${historyDto.adminHisNo}" /> 
																		<input type="hidden" name="adminHisSellerId"
																		value="${historyDto.adminHisSellerId}" /> 
																		<input
																		type="hidden" name="adminHisCreatedAt"
																		value="${historyDto.adminHisCreatedAt}" /> <input
																		type="hidden" name="purchaseDate"
																		value="${historyDto.purchaseDate}" /> <input
																		type="hidden" name="adminHisPrice"
																		value="${historyDto.adminHisPrice}" /> <input
																		type="hidden" name="adminHisCharge"
																		value="${historyDto.adminHisCharge}" /> 
																		<input
																		type="hidden" name="adminHisSavePoint"
																		value="${historyDto.adminHisSavePoint}" /> 
																		
																		<input
																		type="hidden" name="adminHisUsePoint"
																		value="${historyDto.adminHisUsePoint}" /> 
																		<input
																		type="hidden" name="adminHisDiscount"
																		value="${historyDto.adminHisDiscount}" /> 
																		<input

																		type="submit" class="btn btn-primary"></input>
																</div>
															</form>
														</div>
													</div>
												</div>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>



							<nav aria-label="Page navigation example" style="margin: auto;">
								<ul class="pagination">
									<li class="page-item"><c:choose>
											<c:when test="${currentPage > 0}">
												<a class="page-link"
													href="/biz/reservation-management?page=${currentPage - 1}&size=${size}&text=${text}"
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
											href="/biz/reservation-management?page=${var - 1}&size=${size}&text=${text}">${var}</a></li>

									</c:forEach>


									<li class="page-item"><c:choose>
											<c:when test="${currentPage < endPage - 1}">
												<a class="page-link"
													href="/biz/reservation-management?page=${currentPage + 1}&size=${size}&text=${text}"

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
										일정 관리로 가시겠습니까?</span>
								</div>
								<div class="col-md-6 text-right">
									<a href="/biz/schedule-management" class="btn btn-primary">일정 관리 보기</a>
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
console.log(${startPage})
console.log(${endPage})
</script>

<!-- adminside.jsp -->
<%@ include file="/WEB-INF/view/biz/common/biz_footer.jsp"%>