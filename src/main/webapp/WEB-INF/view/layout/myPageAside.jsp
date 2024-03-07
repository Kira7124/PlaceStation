<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div>
	<div class="d-flex flex-column align-items-center text-center p-3 py-5"
		style="position: relative;">
		<img class="rounded-circle mt-5" id="profileImage"
			style="border-radius: 50%; /* 이 값은 원의 반지름을 결정합니다. 50%는 이미지를 완전한 원 모양으로 만듭니다. */ overflow: hidden; /* border-radius를 사용할 때 이미지의 경계를 제대로 처리하기 위해 필요합니다. */ width: 200px; /* 이미지의 너비 */ height: 200px; /"
			src="${User.filepath}"><!-- http://localhost/filedb/get-file/1d1e60d9470e4d39827b7ee5f4ff296b -->

		<input type="file" id="fileInput" name="uppath" style="display: none;" value="${User.filepath }" />

	</div>
</div>
<br>
<br>
<div style="width: 100%;">
	<ul class="list-group" style="text-align: center;">
		<li class="list-group-item disabled" ><a
			href="/user/mypage/history">결제내역</a></li>
		<li class="list-group-item"><a href="/user/mypage/wishlist">찜목록</a></li>
		<li class="list-group-item"><a href="/cs/qna">문의
				내역</a></li>
		<li class="list-group-item"><a href="/user/mypage/main">내정보
				변경</a></li>
		<li class="list-group-item"><a
			href="/user/mypage/managementParty">모임 내역 관리</a></li>
	</ul>
</div>
