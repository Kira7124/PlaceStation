<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<!-- adminheader.jsp -->
    <%@ include file ="/WEB-INF/view/admin/adminheader.jsp" %>
	<!-- adminside.jsp -->
    <%@ include file ="/WEB-INF/view/admin/adminside.jsp" %>
    

		
		<!-- MAIN -->
		<div class="main">
			<!-- MAIN CONTENT -->
			<div class="main-content">
				<div class="container-fluid">

					<div class="panel">
				<div class="panel-heading">
					<h3 class="panel-title">결제/예약관리</h3>
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
					<table class="table table-striped" style="width: 95%; margin: auto;">
						<thead>
							<tr>
								<th>상품명</th>
								<th>아이디</th>
								<th>금액</th>
								<th>이메일</th>
								<th>은행</th>
								<th>예약일</th>
								<th>환불</th>
								<th>수정</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td><a href="#">763648</a></td>
								<td>Steve</td>
								<td>$122</td>
								<td>Oct 21, 2016</td>
								<td><span class="label label-success">COMPLETED</span></td>
								<td><span class="label label-success">COMPLETED</span></td>
								<td><span class="label label-success">COMPLETED</span></td>
								<td><span class="label label-success">COMPLETED</span></td>
							</tr>
							<tr>
								<td><a href="#">763649</a></td>
								<td>Amber</td>
								<td>$62</td>
								<td>Oct 21, 2016</td>
								<td><span class="label label-warning">PENDING</span></td>
								<td><span class="label label-warning">PENDING</span></td>
								<td><span class="label label-warning">PENDING</span></td>
								<td><span class="label label-warning">PENDING</span></td>								
							</tr>
							<tr>
								<td><a href="#">763650</a></td>
								<td>Michael</td>
								<td>$34</td>
								<td>Oct 18, 2016</td>
								<td><span class="label label-danger">FAILED</span></td>
								<td><span class="label label-danger">FAILED</span></td>
								<td><span class="label label-danger">FAILED</span></td>
								<td><span class="label label-danger">FAILED</span></td>
							</tr>
							<tr>
								<td><a href="#">763651</a></td>
								<td>Roger</td>
								<td>$186</td>
								<td>Oct 17, 2016</td>
								<td><span class="label label-success">SUCCESS</span></td>
								<td><span class="label label-success">SUCCESS</span></td>
								<td><span class="label label-success">SUCCESS</span></td>
								<td><span class="label label-success">SUCCESS</span></td>
							</tr>
							<tr>
								<td><a href="#">763652</a></td>
								<td>Smith</td>
								<td>$362</td>
								<td>Oct 16, 2016</td>
								<td><span class="label label-success">SUCCESS</span></td>
								<td><span class="label label-success">SUCCESS</span></td>
								<td><span class="label label-success">SUCCESS</span></td>
								<td><span class="label label-success">SUCCESS</span></td>
							</tr>
						</tbody>
					</table>
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


		// visits trend charts
		data = {
			labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
			series: [{
				name: 'series-real',
				data: [200, 380, 350, 320, 410, 450, 570, 400, 555, 620, 750, 900],
			}, {
				name: 'series-projection',
				data: [240, 350, 360, 380, 400, 450, 480, 523, 555, 600, 700, 800],
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
