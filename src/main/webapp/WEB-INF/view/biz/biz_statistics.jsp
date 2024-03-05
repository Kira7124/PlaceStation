
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
					<h3 class="panel-title">년간 통계</h3>
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
									class="info-label">정상 판매량</span>

							</div>
							<div class="weekly-summary text-right">
								<span class="number" id="annualTotalAmount">0</span> <span
									class="percentage"><i class=" text-success"></i></span> 원<span
									class="info-label">년간 총 매출</span>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- END OVERVIEW -->
			<div class="row">

				<div class="col-md-6">

					<div class="col-md-12">
						<!-- VISIT CHART -->
						<div class="panel">
							<div class="panel-heading">
								<h3 class="panel-title">월 수수료 통계</h3>
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
								<div id="monthly-fee" class="ct-chart"></div>
							</div>
						</div>
						<!-- END VISIT CHART -->
					</div>
					<div class="col-md-12">
						<!-- VISIT CHART -->
						<div class="panel">
							<div class="panel-heading">
								<h3 class="panel-title">단골 고객 TOP 5</h3>
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
								<table class="table table-borderless">
									<thead>
										<tr>
											<th scope="col">고객</th>
											<th scope="col">구매 개수</th>
											<th scope="col">고객 등급</th>
											<th scope="col">성별</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="member" items="${topTen}">
											<tr>
												<th scope="row">
													<div>
														<img src="${member.filePath}"
															style="border-radius: 50%; width: 50px; height: 50px;" />
													</div>
													<div>
														<p>${member.userName}님</p>
													</div>
												</th>
												<td>${member.count}개</td>
												<td>${member.grade}등급</td>
												<td>${member.gender}</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
						<!-- END VISIT CHART -->
					</div>
				</div>

				<div class="col-md-6">
					<!-- MULTI CHARTS -->
					<div class="panel">
						<div class="panel-heading">
							<h3 class="panel-title">한달 간 통계</h3>
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
							<div class="col-md-9">
								<div id="visits-trends-chart" class="ct-chart"></div>
							</div>
							<div class="col-md-3">
								<div class="weekly-summary text-right">
									<span class="number" id="monthlyCount">0</span> <span
										class="percentage"><i class=" text-success"></i></span> 번<span
										class="info-label">정상 판매량</span>
								</div>
								<div class="weekly-summary text-right">
									<span class="number" id="monthlyTotalAmount">0</span> <span
										class="percentage"><i class=" text-success"></i></span> 원<span
										class="info-label">월간 총 매출</span>
								</div>
							</div>
						</div>
					</div>
					<!-- END MULTI CHARTS -->
				</div>
				<div class="col-md-6">
					<!-- MULTI CHARTS -->
					<div class="panel">
						<div class="panel-heading">
							<h3 class="panel-title">주간 통계</h3>
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
							<div class="col-md-9">
								<div id="visits-trends-chart2" class="ct-chart"></div>
							</div>

							<div class="col-md-3">
								<div class="weekly-summary text-right">
									<span class="number" id="weekCount">0</span> <span
										class="percentage"><i class=" text-success"></i></span> 번<span
										class="info-label">정상 판매량</span>
								</div>
								<div class="weekly-summary text-right">
									<span class="number" id="weekTotalAmount">0</span> <span
										class="percentage"><i class=" text-success"></i></span> 원<span
										class="info-label">주간 총 매출</span>
								</div>
							</div>
						</div>
						<!-- END MULTI CHARTS -->
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
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
											<th>가격</th>
											<th>인원 수</th>
											<th>은행</th>
											<th>이용 날짜 &amp; 시간</th>
											<th>결제 날짜 &amp; 시간</th>
											<th>결제</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="history" items="${history}">
											<tr>
												<td>${history.adminHisNo}</td>
												<td>${history.adminHisPrice}</td>
												<td>${history.peopleCount}명</td>
												<td>${history.bank}</td>
												<c:if test="${history.cancelYn == 'N'}">
													<td>${history.purchaseDate}&nbsp
														${history.startTime}:00~ ${history.endTime}:00</td>
												</c:if>
												<c:if test="${history.cancelYn == 'Y'}">
													<td><span class="label label-danger">환불 처리</span></td>
												</c:if>
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
										<a href="/biz/reservation-management" class="btn btn-primary">결제
											내역 보기</a>
									</div>
								</div>
							</div>
						</div>
						<!-- END RECENT PURCHASES -->
					</div>

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
		
		// 콤마 표시
		const comma = (amount) => {
		var result = amount.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
		return result;
		}

		// 통계 화면에 표시
		function printStatistics (response) {
			
		var annualCountForm = document.querySelector('#annualCount');	// 년간 판매량
		var annualTotalAmountForm = document.querySelector('#annualTotalAmount'); // 년간 총 매출
		var monthlyCountForm = document.querySelector('#monthlyCount');	// 년간 판매량
		var monthlyTotalAmountForm = document.querySelector('#monthlyTotalAmount'); // 년간 총 매출
		var weekCountForm = document.querySelector('#weekCount');	// 년간 판매량
		var weekTotalAmountForm = document.querySelector('#weekTotalAmount'); // 년간 총 매출
		// 안의 데이터 추출
		var anuualList = response.annualList;
		var monthlyList = response.monthlyList;
		var weekList = response.weekList;
		
		// 판매량
		var annualCount = response.annualCount; // 년간 판매량
		var monthlyCount = response.monthlyCount; // 월간 판매량
		var weekCount = response.weekCount;	// 주간 판매량
		
		// 날짜 , 매출
		const annualDatesArray = anuualList.map(item => item.date); // 년간 날짜 배열
		const monthlyDatesArray = monthlyList.map(item => item.date); // 월간 날짜 배열
		const weekDatesArray = weekList.map(item => item.date); // 주간 날짜 배열
		const anuualAmountArray = anuualList.map(item => item.amount); // 년간 매출 배열
		const monthlyAmountArray = monthlyList.map(item => item.amount); // 월간 매출 배열
		const weekAmountArray = weekList.map(item => item.amount); // 주간 매출 배열
		
		// 년간 총 매출
		let annaulTotalAmount = anuualAmountArray.reduce((accumulator, currentValue) => accumulator + currentValue, 0); // 년간 총 매출
		annaulTotalAmount = comma(annaulTotalAmount);
		
		// 월간 총 매출
		let monthlyTotalAmount = monthlyAmountArray.reduce((accumulator, currentValue) => accumulator + currentValue, 0); // 년간 총 매출
		monthlyTotalAmount = comma(monthlyTotalAmount);
		// 주간 총 매출
		let weekTotalAmount = weekAmountArray.reduce((accumulator, currentValue) => accumulator + currentValue, 0); // 년간 총 매출
		weekTotalAmount = comma(weekTotalAmount);
		
		annualCountForm.innerText = annualCount // 년간 총 판매량
		annualTotalAmountForm.innerText = annaulTotalAmount // 년간 총 매출
		monthlyCountForm.innerText = monthlyCount // 월간 총 판매량
		monthlyTotalAmountForm.innerText = monthlyTotalAmount // 월간 총 매출
		weekCountForm.innerText = weekCount // 주간 총 판매량
		weekTotalAmountForm.innerText = weekTotalAmount // 년주간 총 매출
		
		// 그래프 시작 !!
		var data, options;
		// 연간 매출
		data = {
			labels: annualDatesArray,
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

		console.log(response.monthlyFeeDate)
		console.log(response.monthlyFeeCharge)
		// 월 수수료 통계
		data = {
			labels: response.monthlyFeeDate,
			series: [
				response.monthlyFeeCharge
			]
		};

		options = {
			height: 300,
			axisX: {
				showGrid: false
			},
		};

		new Chartist.Bar('#monthly-fee', data, options);
		}
	});
	</script>
<!-- adminside.jsp -->
<%@ include file="/WEB-INF/view/biz/common/biz_footer.jsp"%>