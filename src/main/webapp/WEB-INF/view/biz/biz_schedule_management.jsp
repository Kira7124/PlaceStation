
<%@page import="com.project3.placestation.biz.model.dto.ScheduleDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- adminheader.jsp -->
<%@ include file="/WEB-INF/view/biz/common/biz_header.jsp"%>
<!-- adminside.jsp -->
<%@ include file="/WEB-INF/view/biz/common/biz_aside.jsp"%>
<style>
/* 일요일 날짜 빨간색 */
.fc-day-sun a {
  color: red;
  text-decoration: none;
}

/* 토요일 날짜 파란색 */
.fc-day-sat a {
  color: blue;
  text-decoration: none;
}
</style>
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
					<div class="panel" style="padding: 10px;">
						<div class="panel-heading">
							<h3 class="panel-title">일정 관리 시스템</h3>
							<div class="right">
								<button type="button" class="btn-toggle-collapse">
									<i class="lnr lnr-chevron-up"></i>
								</button>
								<button type="button" class="btn-remove">
									<i class="lnr lnr-cross"></i>
								</button>
							</div>
						</div>
						<div class="panel-body no-padding container">
							<div class="col-md-7">
								<div id='calendar'></div>
							</div>
							<div class="col-md-5">
								<div id='calendar2'></div>
							</div>
						</div>
						<div class="panel-footer">
							<div class="row">
								<div class="col-md-6">
									<span class="panel-note"><i class="fa fa-clock-o"></i>
										이용자 결제 내역을 보시겠습니까?</span>
								</div>
								<div class="col-md-6 text-right">
									<a href="/biz/reservation-management?page=0&size=20" class="btn btn-primary">결제
										내역 보기</a>
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

<script
	src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.10/index.global.min.js'></script>
<script src='fullcalendar/dist/index.global.js'></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script>
	//AJAX 요청을 보냅니다.
	$.ajax({
		type : "GET",
		url : "/biz/schedule-management/rest",
		dataType : "json",
		success : function(response) {
			// 성공적으로 응답을 받았을 때 실행되는 함수입니다.
			console.log("응답 받음:", response);
			readyCalendar(response);
			readyCalendar2(response);
		},
		error : function(xhr, status, error) {
			console.error("에러 발생:", error);
		}
	});

	// 1번 캘린더 - 월
	function readyCalendar(response) {
		var calendarEl = document.getElementById('calendar');
		var calendar = new FullCalendar.Calendar(calendarEl, {
			initialView : 'dayGridMonth',
			selectable : true,
			events : response,
			dateClick : function(info) {
				console.log(info.dateStr);
			},
			eventTimeFormat : { // like '14:30:00'
				hour : '2-digit',
				minute : '2-digit',
				hour12 : true
			},
			eventMouseEnter : function(info) {
				info.event.setProp('backgroundColor', '#00CCFF');
			}
		//,
		//eventClick: function (info) {
		//    alert("Clicked!!");
		//},
		});
		calendar.render();
	};

	// 2번 캘린더 - 타임라인
	function readyCalendar2(response) {
		var calendarEl = document.getElementById('calendar2');
		var calendar = new FullCalendar.Calendar(calendarEl, {
			initialView : 'listWeek',
			selectable : true,
			events : response,

		});
		calendar.render();
	};
</script>

<!-- adminside.jsp -->
<%@ include file="/WEB-INF/view/biz/common/biz_footer.jsp"%>