
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
			<div class="panel panel-headline">
				<div class="panel-heading">
					<h3 class="panel-title">년간 매출</h3>
					<p class="panel-subtitle">Period: Oct 14, 2016 - Oct 21, 2016</p>
				</div>
				<div class="panel-body">
					<div class="row">
						<div class="col-md-9">
							<div id="headline-chart" class="ct-chart"></div>
						</div>
						<div class="col-md-3">
							<div class="weekly-summary text-right">
								<span class="number" id="annualCount">0</span> <span
									class="percentage"><i class=" text-success"></i></span> 번<span
									class="info-label">판매량</span>
							</div>
							<div class="weekly-summary text-right">
								<span class="number" id="annualTotalAmount">0</span> <span
									class="percentage"><i class=" text-success"></i></span> 원<span
									class="info-label">년간 총 수익</span>
							</div>
							<div class="weekly-summary text-right">
								<span class="number">$65,938</span> <span class="percentage"><i
									class="fa fa-caret-down text-danger"></i> 8%</span> <span
									class="info-label">총 수익</span>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- END OVERVIEW -->
			<div class="row">
				<div class="col-md-6">
					<!-- RECENT PURCHASES -->
					<div class="panel">
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

											
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<div class="panel-footer">
							<div class="row">
								<div class="col-md-6">
									<span class="panel-note"><i class="fa fa-clock-o"></i>
										결제내역을 더 보시겠습니까?</span>
								</div>
								<div class="col-md-6 text-right">
									<a href="/biz/reservation-management" class="btn btn-primary">결제 내역 보기</a>
								</div>
							</div>
						</div>
					</div>
					<!-- END RECENT PURCHASES -->
				</div>
				<div class="col-md-6">
					<!-- MULTI CHARTS -->
					<div class="panel">
						<div class="panel-heading">
							<h3 class="panel-title">한달 간 매출</h3>
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
							<div id="visits-trends-chart" class="ct-chart"></div>
						</div>
					</div>
					<!-- END MULTI CHARTS -->
				</div>
								<div class="col-md-6">
					<!-- MULTI CHARTS -->
					<div class="panel">
						<div class="panel-heading">
							<h3 class="panel-title">주간 매출</h3>
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
							<div id="visits-trends-chart2" class="ct-chart"></div>
						</div>
					</div>
					<!-- END MULTI CHARTS -->
				</div>
			</div>
			<div class="row">

				<div class="col-md-4">
					<!-- VISIT CHART -->
					<div class="panel">
						<div class="panel-heading">
							<h3 class="panel-title">남녀 비율</h3>
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


				<div class="col-md-4">
					<!-- TASKS -->
					<div class="panel">
						<div class="panel-heading">
							<h3 class="panel-title">인기 시간대</h3>
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
							<ul class="list-unstyled task-list">
								<li>
									<p>
										Updating Users Settings <span class="label-percent">23%</span>
									</p>
									<div class="progress progress-xs">
										<div class="progress-bar progress-bar-danger"
											role="progressbar" aria-valuenow="23" aria-valuemin="0"
											aria-valuemax="100" style="width: 23%">
											<span class="sr-only">23% Complete</span>
										</div>
									</div>
								</li>
								<li>
									<p>
										Load &amp; Stress Test <span class="label-percent">80%</span>
									</p>
									<div class="progress progress-xs">
										<div class="progress-bar progress-bar-success"
											role="progressbar" aria-valuenow="80" aria-valuemin="0"
											aria-valuemax="100" style="width: 80%">
											<span class="sr-only">80% Complete</span>
										</div>
									</div>
								</li>
								<li>
									<p>
										Data Duplication Check <span class="label-percent">100%</span>
									</p>
									<div class="progress progress-xs">
										<div class="progress-bar progress-bar-success"
											role="progressbar" aria-valuenow="100" aria-valuemin="0"
											aria-valuemax="100" style="width: 100%">
											<span class="sr-only">Success</span>
										</div>
									</div>
								</li>
								<li>
									<p>
										Server Check <span class="label-percent">45%</span>
									</p>
									<div class="progress progress-xs">
										<div class="progress-bar progress-bar-warning"
											role="progressbar" aria-valuenow="45" aria-valuemin="0"
											aria-valuemax="100" style="width: 45%">
											<span class="sr-only">45% Complete</span>
										</div>
									</div>
								</li>
								<li>
									<p>
										Mobile App Development <span class="label-percent">10%</span>
									</p>
									<div class="progress progress-xs">
										<div class="progress-bar progress-bar-danger"
											role="progressbar" aria-valuenow="10" aria-valuemin="0"
											aria-valuemax="100" style="width: 10%">
											<span class="sr-only">10% Complete</span>
										</div>
									</div>
								</li>
							</ul>
						</div>
					</div>
					<!-- END TASKS -->
				</div>
			</div>


			<div class="row"></div>
		</div>
	</div>
	<!-- END MAIN CONTENT -->
</div>
<!-- END MAIN -->
</div>
<!-- END WRAPPER -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script>
	$(function() {
		
		//AJAX 요청을 보냅니다.
		$.ajax({
			type : "GET",
			url : "/biz/statistic/all",
			dataType : "json",
			success : function(response) {
				printStatistics(response)
			},
			error : function(xhr, status, error) {
				console.error("에러 발생:", error);
			}
		});

		function printStatistics (response) {
			
		var annualCountForm = document.querySelector('#annualCount');
		var annualTotalAmount = document.querySelector('#annualTotalAmount');
		
			
		// 안의 데이터 추출
		var anuualList = response.annualList;
		var monthlyList = response.monthlyList;
		var weekList = response.weekList;
		
		// 판매량
		var annualCount = response.annualCount; // 년간 판매량
		var monthlyCount = response.monthlyCount; // 월간 판매량
		var weekCount = response.weekCount;	// 주간 판매량
		
		// 날짜 , 매출
		const anuualDatesArray = anuualList.map(item => item.date); // 년간 날짜 배열
		const monthlyDatesArray = monthlyList.map(item => item.date); // 월간 날짜 배열
		const weekDatesArray = weekList.map(item => item.date); // 주간 날짜 배열
		const anuualAmountArray = anuualList.map(item => item.amount); // 년간 매출 배열
		const monthlyAmountArray = monthlyList.map(item => item.amount); // 월간 매출 배열
		const weekAmountArray = weekList.map(item => item.amount); // 주간 매출 배열
		
		const totalAmount = anuualAmountArray.reduce((accumulator, currentValue) => accumulator + currentValue, 0); // 년간 총 매출

		console.log(anuualDatesArray);
		console.log(monthlyDatesArray);
		console.log(weekDatesArray);
		console.log(anuualAmountArray);
		console.log(monthlyAmountArray);
		console.log(weekAmountArray);

		annualCountForm.innerText = annualCount // 총 판매량
		annualTotalAmount.innerText = totalAmount // 총 판매량
		
		// 그래프 시작 !!
		var data, options;
		// 연간 매출
		data = {
			labels: anuualDatesArray,
			series: [
				
				anuualAmountArray
				,anuualAmountArray
			]
		};

		options = {
			height: 300,
			showArea: true,
			showLine: true,
			showPoint: true,
			fullWidth: true,
			axisX: {
				showGrid: true
			},
			lineSmooth: true,
		};

		new Chartist.Line('#headline-chart', data, options);


		// 월간 매출
		data = {
			labels: monthlyDatesArray,	// 월간 날짜
			series: [{
				name: 'series-real',
				data: monthlyAmountArray,	// 월간 매출
			}, {
				name: 'series-projection',
				data: monthlyAmountArray,	// 월간 매출
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
				showGrid: true,
				onlyInteger: true,
				offset: 0,
			},
			chartPadding: {
				left: 20,
				right: 20
			}
		};

		new Chartist.Line('#visits-trends-chart', data, options);

		
		// 주간 매출
		data = {
			labels: weekDatesArray,	// 주간 날짜
			series: [{
				name: 'series-real',
				data: weekAmountArray,	// 주간 매출
			}, {
				name: 'series-projection',
				data: weekAmountArray,	// 주간 매출
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
				showGrid: true,
				onlyInteger: true,
				offset: 0,
			},
			chartPadding: {
				left: 20,
				right: 20
			}
		};

		new Chartist.Line('#visits-trends-chart2', data, options);

		// 남녀 비율
		data = {
			labels: weekDatesArray,
			series: [
				weekAmountArray
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
				return "rgb(" + Math.round(330 * percent / 100) + ", " + Math.round(200 * (1.1 - percent / 100)) + ", 0)";
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

			// sysLoad.data('easyPieChart').update(randomVal);
			sysLoad.find('.percent').text(randomVal);
		}, updateInterval);

		function getRandomInt(min, max) {
			return Math.floor(Math.random() * (max - min + 1)) + min;
		}
		}
	});
	</script>
<!-- adminside.jsp -->
<%@ include file="/WEB-INF/view/biz/common/biz_footer.jsp"%>