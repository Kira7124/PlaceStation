<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/layout/header.jsp"%>
<!-- history content 시작 -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/boxicons/2.1.0/css/boxicons.min.css"
	integrity="sha512-pVCM5+SN2+qwj36KonHToF2p1oIvoU3bsqxphdOIWMYmgr4ZqD3t5DjKvvetKhXGc/ZG5REYTT6ltKfExEei/Q=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/MaterialDesign-Webfont/5.3.45/css/materialdesignicons.css"
	integrity="sha256-NAxhqDvtY0l4xn+YVa6WjAcmd94NNfttjNsDmNatFVc="
	crossorigin="anonymous" />
<style>
body {
	margin-top: 20px;
	background-color: #eee;
}

.project-list-table {
	border-collapse: separate;
	border-spacing: 0 12px
}

.project-list-table tr {
	background-color: #fff
}

.table-nowrap td, .table-nowrap th {
	white-space: nowrap;
}

.table-borderless>:not(caption)>*>* {
	border-bottom-width: 0;
}

.table>:not(caption)>*>* {
	padding: 0.75rem 0.75rem;
	background-color: var(--bs-table-bg);
	border-bottom-width: 1px;
	box-shadow: inset 0 0 0 9999px var(--bs-table-accent-bg);
}

.avatar-sm {
	height: 2rem;
	width: 2rem;
}

.rounded-circle {
	border-radius: 50% !important;
}

.me-2 {
	margin-right: 0.5rem !important;
}

img, svg {
	vertical-align: middle;
}

a {
	color: #3b76e1;
	text-decoration: none;
}

.badge-soft-danger {
	color: #f56e6e !important;
	background-color: rgba(245, 110, 110, .1);
}

.badge-soft-success {
	color: #63ad6f !important;
	background-color: rgba(99, 173, 111, .1);
}

.badge-soft-primary {
	color: #3b76e1 !important;
	background-color: rgba(59, 118, 225, .1);
}

.badge-soft-info {
	color: #57c9eb !important;
	background-color: rgba(87, 201, 235, .1);
}

.avatar-title {
	align-items: center;
	background-color: #3b76e1;
	color: #fff;
	display: flex;
	font-weight: 500;
	height: 100%;
	justify-content: center;
	width: 100%;
}

.bg-soft-primary {
	background-color: rgba(59, 118, 225, .25) !important;
}
</style>
<!--  프로필 content 시작  -->
<section class="module"
	style="align-items: center; align-content: space-between; flex-wrap: nowrap; flex-direction: row-reverse; justify-content: flex-start;">
	<div class="container rounded bg-white mt-5 mb-5"
		style="display: flex; align-content: space-between; flex-wrap: wrap; flex-direction: row; align-items: baseline;">
		<div class="row" style="flex-direction: column;">

			<div class="col-md-10 border-right"
				style="display: flex; justify-content: space-between;">
				<div class="col-md-2 border-right"
					style="margin-top: 5%; display: inline-block; width: 250px;">

					<%@ include file="/WEB-INF/view/layout/myPageAside.jsp"%>
				</div>
				<!-- 리스트 start -->

				<div class="container"
					style="display: flex; flex-direction: column; justify-content: space-between;">
					<div class="row align-items-center">
						<div class="col-md-6">
							<div class="mb-3">
								<h2 class="card-title">찜 목록</h2>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-lg-12">
							<div class="">
								<div class="table-responsive">
									<c:forEach items="${wishList}" var="wishList">
									<input type="hidden" value="${wishList.prodNo }" id="prodNo">
										<table
											class="table project-list-table table-nowrap align-middle table-borderless">
											<thead>
												<tr>
													<th scope="col">Name</th>
													<th scope="col">Title</th>
													<th scope="col">Price</th>
													<th scope="col">Address</th>
													<th scope="col" style="width: 200px;">Delete</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td><a href="#" class="text-body">${wishList.prodWriterNo}</a></td>
													<td>${wishList.prodTitle}</td>
													<td>${wishList.prodPrice }</td>
													<td>${wishList.prodFullAddress}</td>
													<td>
													
															<a id="deletebtn">삭제</a>
													</td>
												</tr>
											</tbody>
										</table>
									</c:forEach>
								</div>
							</div>
						</div>
					</div>
					<div class="row g-0 align-items-center pb-4">
						<div class="col-sm-6">

							<!-- nav start 긁어가기  -->
							<nav aria-label="Page navigation example"
								style="display: flex; justify-content: center;">
								<ul class="pagination">
									<c:if test="${pageVO.prev }">
										<li class="page-item"><a class="page-link"
											href="/user/mypage/wishlist?page=${pageVO.startPage - 1 }"
											aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
										</a></li>
									</c:if>



									<c:forEach var="i" begin="${pageVO.startPage }"
										end="${pageVO.endPage }" step="1">
										<c:set var="isActive" value="${pageVO.cri.page == i}" />
										<li class="page-item ${isActive ? 'active' : ''}"><a
											class="page-link" href="/user/mypage/wishlist?page=${i}"
											style="${isActive ? 'background-color: #95c4a2; color: #ffffff; border-color: #81b189;' : 'background-color: #ffffff; color: #000000; border-color: #dddddd;'}">
												${i} </a></li>
									</c:forEach>



									<c:if test="${pageVO.next }">
										<li class="page-item"><a class="page-link"
											href="/user/mypage/wishlist?page=${pageVO.endPage + 1 }"
											aria-label="Next"> <span aria-hidden="true">&raquo;</span>
												<!-- href="/admin/admin-member 여기 주소만 바꾸면됨 -->
										</a></li>
									</c:if>

								</ul>
							</nav>
							<!-- nav end  -->


						</div>
					</div>
				</div>
				<!-- 리스트 end -->
			</div>
		</div>
	</div>
</section>
<!--  프로필 content 끝 -->
</div>
</div>

<script>
<script>
$(document).ready(function() {
    // 삭제 링크 클릭 이벤트 핸들러
    $("#deletebtn").click(function(event) {
        
        // 삭제할 상품 번호 가져오기
        var prodNo = $("#prodNo").val();
        
        // AJAX 요청 보내기
        $.ajax({
            type: "POST",
            url: "/user/deleteWish",
            data: { prodNo: prodNo }, // 상품 번호 전달
            success: function(response) {
                // 성공 시 처리
                console.log("삭제 요청이 성공했습니다.");
                window.location.href = "/user/mypage_wishlist"; // 페이지 새로고침
            },
            error: function(xhr, status, error) {
                // 실패 시 처리
                console.error("삭제 요청이 실패했습니다.");
                console.error(error);
            }
        });
    });
});
</script>
</script>
<%@ include file="/WEB-INF/view/layout/footer.jsp"%>