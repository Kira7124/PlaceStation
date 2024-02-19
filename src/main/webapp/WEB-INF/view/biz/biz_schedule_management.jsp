
<%@page import="com.project3.placestation.biz.model.dto.ScheduleDto"%>
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
					<div class="panel" style="padding: 30px;">
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

							<div id='calendar' style="width: 70%; margin-bottom: 20px"></div>


						</div>
						<div class="panel-footer">
							<div class="row">
								<div class="col-md-6">
									<span class="panel-note"><i class="fa fa-clock-o"></i>
										이용자 결제 내역을 보시겠습니까?</span>
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
		<!-- END MAIN CONTENT -->
	</div>
	<!-- END MAIN -->
</div>
<!-- END WRAPPER -->

<script
	src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.10/index.global.min.js'></script>
<script src='fullcalendar/dist/index.global.js'></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
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
		},
		error : function(xhr, status, error) {
			console.error("에러 발생:", error);
		}
	});

	function readyCalendar(response) {
		var calendarEl = document.getElementById('calendar');
		var calendar = new FullCalendar.Calendar(calendarEl, {
			initialView : 'dayGridMonth',
			selectable : true,
			events : response,
			dateClick : function(info) {
				console.log(info.dateStr);
			}
		});
		calendar.render();
	};
</script>

<!-- adminside.jsp -->
<%@ include file="/WEB-INF/view/biz/common/biz_footer.jsp"%>