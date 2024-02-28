
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
								<img src="${biz.filePath}" class="img-circle" alt="Avatar"
									style="width: 250px; height: 200px">
								<h3 class="name">${biz.userName}</h3>

							</div>
						</div>
						<!-- END PROFILE HEADER -->
						<!-- PROFILE DETAIL -->
						<div class="profile-detail">
							<div class="profile-info">
								<h4 class="heading">Basic Info</h4>
								<br />

								<ul class="list-unstyled list-justify">
									<li>분류 <span>${biz.role}</span></li>
									<li>등급 <span>${biz.userGrade}</span></li>
									<li>주소 <span>${biz.userAddress}</span></li>
									<li>상표명 <span>${biz.bizBrandName}</span></li>
									<li>폰 번호 <span>${biz.userHp}</span></li>
									<li>이메일 <span>${biz.userEmail}</span></li>
									<li>가입 날짜 <span>${biz.joinAt}</span></li>

								</ul>
							</div>

							<div class="profile-info"></div>
							<div class="text-center">
								<a href="/biz/account/update-form" class="btn btn-primary">Edit
									Profile</a>
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
							<h4 class="heading">환경</h4>
							<!-- TABBED CONTENT -->
							<div class="custom-tabs-line tabs-line-bottom left-aligned">
								<ul class="nav" role="tablist">
									<li class="active"><a href="#tab-bottom-left1" role="tab"
										data-toggle="tab">상품 상황</a></li>
									<li><a href="#tab-bottom-left2" role="tab"
										data-toggle="tab">이용 약관</a></li>
								</ul>
							</div>
							<div class="tab-content">
								<div class="tab-pane fade in active" id="tab-bottom-left1">
									<div class="table-responsive">
										<table class="table project-table">
											<thead>
												<tr>
													<th>상품 번호</th>
													<th>상품명</th>
													<th>등록일</th>
													<th>Progress</th>
													<th>사업자 명</th>
													<th>State</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="product" items="${products}">
													<tr>
														<td><a
															href="/product/productDetail?prod_no=${product.prodNo}">${product.prodNo}</a></td>
														<td><a
															href="/product/productDetail?prod_no=${product.prodNo}">${product.prodTitle}</a></td>

														<td><a
															href="/product/productDetail?prod_no=${product.prodNo}">${product.prodRdate}</a></td>
														<td><c:if test="${product.prodDeleteYn == 'N'}">
																<div class="progress">
																	<div class="progress-bar progress-bar-success"
																		role="progressbar" aria-valuenow="100"
																		aria-valuemin="0" aria-valuemax="100"
																		style="width: 100%;">
																		<span>100%</span>
																	</div>
																</div>
															</c:if> <c:if test="${product.prodDeleteYn == 'Y'}">
																<div class="progress">
																	<div class="progress">
																		<div class="progress-bar" role="progressbar"
																			aria-valuenow="0" aria-valuemin="0" aria-valuemax="0"
																			style="width: 0%;">
																			<span>No working</span>
																		</div>
																	</div>
																</div>
															</c:if></td>
														<td><img src="${biz.filePath}" alt="Avatar"
															class="avatar img-circle"> <a href="#">${biz.userName}</a></td>
														<c:if test="${product.prodDeleteYn == 'N'}">
															<td><span class="label label-success">ACTIVE</span></td>
														</c:if>

														<c:if test="${product.prodDeleteYn == 'Y'}">
															<td><span class="label label-danger">PENDING</span></td>
														</c:if>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
								</div>
								<div class="tab-pane fade" id="tab-bottom-left2">
									<ul class="list-unstyled activity-timeline">
										<li><i class="fa fa-comment activity-icon"></i>
											<h4>제 1 장 총칙</h4>
											<h5>제 1 조 (목적)</h5>
											<p>본 약관은 (주)그린 컴퓨터 아카데미(이하 “회사”라 합니다)이 운영하는 웹사이트
												‘PlaceStation’ (이하 “웹사이트”라 합니다)에서 제공하는 온라인 서비스(이하 “서비스”라
												한다)를 이용함에 있어 사이버몰과 이용자의 권리, 의무 및 책임사항을 규정함을 목적으로 합니다.</p> <br />
											<h4>제 2 조 (용어의 정의)</h4>
											<h5>본 약관에서 사용하는 용어는 다음과 같이 정의한다.</h5>

											<p>“웹사이트”란 회사가 재화 또는 용역을 이용자에게 제공하기 위하여 컴퓨터 등 정보통신설비를
												이용하여 재화 또는 용역을 거래 할 수 있도록 설정한 가상의 영업장을 말하며, 아울러 사이버몰을 운영하는
												사업자의 의미로도 사용합니다. “이용자”란 “웹사이트”에 접속하여 서비스를 이용하는 회원 및 비회원을
												말합니다. “회원”이라 함은 “웹사이트”에 개인정보를 제공하여 회원등록을 한 자로서, “웹사이트”의 정보를
												지속적으로 제공받으며, “웹사이트”이 제공하는 서비스를 계속적으로 이용할 수 있는 자를 말합니다.
												“비회원”이라 함은 회원에 가입하지 않고, “웹사이트”이 제공하는 서비스를 이용하는 자를 말합니다.
												“ID”라 함은 이용자가 회원가입당시 등록한 사용자 “개인이용문자”를 말합니다.</p></li>
										<li><i class="fa fa-cloud-upload activity-icon"></i>
											<p>
											<h4>제 19 조 (면책 및 손해배상)</h4>
											<ol>
												<li>천재지변 또는 이에 준하는 불가항력으로 인하여 서비스를 제공할 수 없는 경우에는 회사의
													서비스 제공 책임이 면제된다.</li>
												<li>회사는 이용자간 또는 이용자와 제3자간의 상호거래 관계에서 발생되는 결과에 대하여 어떠한
													책임도 부담하지 않는다.</li>
												<li>회사는 이용자가 게시판에 게재한 정보, 자료, 내용 등에 관하여 사실의 정확성, 신뢰도 등에
													어떠한 책임도 부담하지 않으며 이용자는 본인의 책임 아래 본 사이트를 이용해야 한다.</li>
												<li>이용자가 게시 또는 전송한 자료 등에 관하여 손해가 발생하거나 자료의 취사선택, 기타 무료로
													제공되는 서비스 이용과 관련해 어떠한 불이익이 발생하더라도 이에 대한 모든 책임은 이용자에게 있다.</li>
												<li>아이디와 비밀번호의 관리 및 이용자의 부주의로 인하여 발생되는 손해 또는 제3자에 의한
													부정사용 등에 대한 책임은 이용자에게 있다.</li>
												<li>이용자가 본 약관의 규정을 위반함으로써 회사에 손해가 발생하는 경우 이 약관을 위반한
													이용자는 회사에 발생한 모든 손해를 배상해야 하며 동 손해로부터 회사를 면책시켜야 한다.</li>
											</ol>
											<h4>제 20 조 (개인신용정보 제공 및 활용에 대한 동의서)</h4>
											<p>회사가 회원 가입과 관련해 취득한 개인 신용 정보는 신용정보의 이용 및 보호에 관한 법률
												제23조의 규정에 따라 타인에게 제공 및 활용 시 이용자의 동의를 얻어야 한다. 이용자의 동의는 회사가
												회원으로 가입한 이용자의 신용정보를 신용정보기관, 신용정보업자 및 기타 이용자 등에게 제공해 이용자의 신용을
												판단하기 위한 자료로서 활용하거나 공공기관에서 정책자료로 활용하는데 동의하는 것으로 간주한다.</p></li>
									</ul>
									<div class="margin-top-30 text-center">
										<a href="#" class="btn btn-default">See all activity</a>
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