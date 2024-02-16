
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- adminheader.jsp -->
<%@ include file="/WEB-INF/view/biz/common/header.jsp"%>
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
										<a href="/biz/main"> <span class="icon"><i
												class="fa fa-download"></i></span>

											<p>
												<span class="number">통계</span> <br /> <span><p>사용자의
														일정관리가 가능합니다.</p></span>
											</p>
										</a>
									</div>
								</div>
								<div class="col-md-3">
									<div class="metric">
										<a href="/biz/main"> <span class="icon"><i
												class="fa fa-download"></i></span>

											<p>
												<span class="number">일정 관리</span> <br /> <span><p>사용자의
														일정관리가 가능합니다.</p></span>
											</p>
										</a>
									</div>
								</div>
								<div class="col-md-3">
									<div class="metric">
										<a href="/biz/main"> <span class="icon"><i
												class="fa fa-download"></i></span>

											<p>
												<span class="number">상품 관리</span> <br /> <span><p>사용자의
														일정관리가 가능합니다.</p></span>
											</p>
										</a>
									</div>
								</div>
								<div class="col-md-3">
									<div class="metric">
										<a href="/biz/main"> <span class="icon"><i
												class="fa fa-download"></i></span>

											<p>
												<span class="number">결제 / 예약 관리</span> <br /> <span><p>사용자의
														일정관리가 가능합니다.</p></span>
											</p>
										</a>
									</div>
								</div>
								<div class="col-md-3">
									<div class="metric">
										<a href="/biz/main"> <span class="icon"><i
												class="fa fa-download"></i></span>

											<p>
												<span class="number">계정 관리</span> <br /> <span><p>사용자의
														일정관리가 가능합니다.</p></span>
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
														일정관리가 가능합니다.</p></span>
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
				<div class="row">
					<div class="col-md-7">
						<!-- VISIT CHART -->
						<div class="panel">
							<div class="panel-heading">
								<h3 class="panel-title">일주일 간 사용자 이용량</h3>
								<div class="right">
									<button type="button" class="btn-toggle-collapse">
										<i class="lnr lnr-chevron-up"></i>
									</button>
									<button type="button" class="btn-remove">
										<i class="lnr lnr-cross"></i>
									</button>
								</div>
							</div>
							<div class="panel-body">
								<div id="visits-chart" class="ct-chart"></div>
							</div>
						</div>
						<!-- END VISIT CHART -->
					</div>

					<div class="col-md-5">
						<!-- TIMELINE -->
						<div class="panel panel-scrolling">
							<div class="panel-heading">
								<h3 class="panel-title">이용자 최근 질문 내역</h3>
								<div class="right">
									<button type="button" class="btn-toggle-collapse">
										<i class="lnr lnr-chevron-up"></i>
									</button>
									<button type="button" class="btn-remove">
										<i class="lnr lnr-cross"></i>
									</button>
								</div>
							</div>
							<div class="panel-body">
								<ul class="list-unstyled activity-list">
									<li><img src="/assets/img/user1.png" alt="Avatar"
										class="img-circle pull-left avatar">
										<p>
											<a href="#">Michael</a> 사용자 질문 있습니다!!! <span
												class="timestamp">20 minutes ago</span>
										</p></li>
									<li><img src="/assets/img/user1.png" alt="Avatar"
										class="img-circle pull-left avatar">
										<p>
											<a href="#">Michael</a> 사용자 질문 있습니다!!! <span
												class="timestamp">20 minutes ago</span>
										</p></li>
									<li><img src="/assets/img/user1.png" alt="Avatar"
										class="img-circle pull-left avatar">
										<p>
											<a href="#">Michael</a> 사용자 질문 있습니다!!! <span
												class="timestamp">20 minutes ago</span>
										</p></li>
									<li><img src="/assets/img/user1.png" alt="Avatar"
										class="img-circle pull-left avatar">
										<p>
											<a href="#">Michael</a> 사용자 질문 있습니다!!! <span
												class="timestamp">20 minutes ago</span>
										</p></li>
									<li><img src="/assets/img/user1.png" alt="Avatar"
										class="img-circle pull-left avatar">
										<p>
											<a href="#">Michael</a> 사용자 질문 있습니다!!! <span
												class="timestamp">20 minutes ago</span>
										</p></li>
								</ul>
								<button type="button"
									class="btn btn-primary btn-bottom center-block">더보기</button>
							</div>
						</div>
						<!-- END TIMELINE -->
					</div>
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