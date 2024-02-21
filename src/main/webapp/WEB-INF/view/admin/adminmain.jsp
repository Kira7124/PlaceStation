<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<!-- adminheader.jsp -->
    <%@ include file ="/WEB-INF/view/admin/adminheader.jsp" %>
	<!-- adminside.jsp -->
    <%@ include file ="/WEB-INF/view/admin/adminside.jsp" %>
     <!-- jquery/ajax 라이브러리 -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.js" integrity="sha512-+k1pnlgt4F1H8L7t3z95o3/KO+o78INEcXTbnoJQ/F2VqDVhWoaiVml/OEHv9HsVgxUaVW+IbiZPUJQfF/YxZw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

    
         
		
		<!-- MAIN -->
		<div class="main">
			<!-- MAIN CONTENT -->
			<div class="main-content">
				<div class="container-fluid">
					<!-- OVERVIEW -->
					<div class="panel panel-headline">
						<div class="panel-heading">
							<h3 class="panel-title"><b>admin 님 환영합니다!</b></h3>
						</div>
						<div class="panel-body">
							<div class="row">
								<div class="col-md-3">
									<div class="metric">
										<span class="icon" style="background-color: white;">
											<img src="/assets/icons/professionals.png" style="width:50px; height:50px;">
										</span>
										<p>
											<span class="number">${totalMember}</span>
											<span class="title">일반회원수</span>
										</p>
									</div>
								</div>
								<div class="col-md-3">
									<div class="metric">
										<span class="icon" style="background-color: white;">
											<img src="/assets/icons/professionals.png" style="width:50px; height:50px;">
										</span>
										<p>
											<span class="number">${totalBiz}</span>
											<span class="title">사업자수</span>
										</p>
									</div>
								</div>
								<div class="col-md-3">
									<div class="metric">
										<span class="icon" style="background-color: white;">
											<img src="/assets/icons/notice.png" style="width:50px; height:50px;">
										</span>
										<p>
											<span class="number">${totalNotice}</span>
											<span class="title">공지/문의</span>
										</p>
									</div>
								</div>
								<div class="col-md-3">
									<div class="metric">
										<span class="icon" style="background-color: white;">
											<img src="/assets/icons/payment.png" style="width:50px; height:50px;">
										</span>
										<p>
											<span class="number">203</span>
											<span class="title">결제/예약</span>
										</p>
									</div>
								</div>

							</div>
							<div class="row">
								
								
								
								
								
							</div>
						</div>
					</div>
					<!-- END OVERVIEW -->
					<div class="row">
						<div class="col-md-6">
							<!-- RECENT PURCHASES -->
							<div class="panel">
								<div class="panel-heading">
									<h3 class="panel-title"><b>공지사항</b></h3>
									<div class="right">
										<button type="button" class="btn-toggle-collapse"><i class="lnr lnr-chevron-up"></i></button>
									</div>
								</div>
								<div class="panel-body no-padding">
									<table class="table table-striped" style="width: 95%; margin: auto;">
										<thead>
											<tr>
												<th>번호</th>
												<th>글쓴이</th>
												<th>제목</th>
												<th>등록일</th>
												<th>조회수</th>
											</tr>
										</thead>
									<c:forEach var="noticelist" items="${noticelist}">
										<tbody>
											<tr>
												<td>${noticelist.nbno}</td>
												<td>${noticelist.nwriter}</td>
												<td><a href="/admin/admin-noticedetail?nbno=${noticelist.nbno}">${noticelist.ntitle}</a></td>
												<td>${noticelist.formatjoinAt()}</td>
												<td><span class="badge" style="margin-left: 10px;">${noticelist.nreadcount}</span></td>
											</tr>
											
										</tbody>
									  </c:forEach>	
									</table>
								</div>
								<div class="panel-footer">
									<div class="row">
										<div class="col-md-6"></div>
										<div class="col-md-6 text-right"><a href="/admin/admin-notice" class="btn btn-primary">전체목록보기</a></div>
									</div>
								</div>
							</div>
							<!-- END RECENT PURCHASES -->
						</div>
						<div class="col-md-6">
							<!-- 투두리스트 -->
							<div class="panel">
								<div class="panel-heading" style="display: flex;">
								    <h3 class="panel-title" style="flex: 1;"><b>TODO 리스트</b></h3>
								    <button type="button" class="btn-toggle-collapse" style="margin-right: 10px;"><i class="lnr lnr-chevron-up"></i></button>
								  	 <a href="/admin/admin-todoinsert" data-toggle="modal" data-target="#TodoinsertModal">
								    	<span class="label label-info" style="margin-left: 5px;">등록</span>
								    </a>
								    <a href="/admin/admin-tododelete" class="delete-button" data-toggle="modal" data-target="#TododeleteModal">
								    	<span class="label label-danger" style="margin-left: 5px;">삭제</span>
								    </a>
								</div>
								<div class="panel-body">
									<ul class="list-unstyled todo-list">
									<c:forEach var="todolist" items="${todolist}">
										<li>
											<label class="control-inline fancy-checkbox">
												<input type="checkbox"><span></span>
											</label>
											<p>
												<span class="title">${todolist.todotitle}</span>
												<span class="short-description">${todolist.todocontent}</span>
												<span class="date">${todolist.formatjoinAt()}</span>
											</p>
											<div class="controls">
												<a href="#"><i class="icon-software icon-software-pencil"></i></a> <a href="#"><i class="icon-arrows icon-arrows-circle-remove"></i></a>
											</div>
										</li>
									</c:forEach>
									</ul>
								</div>
							</div>
						 </div>
								<!-- END 투두리스트 -->
							
						    </div>
						</div>
					</div>
				</div>
			</div>
			<!-- END MAIN CONTENT -->
		</div>
		<!-- END MAIN -->	
	</div>
	<!-- END WRAPPER -->
	
	
	
		<!-- Modal -->
	<div class="modal fade" id="TododeleteModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	    <div class="modal-dialog" role="document">
	        <div class="modal-content"></div>
	    </div>
	</div>
	
	
			<!-- Modal -->
	<div class="modal fade" id="TodoinsertModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	    <div class="modal-dialog" role="document">
	        <div class="modal-content"></div>
	    </div>
	</div>
	
	
	
	
	
	
	
	
	
	
	<!-- Javascript -->
	<script src="/assets/vendor/jquery/jquery.min.js"></script>
	<script src="/assets/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="/assets/vendor/jquery-slimscroll/jquery.slimscroll.min.js"></script>
	<script src="/assets/vendor/jquery.easy-pie-chart/jquery.easypiechart.min.js"></script>
	<script src="/assets/vendor/chartist/js/chartist.min.js"></script>
	<script src="/assets/scripts/klorofil-common.js"></script>

</body>

</html>
