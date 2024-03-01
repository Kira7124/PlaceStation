
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
			<!-- OVERVIEW -->

			<!-- END OVERVIEW -->
			<div class="row">
				<div class="col-md-12">
					<!-- RECENT PURCHASES -->
					<div class="panel">
						<div class="panel-heading">
							<h3 class="panel-title">사업자 관리 페이지</h3>
							<div class="right">
								<button type="button" class="btn-toggle-collapse">
									<i class="lnr lnr-chevron-up"></i>
								</button>
								<button type="button" class="btn-remove">
									<i class="lnr lnr-cross"></i>
								</button>
							</div>
						</div>
						<div class="panel-body no-padding" style="margin: 20px;">
							<h2>어떤 업무를 보시겠습니까?</h2>
							<br />
							<div class="row">
								<div class="col-md-3">
									<div class="metric">
										<a href="/biz/statistics"> <span class="icon"><i
												class="fa fa-download"></i></span>

											<p>
												<span class="number">통계</span> <br /> <span><p>상품에 관한 통계를 볼 수 있습니다.</p></span>
											</p>
										</a>
									</div>
								</div>
								<div class="col-md-3">
									<div class="metric">
										<a href="/biz/schedule-management"> <span class="icon"><i
												class="fa fa-download"></i></span>

											<p>
												<span class="number">일정 관리</span> <br /> <span><p>이곳에서 일정 관리가 가능합니다.</p></span>
											</p>
										</a>
									</div>
								</div>
								<div class="col-md-3">
									<div class="metric">
										<a href="/biz/product-management"> <span class="icon"><i
												class="fa fa-download"></i></span>

											<p>
												<span class="number">상품 관리</span> <br /> <span><p>이곳에서
														상품 관리가 가능합니다.</p></span>
											</p>
										</a>
									</div>
								</div>
								<div class="col-md-3">
									<div class="metric">
										<a href="/biz/reservation-management"> <span class="icon"><i
												class="fa fa-download"></i></span>

											<p>
												<span class="number">결제 / 예약 관리</span> <br /> <span><p>이용자의
														결제 / 예약 관리가 가능합니다.</p></span>
											</p>
										</a>
									</div>
								</div>
								<div class="col-md-3">
									<div class="metric">
										<a href="/biz/account-management"> <span class="icon"><i
												class="fa fa-download"></i></span>

											<p>
												<span class="number">계정 관리</span> <br /> <span><p>사용자의
														계정 관리가 가능합니다.</p></span>
											</p>
										</a>
									</div>
								</div>
								<div class="col-md-3">
									<div class="metric">
										<a href="/biz/main"> <span class="icon"><i
												class="fa fa-download"></i></span>
											<p>
												<span class="number">문의 내역</span> <br /> <span><p>사용자의
														문의 내역을 볼 수 있습니다.</p></span>
											</p>
										</a>
									</div>
								</div>
							</div>
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
			</div>
		</div>
		<!-- END MAIN CONTENT -->
	</div>
	<!-- END MAIN -->
</div>
<!-- END WRAPPER -->

<!-- adminside.jsp -->
<%@ include file="/WEB-INF/view/biz/common/biz_footer.jsp"%>