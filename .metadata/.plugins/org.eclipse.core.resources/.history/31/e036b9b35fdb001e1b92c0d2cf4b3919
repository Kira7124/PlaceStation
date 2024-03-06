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
		
		
		
		
		
			<div style="display: flex;">
				    <div>
				        <div class="panel-heading">
				            <h3 class="panel-title" style="margin-left: 5px; margin-top: 10px;"><b>결제/예약관리</b></h3>
				        </div>
				    </div>
				   <form action="/admin/admin-searchpayment" method="get">
					    <div>
					        <div class="input-group" style="margin-top: 20px; margin-left: 1500px; display: flex; align-items: center;">
					        	<select name="searchOption" class="form-control" style="width: 100px; margin-right: 2px;">
					        			<option value="bank">은행</option>
								        <option value="admin_his_prod_name">상품명</option>
				   				</select>
					            <input type="text" name="searchKeyword" class="form-control" placeholder="키워드입력">
					            <span class="input-group-btn">
					                <button type="submit" class="btn btn-primary" >검색</button>
					            </span>
					        </div>
					    </div>
				    </form> 
				</div>
				
				
				
				
				
				<div class="panel-body no-padding">
					<table class="table table-striped" style="width: 95%; margin: auto;">
						<thead>
							<tr>
								<th>상품번호</th>
								<th>사업자회원번호</th>
								<th>사업자아이디</th>
								<th>사업자잔액</th>
								<th>결제금액</th>
								<th>상품명</th>
								<th>은행</th>
								<th>구매확정</th>
								<th>환불</th>
							</tr>
						</thead>
					<c:forEach var="paymentlist" items="${paymentlist}">
						<tbody>
							<tr>
								<td>${paymentlist.adminHisProdNo}</td>
								<td>${paymentlist.bizId}</td>
								<td>${paymentlist.userId}</td>
								<td>${paymentlist.bizBalance}</td>
								<td>${paymentlist.adminHisPrice}</td>
								<td>${paymentlist.adminHisProdName}</td>
								<td>${paymentlist.bank}</td>
								<td>
								    <c:choose>
								        <c:when test="${paymentlist.adminHisConfirm}">
								            <span class="label label-success">확정</span>
								        </c:when>
								        <c:otherwise>
								            <span class="label label-danger">취소</span>
								        </c:otherwise>
								    </c:choose>
								</td>
								<td>
								    <c:choose>
								        <c:when test="${paymentlist.cancelYn eq 'N'}">
								          <a href ="/admin/admin-paymentcancel" data-toggle="modal" data-target="#cancelModal" >
								            <span class="label label-info">환불</span>
								          </a>
								        </c:when>
								        <c:when test="${paymentlist.cancelYn eq 'Y'}">
								          <a href="/admin/admin-refund?adminHisProdNo=${paymentlist.adminHisProdNo}">
								            <span class="label label-info">환불완료</span>
								          </a>   
								        </c:when>
								    </c:choose>
								</td>																	
							</tr>
						</tbody>
					  </c:forEach>
					</table>
					
					<nav aria-label="Page navigation example" style="display: flex; justify-content: center;">
						<ul class="pagination">
							<c:if test="${pageVO.prev }">
								<li class="page-item">
								  <a class="page-link" href="/admin/admin-payment?page=${pageVO.startPage - 1 }" aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
								  </a>
								</li>
							</c:if>


					
							<c:forEach var="i" begin="${pageVO.startPage }"
								end="${pageVO.endPage }" step="1">
								<c:set var="isActive" value="${pageVO.cri.page == i}" />
								<li class="page-item ${isActive ? 'active' : ''}"><a
									class="page-link" href="/admin/admin-payment?page=${i}"
									style="${isActive ? 'background-color: #95c4a2; color: #ffffff; border-color: #81b189;' : 'background-color: #ffffff; color: #000000; border-color: #dddddd;'}">
										${i} </a></li>
							</c:forEach>


				
							<c:if test="${pageVO.next }">
								<li class="page-item"><a class="page-link"
									href="/admin/admin-payment?page=${pageVO.endPage + 1 }"
									aria-label="Next"> <span aria-hidden="true">&raquo;</span>
								</a></li>
							</c:if>

						</ul>
					 </nav>
					
					
					
					
					
					
					
					
					
					
					
				</div>
			</div>

		</div>
			<!-- END MAIN CONTENT -->
		</div>
		<!-- END MAIN -->	
	</div>
	<!-- END WRAPPER -->
	
				
	
	
	
	<!-- Modal -->
	<div class="modal fade" id="cancelModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
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
