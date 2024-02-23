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

			<div class="panel">
					
				<div style="display: flex;">
				    <div>
				        <div class="panel-heading">
				            <h3 class="panel-title" style="margin-left: 20px; margin-top: 10px;"><b>사업자관리</b></h3>
				        </div>
				    </div>
				   <form action="/admin/admin-searchbiz" method="get">
					    <div>
					        <div class="input-group" style="margin-top: 20px; margin-left: 1000px; display: flex; align-items: center;">
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
								<th>개인번호</th>
								<th>업장번호</th>
								<th>이메일</th>
								<th>가입일</th>
								<th>수정/삭제</th>
							</tr>
						</thead>
					  <c:forEach var="bizlist" items="${bizlist}">
						<tbody>
							<tr>
								<td>${bizlist.bizNo}</td>
								<td>${bizlist.bizId}</td>
								<td>${bizlist.bizBrandName}</td>
								<td>${bizlist.formatHp(bizlist.bizHp)}</td>
								<td>${bizlist.formatTel(bizlist.bizTel)}</td>
								<td>${bizlist.bizEmail}</td>
								<td>${bizlist.formatjoinAt()}</td>
								<td>
									<a href="/admin/admin-bizupdate" data-toggle="modal" data-target="#updateModal">
										<span class="label label-success">수정</span>
									</a>
									<a href="/admin/admin-bizdelete" data-toggle="modal" data-target="#deleteModal">
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
								  <a class="page-link" href="/admin/admin-biz?page=${pageVO.startPage - 1 }" aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
								  </a>
								</li>
							</c:if>


					
							<c:forEach var="i" begin="${pageVO.startPage }"
								end="${pageVO.endPage }" step="1">
								<c:set var="isActive" value="${pageVO.cri.page == i}" />
								<li class="page-item ${isActive ? 'active' : ''}"><a
									class="page-link" href="/admin/admin-biz?page=${i}"
									style="${isActive ? 'background-color: #95c4a2; color: #ffffff; border-color: #81b189;' : 'background-color: #ffffff; color: #000000; border-color: #dddddd;'}">
										${i} </a></li>
							</c:forEach>


				
							<c:if test="${pageVO.next }">
								<li class="page-item"><a class="page-link"
									href="/admin/admin-biz?page=${pageVO.endPage + 1 }"
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
	<div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	    <div class="modal-dialog" role="document">
	        <div class="modal-content"></div>
	    </div>
	</div>
	
	<!-- Modal -->
	<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
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
