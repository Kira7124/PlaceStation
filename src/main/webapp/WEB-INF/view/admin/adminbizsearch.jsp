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
				            <h3 class="panel-title" style="margin-left: 20px; margin-top: 10px;"><b>회원관리</b></h3>
				        </div>
				    </div>
				   <form action="/admin/admin-searchbiz" method="get">
					    <div>
					        <div class="input-group" style="margin-top: 20px; margin-left: 1500px; display: flex; align-items: center;">
					        	<select name="searchOption" class="form-control" style="width: 110px; margin-right: 2px;">
					        			<option value="biz_brand_name">브랜드명</option>
								        <option value="biz_id">아이디</option>
								        <option value="biz_email">이메일</option>
								        <option  value="join_at">가입일</option>
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
								<th>번호</th>
								<th>아이디</th>
								<th>브랜드명</th>
								<th>잔액</th>
								<th>개인번호</th>
								<th>업장번호</th>
								<th>이메일</th>
								<th>가입일</th>
								<th>등록증</th>
								<th>수정/삭제</th>
							</tr>
						</thead>
					  <c:forEach var="bizlist" items="${bizlist}">
						<tbody>
							<tr>
								<td>${bizlist.bizNo}</td>
								<td>${bizlist.userId}</td>
								<td>${bizlist.bizBrandName}</td>
								<td>${bizlist.bizBalance}</td>
								<td>${bizlist.formatHp(bizlist.bizHp)}</td>
								<td>${bizlist.formatTel(bizlist.bizTel)}</td>
								<td>${bizlist.bizEmail}</td>
								<td>${bizlist.formatjoinAt()}</td>
								<td>
								   <a href="/admin/admin-bizcheck?bizNo=${bizlist.bizNo}">
									  <span class="label label-info">확인</span>
								   </a> 
								</td>
								<td>
									<a href="/admin/admin-bizupdate" data-toggle="modal" data-target="#updateBizModal">
										<span class="label label-success">수정</span>
									</a>
									<a href="/admin/admin-bizdelete" data-toggle="modal" data-target="#deleteBizModal">
									   <span class="label label-danger">삭제</span>
									</a>
								</td>								
							</tr>
						</tbody>
					  </c:forEach>	
					</table>
					
					
					<nav aria-label="Page navigation example" style="display: flex; justify-content: center;">
						<ul class="pagination">
							<c:if test="${pageVO.prev }">
								<li class="page-item">
								  <a class="page-link" href="/admin/admin-searchbiz?page=${pageVO.startPage - 1 }&searchKeyword=${pageVO.cri.searchKeyword}&searchOption=${pageVO.cri.searchOption}" aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
								  </a>
								</li>
							</c:if>


					
							<c:forEach var="i" begin="${pageVO.startPage }"
								end="${pageVO.endPage }" step="1">
								<c:set var="isActive" value="${pageVO.cri.page == i}" />
								<li class="page-item ${isActive ? 'active' : ''}"><a
									class="page-link" href="/admin/admin-searchbiz?page=${i}&searchKeyword=${pageVO.cri.searchKeyword}&searchOption=${pageVO.cri.searchOption}"
									style="${isActive ? 'background-color: #95c4a2; color: #ffffff; border-color: #81b189;' : 'background-color: #ffffff; color: #000000; border-color: #dddddd;'}">
										${i} </a></li>
							</c:forEach>


				
							<c:if test="${pageVO.next }">
								<li class="page-item"><a class="page-link"
									href="/admin/admin-searchbiz?page=${pageVO.endPage + 1 }&searchKeyword=${pageVO.cri.searchKeyword}&searchOption=${pageVO.cri.searchOption}"
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
	<div class="modal fade" id="updateBizModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	    <div class="modal-dialog" role="document">
	        <div class="modal-content"></div>
	    </div>
	</div>
	
	<!-- Modal -->
	<div class="modal fade" id="deleteBizModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
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
