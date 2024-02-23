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
										<button type="button" class="btn-remove"><i class="lnr lnr-cross"></i></button>
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
								    <h3 class="panel-title" style="flex: 1;"><b>투두리스트</b></h3>
								    <button type="button" class="btn-toggle-collapse" style="margin-right: 10px;"><i class="lnr lnr-chevron-up"></i></button>
								    <span class="label label-info" style="margin-right: 5px;">등록</span>
								    <span class="label label-success">수정</span>
								    <span class="label label-danger" style="margin-left: 5px;">삭제</span>
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
	
	
	
	<!-- Javascript -->
	<script src="/assets/vendor/jquery/jquery.min.js"></script>
	<script src="/assets/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="/assets/vendor/jquery-slimscroll/jquery.slimscroll.min.js"></script>
	<script src="/assets/vendor/jquery.easy-pie-chart/jquery.easypiechart.min.js"></script>
	<script src="/assets/vendor/chartist/js/chartist.min.js"></script>
	<script src="/assets/scripts/klorofil-common.js"></script>
	<script>
	$(function() {
		var data, options;

		// headline charts
		data = {
			labels: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
			series: [
				[23, 29, 24, 40, 25, 24, 35],
				[14, 25, 18, 34, 29, 38, 44],
			]
		};

		options = {
			height: 300,
			showArea: true,
			showLine: false,
			showPoint: false,
			fullWidth: true,
			axisX: {
				showGrid: false
			},
			lineSmooth: false,
		};

		new Chartist.Line('#headline-chart', data, options);
		
		
		var labels = [];
        var currentDate = new Date();
        for (var i = 6; i >= 0; i--) {
            var date = new Date(currentDate);
            date.setDate(date.getDate() - i);
            labels.push(date.toLocaleDateString());
        }
		var total = ${totalMember};
        
        
		// visits trend charts --> 오른쪽 아래 차트그래프
		data = {
			labels: labels,
			series: [{
				name: 'series-real',
				data: [total, total, total, total, total, total, total],
			}]
		};

		options = {
			fullWidth: true,
			lineSmooth: false,
			height: "270px",
			low: 0,
			high: 'auto',
			series: {
				'series-projection': {
					showArea: true,
					showPoint: false,
					showLine: false
				},
			},
			axisX: {
				showGrid: false,

			},
			axisY: {
				showGrid: false,
				onlyInteger: true,
				offset: 0,
			},
			chartPadding: {
				left: 20,
				right: 20
			}
		};

		new Chartist.Line('#visits-trends-chart', data, options);


		// visits chart
		data = {
			labels: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
			series: [
				[6384, 6342, 5437, 2764, 3958, 5068, 7654]
			]
		};

		options = {
			height: 300,
			axisX: {
				showGrid: false
			},
		};

		new Chartist.Bar('#visits-chart', data, options);


		// real-time pie chart
		var sysLoad = $('#system-load').easyPieChart({
			size: 130,
			barColor: function(percent) {
				return "rgb(" + Math.round(200 * percent / 100) + ", " + Math.round(200 * (1.1 - percent / 100)) + ", 0)";
			},
			trackColor: 'rgba(245, 245, 245, 0.8)',
			scaleColor: false,
			lineWidth: 5,
			lineCap: "square",
			animate: 800
		});

		var updateInterval = 3000; // in milliseconds

		setInterval(function() {
			var randomVal;
			randomVal = getRandomInt(0, 100);

			sysLoad.data('easyPieChart').update(randomVal);
			sysLoad.find('.percent').text(randomVal);
		}, updateInterval);

		function getRandomInt(min, max) {
			return Math.floor(Math.random() * (max - min + 1)) + min;
		}

	});
	</script>
</body>

</html>
