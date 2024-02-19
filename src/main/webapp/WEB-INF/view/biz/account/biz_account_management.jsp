
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
				<div class="col-md-4">
					<!-- VISIT CHART -->
					<div class="panel">
						<!-- PROFILE HEADER -->
						<div class="profile-header">
							<div class="overlay"></div>
							<div class="profile-main">
								<img src="/assets/img/user-medium.png" class="img-circle"
									alt="Avatar">
									<!-- <h3 class="name">${biz.userName}</h3> -->
								
							</div>
						</div>
						<!-- END PROFILE HEADER -->
						<!-- PROFILE DETAIL -->
						<div class="profile-detail">
							<div class="profile-info">
								<h4 class="heading">Basic Info</h4>
								<br/>
								<!-- 
								<ul class="list-unstyled list-justify">
									<li>분류 <span>${biz.role}</span></li>
									<li>등급 <span>${biz.userGrade}</span></li>
									<li>주소 <span>${biz.userAddress}</span></li>
									<li>상표명 <span>${biz.bizBrandName}</span></li>
									<li>폰 번호 <span>${biz.userHp}</span></li>
									<li>이메일 <span>${biz.userEmail}</span></li>
									<li>가입 날짜 <span>${biz.joinAt}</span></li>
									
								</ul>
								 -->
							</div>

							<div class="profile-info">
								<h4 class="heading">이용 약관</h4>
								<p>넌 못찌나간다</p>
							</div>
							<div class="text-center">
								<a href="/biz/account/update-form" class="btn btn-primary">Edit Profile</a>
							</div>
						</div>
						<!-- END PROFILE DETAIL -->
					</div>
					<!-- END VISIT CHART -->
				</div>

				<div class="col-md-7">
					<!-- TIMELINE -->
					<div class="panel panel-scrolling">
						<div class="panel-heading">
							<h4 class="heading">최근 소식</h4>
							<!-- TABBED CONTENT -->
							<div class="custom-tabs-line tabs-line-bottom left-aligned">
								<ul class="nav" role="tablist">
									<li class="active"><a href="#tab-bottom-left1" role="tab"
										data-toggle="tab">문의 내역</a></li>
									<li><a href="#tab-bottom-left2" role="tab"
										data-toggle="tab">아직 못정함<span class="badge">7</span></a></li>
								</ul>
							</div>
							<div class="tab-content">
								<div class="tab-pane fade in active" id="tab-bottom-left1">
									<ul class="list-unstyled activity-timeline">
										<li><i class="fa fa-comment activity-icon"></i>
											<p>
												Commented on post <a href="#">Prototyping</a> <span
													class="timestamp">2 minutes ago</span>
											</p></li>
										<li><i class="fa fa-cloud-upload activity-icon"></i>
											<p>
												Uploaded new file <a href="#">Proposal.docx</a> to project <a
													href="#">New Year Campaign</a> <span class="timestamp">7
													hours ago</span>
											</p></li>
										<li><i class="fa fa-plus activity-icon"></i>
											<p>
												Added <a href="#">Martin</a> and <a href="#">3 others
													colleagues</a> to project repository <span class="timestamp">Yesterday</span>
											</p></li>
										<li><i class="fa fa-check activity-icon"></i>
											<p>
												Finished 80% of all <a href="#">assigned tasks</a> <span
													class="timestamp">1 day ago</span>
											</p></li>
									</ul>
									<div class="margin-top-30 text-center">
										<a href="#" class="btn btn-default">See all activity</a>
									</div>
								</div>
								<div class="tab-pane fade" id="tab-bottom-left2">
									<div class="table-responsive">
										<table class="table project-table">
											<thead>
												<tr>
													<th>Title</th>
													<th>Progress</th>
													<th>Leader</th>
													<th>Status</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td><a href="#">Spot Media</a></td>
													<td>
														<div class="progress">
															<div class="progress-bar" role="progressbar"
																aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"
																style="width: 60%;">
																<span>60% Complete</span>
															</div>
														</div>
													</td>
													<td><img src="assets/img/user2.png" alt="Avatar"
														class="avatar img-circle"> <a href="#">Michael</a></td>
													<td><span class="label label-success">ACTIVE</span></td>
												</tr>
												<tr>
													<td><a href="#">E-Commerce Site</a></td>
													<td>
														<div class="progress">
															<div class="progress-bar" role="progressbar"
																aria-valuenow="33" aria-valuemin="0" aria-valuemax="100"
																style="width: 33%;">
																<span>33% Complete</span>
															</div>
														</div>
													</td>
													<td><img src="assets/img/user1.png" alt="Avatar"
														class="avatar img-circle"> <a href="#">Antonius</a></td>
													<td><span class="label label-warning">PENDING</span></td>
												</tr>
												<tr>
													<td><a href="#">Project 123GO</a></td>
													<td>
														<div class="progress">
															<div class="progress-bar" role="progressbar"
																aria-valuenow="68" aria-valuemin="0" aria-valuemax="100"
																style="width: 68%;">
																<span>68% Complete</span>
															</div>
														</div>
													</td>
													<td><img src="assets/img/user1.png" alt="Avatar"
														class="avatar img-circle"> <a href="#">Antonius</a></td>
													<td><span class="label label-success">ACTIVE</span></td>
												</tr>
												<tr>
													<td><a href="#">Wordpress Theme</a></td>
													<td>
														<div class="progress">
															<div class="progress-bar" role="progressbar"
																aria-valuenow="75" aria-valuemin="0" aria-valuemax="100"
																style="width: 75%;">
																<span>75%</span>
															</div>
														</div>
													</td>
													<td><img src="assets/img/user2.png" alt="Avatar"
														class="avatar img-circle"> <a href="#">Michael</a></td>
													<td><span class="label label-success">ACTIVE</span></td>
												</tr>
												<tr>
													<td><a href="#">Project 123GO</a></td>
													<td>
														<div class="progress">
															<div class="progress-bar progress-bar-success"
																role="progressbar" aria-valuenow="100" aria-valuemin="0"
																aria-valuemax="100" style="width: 100%;">
																<span>100%</span>
															</div>
														</div>
													</td>
													<td><img src="assets/img/user1.png" alt="Avatar"
														class="avatar img-circle" /> <a href="#">Antonius</a></td>
													<td><span class="label label-default">CLOSED</span></td>
												</tr>
												<tr>
													<td><a href="#">Redesign Landing Page</a></td>
													<td>
														<div class="progress">
															<div class="progress-bar progress-bar-success"
																role="progressbar" aria-valuenow="100" aria-valuemin="0"
																aria-valuemax="100" style="width: 100%;">
																<span>100%</span>
															</div>
														</div>
													</td>
													<td><img src="assets/img/user5.png" alt="Avatar"
														class="avatar img-circle" /> <a href="#">Jason</a></td>
													<td><span class="label label-default">CLOSED</span></td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
							</div>
							<!-- END TABBED CONTENT -->
						</div>
						<!-- END TIMELINE -->
					</div>
				</div>
			</div>
		</div>
		<!-- END MAIN CONTENT -->
	</div>
	<!-- END MAIN -->
	<!-- END WRAPPER -->

	<!-- adminside.jsp -->
	<%@ include file="/WEB-INF/view/biz/common/biz_footer.jsp"%>