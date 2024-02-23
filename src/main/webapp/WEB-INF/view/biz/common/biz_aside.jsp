<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- LEFT SIDEBAR -->
<div id="sidebar-nav" class="sidebar">
	<div class="sidebar-scroll">
		<nav>
			<ul class="nav">
				<li><a href="/biz/main" class="active"><i
						class="lnr lnr-home"></i> <span>사업자 페이지</span></a></li>
				<li><a href="/biz/statistics" class=""><i class="lnr lnr-code"></i> <span>통계</span></a></li>
				<li><a href="/biz/schedule-management" class=""><i
						class="lnr lnr-chart-bars"></i> <span>일정관리</span></a></li>
				<li><a href="/biz/reservation-management" class=""><i
						class="lnr lnr-cog"></i> <span>결제/예약관리</span></a></li>
										<li><a href="/biz/product-management" class=""><i
						class="lnr lnr-cog"></i> <span>상품 관리</span></a></li>
				<li><a href="/biz/account-management" class=""><i
						class="lnr lnr-cog"></i> <span>계정 관리</span></a></li>
				<li><a href="#subPages" data-toggle="collapse"
					class="collapsed"><i class="lnr lnr-file-empty"></i> <span>문의 내역</span>
						<i class="icon-submenu lnr lnr-chevron-left"></i></a>
					<div id="subPages" class="collapse ">
						<ul class="nav">
							<li><a href="/biz/biz-notice" class="">공지사항</a></li>
							<li><a href="/biz/biz-qna" class="">1:1문의</a></li>
						</ul>
					</div></li>
			</ul>
		</nav>
	</div>
</div>
<!-- END LEFT SIDEBAR -->
