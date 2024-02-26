<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    




<!-- LEFT SIDEBAR -->
		<div id="sidebar-nav" class="sidebar">
			<div class="sidebar-scroll">
				<nav>
					<ul class="nav">
						<li><a href="/admin/admin-main" class="active"><i class="lnr lnr-home"></i> <span>관리자페이지</span></a></li>
						<li><a href="/admin/admin-member" class=""><i class="lnr lnr-code"></i><span>유저관리</span></a></li>
						<li><a href="/admin/admin-biz" class=""><i class="lnr lnr-cog"></i> <span>사업자관리</span></a></li>
						<li>
							<a href="#subPages" data-toggle="collapse" class="collapsed"><i class="lnr lnr-file-empty"></i> <span>게시물관리</span> <i class="icon-submenu lnr lnr-chevron-left"></i></a>
							<div id="subPages" class="collapse ">
								<ul class="nav">
									<li><a href="/admin/admin-notice" class="">공지사항</a></li>
									<li><a href="/admin/admin-qna" class="">1:1문의</a></li>
								</ul>
							</div>
						</li>
						<li><a href="/admin/admin-banner" class=""><i class="lnr lnr-cog"></i> <span>광고관리</span></a></li>
						<li><a href="/admin/admin-payment" class=""><i class="lnr lnr-cog"></i> <span>결제/예약관리</span></a></li>
					</ul>
				</nav>
			</div>
		</div>
<!-- END LEFT SIDEBAR -->    